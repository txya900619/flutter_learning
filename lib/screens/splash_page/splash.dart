import 'package:flutter/material.dart';
import 'package:flutter_mobx_helpers/flutter_mobx_helpers.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mobx/AudioStore/AudioStore.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    final AudioStore audioStore = Provider.of<AudioStore>(ctx, listen: false);
    return ObserverListener(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        listener: (_) {
          if (audioStore.audioPathFetchState ==
                  AudioPathFetchState.FetchSuccess ||
              audioStore.audioPathFetchState ==
                  AudioPathFetchState.FetchFailed) {
            Navigator.of(ctx).pushReplacementNamed("/home");
          }
        });
  }
}
