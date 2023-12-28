import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  // -------------------------
  //  Get/Reading
  // -------------------------
  Future Store(String Keys, String value) async {
    await _storage.write(
      key: Keys,
      value: value,
    );
  }

  Future Get(String Keys) async {
    String? value = await _storage.read(key: Keys);
    if (value != null) {
      return value;
    } else {
      return '';
    }
  }

  Future readall() async {
    return await _storage.readAll();
  }

  Future RemoveAllStorageData() async {
    await _storage.deleteAll();
  }

  // ----------------
  // Login Pin Status
  // ----------------
  Future PinStatus(String pin, String status) async {
    await _storage.write(key: pin, value: status);
  }

  Future GetStatus(String key) async {
    var status = await _storage.read(key: key);
    print('Pin Status $status');
    return status;
  }

  // -------------------------
  // Token Get/Reading
  // -------------------------
  Future StorePin(String pin, String value) async {
    print("Ypur key$pin");
    print("Your value$value");
    await _storage.write(key: pin, value: value);
  }

  Future GetToken(String Keys) async {
    var token = await _storage.read(key: Keys);

    return token;
  }
}
