import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/blocs/audio_path_fetch/audio_path_fetch_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return BlocListener<AudioPathFetchBloc, AudioPathFetchState>(
      listener: (ctx, state) {
        if (state is AudioPathFetched || state is AudioPathFetchFailed) {
          Navigator.of(ctx).pushReplacementNamed("/home");
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
