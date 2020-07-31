import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';
import 'package:test_flutter/blocs/audio_player/audio_player_bloc.dart';
import 'package:test_flutter/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:test_flutter/blocs/color/color_bloc.dart';
import 'package:test_flutter/screens/home/home_page.dart';
import 'package:test_flutter/screens/splash_page/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => BottomNavigationBloc()),
        BlocProvider(create: (ctx) => ColorBloc()),
        BlocProvider(
          create: (ctx) =>
              AudioPathFetchBloc()..add(AudioPathFetchEvent.FetchAudioPath),
        ),
        BlocProvider(create: (ctx) => AudioPlayerBloc(ctx.bloc<AudioPathFetchBloc>())),
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
