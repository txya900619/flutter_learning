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
                    return Card(
                      child: ListTile(
                        leading: state is Paused
                            ? Icon(Icons.play_arrow)
                            : Icon(Icons.pause),
                        title: Text(
                          audioPaths[index].split("/").last.split(".mp3").first,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          ctx.bloc<AudioPlayerBloc>().add(state is Paused?Resume():Pause());
                        },
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
