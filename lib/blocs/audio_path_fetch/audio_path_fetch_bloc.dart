import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
part 'audio_path_fetch_event.dart';
part 'audio_path_fetch_state.dart';

class AudioPathFetchBloc
    extends Bloc<AudioPathFetchEvent, AudioPathFetchState> {
  AudioPathFetchBloc() : super(AudioPathFetchInitial());

  List<String> _audioPaths = [];
  get audioPaths => _audioPaths;
  @override
  Stream<AudioPathFetchState> mapEventToState(
    AudioPathFetchEvent event,
  ) async* {
    switch (event) {
      case AudioPathFetchEvent.FetchAudioPath:
        yield FetchingAudioPath();
        if (Platform.isAndroid) {
          try {
            _audioPaths = await _fetchAudioPath();
            yield AudioPathFetched(_audioPaths);
          } catch (_) {
            _audioPaths = [];
            yield AudioPathFetchFailed();
          }
        }
        break;
    }
  }

  Future<List<String>> _fetchAudioPath() async {
    List<String> paths = [];
    final Directory dir = Directory("/storage/emulated/0/Music/audios/");
    if (dir.existsSync()) {
      for (FileSystemEntity entity
          in dir.listSync(recursive: true, followLinks: false)) {
        String path = entity.path;
        if (path.endsWith(".mp3")) {
          paths.add(path);
        }
      }
    }
    return paths;
  }
}
