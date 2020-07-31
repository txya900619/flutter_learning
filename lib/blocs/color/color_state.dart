part of 'color_bloc.dart';

@immutable
class ColorState {
  final List<Color> colorList;
  final int colorIndex;

  const ColorState(
      {@required this.colorList,
      @required this.colorIndex,
      })
      : assert(colorList != null),
        assert(colorIndex != null);

  factory ColorState.init() => ColorState(
        colorList: _defaultColorList,
        colorIndex: 0,
      );
}

final List<Color> _defaultColorList = [
  Colors.white,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.blueAccent,
];
