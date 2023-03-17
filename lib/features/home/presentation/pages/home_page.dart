import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/routing/app_router.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';
import 'package:ryalize_assignment/utils/services/security/security_threats.dart';
import 'package:ryalize_assignment/utils/services/security/threat_type.dart';
import 'package:ryalize_assignment/utils/theming/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _PageHomeState();
}

class _PageHomeState extends State<HomePage> {

  ValueNotifier<bool> windowsSecureState = ValueNotifier(true);


  var securityThreats = SecurityThreats();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    securityThreats.initSecurityState(onUpdate: (ThreatType type) {
      if(! mounted) return;
      setState(type.threatFound);
      print('threat type : ${type.state}');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Expanded(child: SingleChildScrollView(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: securityThreats.overview,
                ),
              ),
            )),

            ValueListenableBuilder(

                valueListenable: windowsSecureState,
              builder: (BuildContext context, bool value, Widget? child) {
                  return Column(
                    children: [
                      Text('Secure Mode: ${value.toString()}\n'),
                      ElevatedButton(
                          style: ButtonStyle(

                              foregroundColor: MaterialStateProperty.all<Color>(AppColors.colorFFFFFF),
                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.color6C6DB5),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: AppColors.color6C6DB5)
                                  )
                              )
                          ),
                          onPressed: () async {
                            final secureMode = value;

                            if (secureMode == true) {
                              await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
                            } else {
                              ///
                              /// Check the security flag you need to enable in the app
                              /// Visit https://pub.dev/packages/flutter_windowmanager for more details
                              ///
                              await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
                            }

                            windowsSecureState.value = !value;
                          },
                          child: const Text("Toggle Secure Mode")),
                    ],
                  );
              },
                ),




            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(250.toWidth, 65.toHeight)),
                      foregroundColor: MaterialStateProperty.all<Color>(AppColors.colorFFFFFF),
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.color6C6DB5),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: AppColors.color6C6DB5)
                          )
                      )
                  ),
                  onPressed: (){
                    locator<AppRouter>().push(const ImdbRoute());
                  },
                  child: Text(
                    AppLocalizationKeys.kViewImdbText.translate
                    , style:  Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.colorFFFFFF),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
