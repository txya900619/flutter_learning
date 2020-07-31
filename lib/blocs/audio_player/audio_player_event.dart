part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerEvent {
}

class Play extends AudioPlayerEvent{
  final int currentIndex;
  Play(this.currentIndex);
}

class Pause extends AudioPlayerEvent{}

class Resume extends AudioPlayerEvent{}