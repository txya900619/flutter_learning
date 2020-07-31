part of 'audio_path_fetch_bloc.dart';

abstract class AudioPathFetchState {}

class AudioPathFetchInitial extends AudioPathFetchState {}

class AudioPathFetched extends AudioPathFetchState {
  final List<String> audioPaths;
  AudioPathFetched(this.audioPaths);
}

class AudioPathFetchFailed extends AudioPathFetchState {}

class FetchingAudioPath extends AudioPathFetchState {}
