import 'package:mobx/mobx.dart';

part 'BottomNavigationStore.g.dart';

enum HomePageChild {
  ColorPicker,
  AudioSelector
}

class BottomNavigationStore = BottomNavigationStoreBase with _$BottomNavigationStore;

abstract class BottomNavigationStoreBase with Store{
  @observable
  HomePageChild currentPage = HomePageChild.ColorPicker;

  @action
  Future<void> changeHomePageTo(HomePageChild to) async{
    this.currentPage = to;
  }
}