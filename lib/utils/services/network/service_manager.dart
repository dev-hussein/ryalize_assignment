
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:ryalize_assignment/constants/api_constants.dart';
import 'package:ryalize_assignment/utils/preferencies/preferences_util.dart';


///
/// Here you can configure the Dio client for the network requests
/// Visit https://pub.dev/packages/dio for more details
///
/// You can find [RequestsInspectorInterceptor]
/// used to enable app logger when you want to check the request details from the app itself
/// Just press long on the app screen and you can see the request details
/// Visit https://pub.dev/packages/requests_inspector for more details
///

@injectable
class ServiceManger {

  late final SecuredPreferenceUtil _prefs;
  ServiceManger(this._prefs);

  @Named("clientDio")
  @injectable
  Dio get networkClient => Dio(
      BaseOptions(
        headers:  {
          ParametersConstants.kRapidKey : /*await _prefs.readToken()*/ '999769103cmsh85cd9e778b012dap122becjsna86bd8be46d9',
          ParametersConstants.kRapidHost : 'imdb8.p.rapidapi.com',

        }
      )
  )..interceptors.add( RequestsInspectorInterceptor());

}
