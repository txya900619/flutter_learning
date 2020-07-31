import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc(this._audioPathFetchBloc) : super(AudioPlayerInitial());

  final AudioPathFetchBloc _audioPathFetchBloc;
  int _currentIndex;
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Stream<AudioPlayerState> mapEventToState(
    AudioPlayerEvent event,
  ) async* {
    if(event is Play){
      _currentIndex = event.currentIndex;
       _audioPlayer.play(_audioPathFetchBloc.audioPaths[_currentIndex],isLocal: true);
      yield Playing(_currentIndex);
    }else if(event is Pause){
       _audioPlayer.pause();
      yield Paused(_currentIndex);
    }else if(event is Resume){
       _audioPlayer.resume();
      yield Playing(_currentIndex);
    }
  }
}
