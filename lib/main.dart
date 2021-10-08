import 'package:counter_app/app.dart';
import 'package:counter_app/common/config/injector.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjections();
  runApp(MyApp());
}
