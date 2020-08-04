import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mobx/AudioStore/AudioStore.dart';
import 'package:test_flutter/mobx/BottomNavigationStore/BottomNavigationStore.dart';
import 'package:test_flutter/mobx/ColorPickerStore/ColorStore.dart';
import 'package:test_flutter/screens/home/home_page.dart';
import 'package:test_flutter/screens/splash_page/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BottomNavigationStore>(create: (_)=>BottomNavigationStore()),
        Provider<ColorStore>(create: (_)=>ColorStore(),),
        Provider<AudioStore>(create: (_)=>AudioStore()..fetchAudioPath(),dispose: (ctx,audioStore)async =>await audioStore.dispose(),),
      ],
      child: MaterialApp(
        title: "ccTest",
        initialRoute: '/splash',
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext ctx) => HomePage(),
          '/splash': (BuildContext ctx) => SplashPage(),
        },
      ),
    );
  }
}
