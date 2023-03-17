import 'package:flutter/material.dart';
import 'package:freerasp/utils/hash_converter.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';
import 'package:ryalize_assignment/utils/theming/screen_util.dart';

import 'routing/base_app/base_app.dart';

void main() {




  initializeDependencies(); // Dependency Injection Init
  ScreenUtil.init(allowFontScaling: true);
  runApp( const RequestsInspector(
    enabled: true,
      child: BaseApp()
  )
  );
}


