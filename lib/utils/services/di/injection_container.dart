
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.config.dart';


///
/// [GetIt]
/// This is a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired by Splat. It can be used instead of InheritedWidget or Provider to access objects e.g. from your UI.
//
// Typical usage:
//
///     Accessing service objects like REST API clients or databases so that they easily can be mocked.
///     Accessing View/AppModels/Managers/BLoCs from Flutter Views
///
/// Visit https://pub.dev/packages/get_it for more details
///


final locator = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
)
void initializeDependencies() => locator.init();