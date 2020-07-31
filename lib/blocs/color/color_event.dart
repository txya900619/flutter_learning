part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ColorChanged extends ColorEvent {
  final int index;
  final Color color;

  ColorChanged({@required this.index, @required this.color})
      : assert(index != null),
        assert(color != null);
}

class ColorSelected extends ColorEvent {
  final int index;

  ColorSelected({@required this.index}) : assert(index != null);
}

