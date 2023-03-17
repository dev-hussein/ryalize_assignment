
import 'dart:async';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/constants/app_preferences_constants.dart';




///
/// Secure pref should only be used to keep values which need's to be encrypted.
/// Visit https://pub.dev/packages/flutter_secure_storage for more details
///

@lazySingleton
class SecuredPreferenceUtil{
  FlutterSecureStorage? _secureStorage;
  static final SecuredPreferenceUtil _instance = SecuredPreferenceUtil._();

  IOSOptions _getIOSOptions() => const IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  factory SecuredPreferenceUtil() {

    return _instance;
  }

  SecuredPreferenceUtil._(){ _init();}

  void _init() {
    _secureStorage ??=  const FlutterSecureStorage();
  }


  Future<String> readToken()async{
    return await readStorage(AppPreferencesConstants.kToken) ?? '999769103cmsh85cd9e778b012dap122becjsna86bd8be46d9';
  }


  Future<String?> readStorage(String key)async{
    String? value =  await _secureStorage!.read(key: key , aOptions: _getAndroidOptions(),iOptions: _getIOSOptions());
    return value;
  }



  Future<Map<String,String>> readAll()async{
    Map<String,String>? value =  await _secureStorage!.readAll(aOptions: _getAndroidOptions(),iOptions: _getIOSOptions());
    return value;
  }

  Future<void> deleteStorage(String key)async{
     await _secureStorage!.delete(key: key,aOptions: _getAndroidOptions(),iOptions: _getIOSOptions());
  }

  Future<void> writeStorage(String key,String value)async{
    await _secureStorage!.write(key: key, value: value,aOptions: _getAndroidOptions(),iOptions: _getIOSOptions());
  }

  Future<void> deleteAll()async{
    await _secureStorage!.deleteAll(aOptions: _getAndroidOptions(),iOptions: _getIOSOptions());
  }




}