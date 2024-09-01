// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:saber_module/components/theming/dynamic_material_app.dart';
import 'package:saber_module/data/file_manager/file_manager.dart';
import 'package:saber_module/data/prefs.dart';
import 'package:saber_module/data/routes.dart';
import 'package:saber_module/data/tools/stroke_properties.dart';
import 'package:saber_module/i18n/strings.g.dart';
import 'package:saber_module/pages/editor/editor.dart';

Future<void> mainEditor({
  WidgetsBinding? Function() initWidgetsBinding =
      WidgetsFlutterBinding.ensureInitialized,
  void Function(Widget) runApp = runApp,
}) async {
  initWidgetsBinding();

  

  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    Logger.root
        .fine('androidInfo.version.release: ${androidInfo.version.release}');
    Prefs.androidVersion =
        int.tryParse(androidInfo.version.release) ?? Prefs.androidVersion;
  }

  StrokeOptionsExtension.setDefaults();
  Prefs.init();


  setLocale();
  Prefs.locale.addListener(setLocale);
  startSyncAfterLoaded();
}


void startSyncAfterLoaded() async {
}

void setLocale() {
    LocaleSettings.setLocale(AppLocale.ar);
  
}

