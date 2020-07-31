import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.init());

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    if (event is ColorChanged) {
      List<Color> colorList = List<Color>.from(state.colorList);
      colorList.replaceRange(event.index, event.index + 1, [event.color]);
      yield ColorState(
        colorIndex: state.colorIndex,
        colorList: colorList,
      );
    } else if (event is ColorSelected) {
      yield ColorState(
        colorIndex: event.index,
        colorList: state.colorList,
      );
    }
  }
}
