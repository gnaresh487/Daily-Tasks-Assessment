import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [storage] holds the instance of FlutterSecureStorage class
const FlutterSecureStorage storage = FlutterSecureStorage();

/// method to store key value pairs into preference
/// [key] pass the string key constant
/// [value] pass the value to be stored in the preference w.r.t key
Future<void> writeIntoStorage(String key, Object value) async {
  if (kIsWeb) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      key,
      value.toString(),
    );
  } else {
    await storage.write(
      key: key,
      value: value.toString(),
    );
  }
}

/// method to read data from preference
/// [key] pass string key const to retrieve specific value of the key
Future<String> readFromStorage(String key) async {
  try{
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key).toString();
    } else {
      return await storage.read(key: key) ?? '';
    }
  } catch(error) {
    return '';
  }
}

/// method to check preference has keys or not
Future<bool> hasPreference() async {
  if (kIsWeb) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().isNotEmpty;
  } else {
    final Map<String, String> allValues = await storage.readAll();
    return allValues.isNotEmpty;
  }
}

/// method to clear data from preference
Future<void> clearFromStorage() async {
  if (kIsWeb) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  } else {
    await storage.deleteAll();
  }
}
