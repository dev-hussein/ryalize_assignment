

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freerasp/android/android_callback.dart';
import 'package:freerasp/android/android_config.dart';
import 'package:freerasp/ios/ios_config.dart';
import 'package:freerasp/talsec_app.dart';
import 'package:freerasp/talsec_callback.dart';
import 'package:freerasp/talsec_config.dart';
import 'package:freerasp/utils/hash_converter.dart';
import 'package:ryalize_assignment/utils/services/security/threat_type.dart';


///
/// This is the first time i worked on this package i need time to know more about it
/// and how we can use it.
///
/// I followed the instructions to setup the package but still not working with me.
/// Visit https://pub.dev/packages/freerasp for more details
///

class SecurityThreats{

  /// ThreatTypes to hold current state (Android)
  final ThreatType _root = ThreatType('Root');
  final ThreatType _emulator = ThreatType('Emulator');
  final ThreatType _tamper = ThreatType('Tamper');
  final ThreatType _hook = ThreatType('Hook');
  final ThreatType _deviceBinding = ThreatType('Device binding');
  final ThreatType _untrustedSource =
  ThreatType('Untrusted source of installation');

  /// ThreatTypes to hold current state (iOS)
  final ThreatType _signature = ThreatType('Signature');
  final ThreatType _jailbreak = ThreatType('Jailbreak');
  final ThreatType _runtimeManipulation = ThreatType('Runtime Manipulation');
  final ThreatType _simulator = ThreatType('Simulator');
  final ThreatType _deviceChange = ThreatType('Device change');
  final ThreatType _deviceId = ThreatType('Device ID');
  final ThreatType _unofficialStore = ThreatType('Unofficial Store');
  final ThreatType _passcode = ThreatType('Passcode');
  final ThreatType _missingSecureEnclave = ThreatType('Missing secure enclave');

  /// ThreatTypes to hold current state (common)
  final ThreatType _debugger = ThreatType('Debugger');

  /// Getter to determine which states we care about
  List<Widget> get overview {
    if (Platform.isAndroid) {
      return [
        Text(_root.state),
        Text(_debugger.state),
        Text(_emulator.state),
        Text(_tamper.state),
        Text(_hook.state),
        Text(_deviceBinding.state),
        Text(_untrustedSource.state),
      ];
    }
    return [
      Text(_signature.state),
      Text(_jailbreak.state),
      Text(_debugger.state),
      Text(_runtimeManipulation.state),
      Text(_passcode.state),
      Text(_simulator.state),
      Text(_missingSecureEnclave.state),
      Text(_deviceChange.state),
      Text(_deviceId.state),
      Text(_unofficialStore.state)
    ];
  }




  Future<void> initSecurityState({required Function(ThreatType) onUpdate}) async {


    // String base64Hash = hashConverter.fromSha256toBase64("36:42:30:0C:FC:AE:79:C4:63:89:86:CB:61:E6:9E:B7:53:AB:D6:B9:6C:9A:71:E9:79:DF:17:6C:B0:AA:3A:3B");
    // print('base64Hash : $base64Hash');


    /// Provide TalsecConfig your expected data and then use them in TalsecApp
    final config = TalsecConfig(
      /// For Android
      androidConfig: AndroidConfig(
        expectedPackageName: 'com.example.ryalize_assignment',
        expectedSigningCertificateHashes: [
          'NkIwDPyuecRjiYbLYeaet1Or1rlsmnHped8XbLCqOjs='
        ],
        supportedAlternativeStores: ['com.sec.android.app.samsungapps'],
      ),

      ///
      /// For iOS
      /// [appTeamId] will get it after upload to apple store
      ///
      iosConfig: const IOSconfig(
        appBundleId: 'com.example.ryalize_assignment',
        appTeamId: 'M8AK35...',
      ),

      watcherMail: 'dev.m.hussein@gmail.com',
    );

    /// Callbacks thrown by library
    final callback = TalsecCallback(
      /// For Android
      androidCallback: AndroidCallback(
        onRootDetected: () => onUpdate.call(_root),
        onEmulatorDetected: () => onUpdate.call(_emulator),
        onHookDetected: () => onUpdate.call(_hook),
        onTamperDetected: () => onUpdate.call(_tamper),
        onDeviceBindingDetected: () => onUpdate.call(_deviceBinding),
        onUntrustedInstallationDetected: () => onUpdate.call(_untrustedSource),
      ),

      /// For iOS
      iosCallback: IOSCallback(
        onSignatureDetected: () => onUpdate.call(_signature),
        onRuntimeManipulationDetected: () => onUpdate.call(_runtimeManipulation),
        onJailbreakDetected: () => onUpdate.call(_jailbreak),
        onPasscodeDetected: () => onUpdate.call(_passcode),
        onSimulatorDetected: () => onUpdate.call(_simulator),
        onMissingSecureEnclaveDetected: () =>
            onUpdate.call(_missingSecureEnclave),
        onDeviceChangeDetected: () => onUpdate.call(_deviceChange),
        onDeviceIdDetected: () => onUpdate.call(_deviceId),
        onUnofficialStoreDetected: () => onUpdate.call(_unofficialStore),
      ),

      /// Debugger is common for both platforms
      onDebuggerDetected: () => onUpdate.call(_debugger),
    );

    final app = TalsecApp(
      config: config,
      callback: callback,
    );

    /// Turn on freeRASP
    app.start();

  }


}


