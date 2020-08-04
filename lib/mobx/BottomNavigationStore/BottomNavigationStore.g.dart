// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BottomNavigationStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationStore on BottomNavigationStoreBase, Store {
  final _$currentPageAtom = Atom(name: 'BottomNavigationStoreBase.currentPage');

  @override
  HomePageChild get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(HomePageChild value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$changeHomePageToAsyncAction =
      AsyncAction('BottomNavigationStoreBase.changeHomePageTo');

  @override
  Future<void> changeHomePageTo(HomePageChild to) {
    return _$changeHomePageToAsyncAction.run(() => super.changeHomePageTo(to));
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
