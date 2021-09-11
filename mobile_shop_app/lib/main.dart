import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'application/app.dart';

void main() async {
  await initProject();
  runApp(Application());
}

Future<void> initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}

