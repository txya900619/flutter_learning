// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AudioStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioStore on AudioStoreBase, Store {
  final _$audioPathFetchStateAtom =
      Atom(name: 'AudioStoreBase.audioPathFetchState');

  @override
  AudioPathFetchState get audioPathFetchState {
    _$audioPathFetchStateAtom.reportRead();
    return super.audioPathFetchState;
  }

  @override
  set audioPathFetchState(AudioPathFetchState value) {
    _$audioPathFetchStateAtom.reportWrite(value, super.audioPathFetchState, () {
      super.audioPathFetchState = value;
    });
  }

  final _$audioPathsAtom = Atom(name: 'AudioStoreBase.audioPaths');

  @override
  List<String> get audioPaths {
    _$audioPathsAtom.reportRead();
    return super.audioPaths;
  }

  @override
  set audioPaths(List<String> value) {
    _$audioPathsAtom.reportWrite(value, super.audioPaths, () {
      super.audioPaths = value;
    });
  }

  final _$currentPositionAtom = Atom(name: 'AudioStoreBase.currentPosition');

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$currentDurationAtom = Atom(name: 'AudioStoreBase.currentDuration');

  @override
  Duration get currentDuration {
    _$currentDurationAtom.reportRead();
    return super.currentDuration;
  }

  @override
  set currentDuration(Duration value) {
    _$currentDurationAtom.reportWrite(value, super.currentDuration, () {
      super.currentDuration = value;
    });
  }

  final _$currentIndexAtom = Atom(name: 'AudioStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$audioPlayerStateAtom = Atom(name: 'AudioStoreBase.audioPlayerState');

  @override
  AudioPlayerState get audioPlayerState {
    _$audioPlayerStateAtom.reportRead();
    return super.audioPlayerState;
  }

  @override
  set audioPlayerState(AudioPlayerState value) {
    _$audioPlayerStateAtom.reportWrite(value, super.audioPlayerState, () {
      super.audioPlayerState = value;
    });
  }

  final _$fetchAudioPathAsyncAction =
      AsyncAction('AudioStoreBase.fetchAudioPath');

  @override
  Future<void> fetchAudioPath() {
    return _$fetchAudioPathAsyncAction.run(() => super.fetchAudioPath());
  }

  final _$playAsyncAction = AsyncAction('AudioStoreBase.play');

  @override
  Future<void> play(int index) {
    return _$playAsyncAction.run(() => super.play(index));
  }

  final _$pauseAsyncAction = AsyncAction('AudioStoreBase.pause');

  @override
  Future<void> pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  final _$resumeAsyncAction = AsyncAction('AudioStoreBase.resume');

  @override
  Future<void> resume() {
    return _$resumeAsyncAction.run(() => super.resume());
  }

  final _$seekAsyncAction = AsyncAction('AudioStoreBase.seek');

  @override
  Future<void> seek(Duration position) {
    return _$seekAsyncAction.run(() => super.seek(position));
  }

  @override
  String toString() {
    return '''
audioPathFetchState: ${audioPathFetchState},
audioPaths: ${audioPaths},
currentPosition: ${currentPosition},
currentDuration: ${currentDuration},
currentIndex: ${currentIndex},
audioPlayerState: ${audioPlayerState}
    ''';
  }
}
