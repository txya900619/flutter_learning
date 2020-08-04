import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'ColorStore.g.dart';

class ColorStore = ColorStoreBase with _$ColorStore;

abstract class ColorStoreBase with Store{
  @observable
  List<Color> colorList = _defaultColorList;

  @observable
  int colorIndex = 0;

  @action
  Future<void> colorChange(int index,Color newColor)async{
    List<Color> tempColorList = List<Color>.from(colorList);
    tempColorList.replaceRange(index, index + 1, [newColor]);
    colorList = tempColorList;

  }

  @action
  Future<void> select(int index)async{
    colorIndex = index;
  }
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