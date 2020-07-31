import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';
import 'package:test_flutter/blocs/bottom_navigation/bottom_navigation_bloc.dart';
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
          child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (ctx, state) {
              switch (state) {
                case BottomNavigationState.OnColorPicker:
                  return ColorPickerCard();
                  break;
                case BottomNavigationState.OnAudioSelector:
                  return AudioSelector();
                  break;
                default:
                  return Container();
              }
            },
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (ctx, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.color_lens), title: Text("ColorPicker")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.queue_music),
                    title: Text("AudioSelector")),
              ],
              onTap: (int index) async {
                if (index == 1) {
                  if(ctx.bloc<AudioPathFetchBloc>().state is AudioPathFetchFailed){
                      if (await checkStoragePermission()) {
                        ctx
                            .bloc<AudioPathFetchBloc>()
                            .add(AudioPathFetchEvent.FetchAudioPath);
                      } else {
                        FlushbarHelper.createError(
                          message: "Can't read file",
                        ).show(ctx);
                        return;
                      }

                  }
                }
                ctx
                    .bloc<BottomNavigationBloc>()
                    .add(BottomNavigationEvent.values[index]);
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
