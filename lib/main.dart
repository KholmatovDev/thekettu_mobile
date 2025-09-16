import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:thekettu/data/service/source/local/secure_storage.dart';
import 'package:thekettu/presentation/pages/auth/bloc/auth_cubit.dart';

import 'app.dart';
import 'data/service/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  await SecureStorage.initSharedPref();
  runApp(const MyApp());
}
