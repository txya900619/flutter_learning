import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mobx/AudioStore/AudioStore.dart';

class AudioSelector extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    final AudioStore audioStore = Provider.of<AudioStore>(ctx, listen: false);
    return Observer(
      builder: (ctx) {
        if (audioStore.audioPathFetchState == AudioPathFetchState.FetchSuccess) {
          List<String> audioPaths = audioStore.audioPaths;
          if (audioPaths.isEmpty) {
            return Center(
              child: Text("File not found!"),
            );
          }

          return ListView.builder(
            itemCount: audioPaths.length,
            itemBuilder: (ctx, index) {
              return Observer(
                builder: (ctx){
                  if (index == audioStore.currentIndex) {
                    final double duration = audioStore?.currentDuration?.inMilliseconds?.toDouble()??0;
                    final double position = audioStore?.currentPosition?.inMilliseconds?.toDouble()??0;

                    return Card(
                      child: ListTile(
                        leading: audioStore.audioPlayerState== AudioPlayerState.PAUSED
                            ? Icon(Icons.play_arrow)
                            : Icon(Icons.pause),
                        title: Slider(
                          min: 0,
                          max: duration,
                          value: position,
                          onChanged: (newPosition) {
                            if (newPosition > duration) {
                              newPosition = duration;
                            } else if (newPosition < 0) {
                              newPosition = 0;
                            }
                            audioStore
                                .seek(Duration(milliseconds: newPosition.floor()));
                          },
                        ),
                        onTap: () {
                          audioStore.audioPlayerState == AudioPlayerState.PAUSED ? audioStore.resume() : audioStore.pause();
                        },
                        trailing: Text(
                            Duration(milliseconds: position.floor()).format),
                      ),
                    );
                  }
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.play_arrow),
                      title: Text(
                        audioPaths[index].split("/").last.split(".mp3").first,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        audioStore.play(index);
                      },
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

extension Format on Duration {
  String get format => this.toString().split('.').first.padLeft(8, "0");
}
