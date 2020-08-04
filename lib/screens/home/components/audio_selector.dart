import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';
import 'package:test_flutter/blocs/audio_player/audio_player_bloc.dart';

class AudioSelector extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return BlocBuilder<AudioPathFetchBloc, AudioPathFetchState>(
      builder: (ctx, state) {
        if (state is AudioPathFetched) {
          List<String> audioPaths = state.audioPaths;
          if (audioPaths.isEmpty) {
            return Center(
              child: Text("File not found!"),
            );
          }
          return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
            builder: (ctx, state) {
              return ListView.builder(
                itemCount: audioPaths.length,
                itemBuilder: (ctx, index) {
                  if (index == state.currentIndex) {
                    return FutureBuilder<int>(
                      future: ctx.bloc<AudioPlayerBloc>().audioDuration,
                      builder: (context, snapshot) {
                        double duration = snapshot?.data?.toDouble() ?? 0;
                        return StreamBuilder<Duration>(
                          stream: ctx.bloc<AudioPlayerBloc>().audioPosition,
                          builder: (context, snapshot) {
                            double currentPosition =snapshot?.data?.inMilliseconds?.toDouble()??0;
                            if (currentPosition > duration) {
                              currentPosition = duration;
                            }
                            return Card(
                              child: ListTile(
                                leading: state is Paused
                                    ? Icon(Icons.play_arrow)
                                    : Icon(Icons.pause),
                                title: Slider(
                                  min: 0,
                                  max: duration,
                                  value: currentPosition,
                                  onChanged: (newPosition) {
                                    if (newPosition > duration) {
                                      newPosition = duration;
                                    } else if (newPosition < 0) {
                                      newPosition = 0;
                                    }
                                    ctx.bloc<AudioPlayerBloc>().seek(Duration(
                                        milliseconds: newPosition.floor()));
                                  },
                                ),
                                onTap: () {
                                  ctx.bloc<AudioPlayerBloc>().add(
                                      state is Paused ? Resume() : Pause());
                                },
                                trailing: Text(Duration(milliseconds: currentPosition.floor()).format),
                              ),
                            );
                          },
                        );
                      },
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
                        ctx.bloc<AudioPlayerBloc>().add(Play(index));
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
