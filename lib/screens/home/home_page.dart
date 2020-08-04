import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mobx/AudioStore/AudioStore.dart';
import 'package:test_flutter/mobx/BottomNavigationStore/BottomNavigationStore.dart';
import 'package:test_flutter/screens/home/components/audio_selector.dart';
import 'package:test_flutter/screens/home/components/color_picker_card.dart';
import 'package:test_flutter/utils/permission.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return WillPopScope(
      onWillPop: () => _onBackEvent(ctx),
      child: Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (ctx) {
              final BottomNavigationStore bottomNavigationStore = Provider.of<BottomNavigationStore>(ctx, listen: false);
              switch (bottomNavigationStore.currentPage) {
                case HomePageChild.ColorPicker:
                  return ColorPickerCard();
                  break;
                case HomePageChild.AudioSelector:
                  return AudioSelector();
                  break;
                default:
                  return Container();
              }
            },
          ),
        ),
        bottomNavigationBar:
            Observer(
          builder: (_) {
            return BottomNavigationBar(
              currentIndex: Provider.of<BottomNavigationStore>(ctx, listen: false).currentPage.index,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.color_lens), title: Text("ColorPicker")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.queue_music),
                    title: Text("AudioSelector")),
              ],
              onTap: (int index) async {
                final AudioStore audioStore = Provider.of<AudioStore>(ctx, listen: false);
                if (index == 1) {
                  if(audioStore.audioPathFetchState == AudioPathFetchState.FetchFailed){
                      if (await checkStoragePermission()) {
                        audioStore.fetchAudioPath();
                      } else {
                        FlushbarHelper.createError(
                          message: "Can't read file",
                        ).show(ctx);
                        return;
                      }

                  }
                }
                Provider.of<BottomNavigationStore>(ctx, listen: false).changeHomePageTo(HomePageChild.values[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onBackEvent(BuildContext ctx) async {
    return showDialog<bool>(
        context: ctx,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("離開"),
            content: const Text("請確定是否離開應用程式？"),
            actions: <Widget>[
              FlatButton(
                child: const Text("取消"),
                onPressed: () {
                  Navigator.pop(ctx, false);
                },
              ),
              FlatButton(
                child: const Text("確定"),
                onPressed: () {
                  Navigator.pop(ctx, true);
                },
              ),
            ],
          );
        });
  }
}
