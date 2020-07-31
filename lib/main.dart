import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_flutter/screens/app.dart';
import 'package:test_flutter/utils/permission.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if(Platform.isAndroid){
    await checkStoragePermission();
    }
  runApp(App());
}


