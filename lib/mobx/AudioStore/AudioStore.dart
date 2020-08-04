import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'AudioStore.g.dart';

class AudioStore = AudioStoreBase with _$AudioStore;
enum AudioPathFetchState {
  Initial,
  Fetching,
  FetchSuccess,
  FetchFailed,
}

abstract class AudioStoreBase with Store {
  AudioStoreBase(){
    _audioPlayer.onDurationChanged.listen((event) {
      currentDuration = event;
    });
    _audioPlayer.onAudioPositionChanged.listen((event) {
      currentPosition = event;
    });
    _audioPlayer.onPlayerStateChanged.listen((event) {
      audioPlayerState = event;
      if(audioPlayerState==AudioPlayerState.COMPLETED){
        currentIndex = null;
      }
    });
  }

  AudioPlayer _audioPlayer = AudioPlayer();

  @observable
  AudioPathFetchState audioPathFetchState = AudioPathFetchState.Initial;

  @observable
  List<String> audioPaths = [];

  @observable
  Duration currentPosition;

  @observable
  Duration currentDuration;

  @observable
  int currentIndex;

  @observable
  AudioPlayerState audioPlayerState;

  @action
  Future<void> fetchAudioPath() async {
    audioPathFetchState = AudioPathFetchState.Fetching;
    if (Platform.isAndroid) {
      try {
        audioPaths = await _fetchAudioPath();
        audioPathFetchState = AudioPathFetchState.FetchSuccess;
      } catch (_) {
        audioPaths = [];
        audioPathFetchState = AudioPathFetchState.FetchFailed;
      }
    }
  }

  @action
  Future<void> play(int index) async {
    _audioPlayer.play(audioPaths[index]);
    currentIndex = index;
  }

  @action
  Future<void> pause() async {
    _audioPlayer.pause();
  }

  @action
  Future<void> resume() async {
    _audioPlayer.resume();
  }

  @action
  Future<void> seek(Duration position) async {
    _audioPlayer.seek(position);
  }

  dispose()async{
    await _audioPlayer.release();
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
