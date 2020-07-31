import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  if (await Permission.storage.status!= PermissionStatus.granted) {
    if ((await Permission.storage.request()) != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}
