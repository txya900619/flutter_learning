part of 'audio_player_bloc.dart';

abstract class AudioPlayerState {
  final int currentIndex;
  AudioPlayerState({this.currentIndex});
}

class AudioPlayerInitial extends AudioPlayerState {
}

class Playing extends AudioPlayerState{
  Playing(currentIndex):super(currentIndex:currentIndex);
}

class Paused extends AudioPlayerState{
  Paused(currentIndex):super(currentIndex:currentIndex);
}

