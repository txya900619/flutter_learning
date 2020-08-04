// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ColorStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorStore on ColorStoreBase, Store {
  final _$colorListAtom = Atom(name: 'ColorStoreBase.colorList');

  @override
  List<Color> get colorList {
    _$colorListAtom.reportRead();
    return super.colorList;
  }

  @override
  set colorList(List<Color> value) {
    _$colorListAtom.reportWrite(value, super.colorList, () {
      super.colorList = value;
    });
  }

  final _$colorIndexAtom = Atom(name: 'ColorStoreBase.colorIndex');

  @override
  int get colorIndex {
    _$colorIndexAtom.reportRead();
    return super.colorIndex;
  }

  @override
  set colorIndex(int value) {
    _$colorIndexAtom.reportWrite(value, super.colorIndex, () {
      super.colorIndex = value;
    });
  }

  final _$colorChangeAsyncAction = AsyncAction('ColorStoreBase.colorChange');

  @override
  Future<void> colorChange(int index, Color newColor) {
    return _$colorChangeAsyncAction
        .run(() => super.colorChange(index, newColor));
  }

  final _$selectAsyncAction = AsyncAction('ColorStoreBase.select');

  @override
  Future<void> select(int index) {
    return _$selectAsyncAction.run(() => super.select(index));
  }

  @override
  String toString() {
    return '''
colorList: ${colorList},
colorIndex: ${colorIndex}
    ''';
  }
}
