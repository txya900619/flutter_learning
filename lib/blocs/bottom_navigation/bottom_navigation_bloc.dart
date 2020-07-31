import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  // ignore: close_sinks
  BottomNavigationBloc() : super(BottomNavigationState.OnColorPicker);

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    switch (event) {
      case BottomNavigationEvent.ToColorPicker:
        yield BottomNavigationState.OnColorPicker;
        break;
      case BottomNavigationEvent.ToAudioSelector:
        yield BottomNavigationState.OnAudioSelector;
        break;
    }
  }
}
