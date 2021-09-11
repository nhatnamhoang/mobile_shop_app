import 'package:get_storage/get_storage.dart';

class DataStorage {
  late GetStorage _storage;

  final _login = 'login';
  final _token = 'token';
  final _isBackUp = 'isBackUp';
  final _mnemonic = 'mnemonic';
  final _fbToken = 'fbToken';
  final _language = 'language';

  DataStorage() {
    _storage = GetStorage();
  }

  setLanguage(String value) async => await _storage.write(_language, value);

  getLanguage() => _storage.read(_language);

  setLogin(String value) async => await _storage.write(_login, value);

  getLogin() => _storage.read(_login);

  setBackUp(bool value) async => await _storage.write(_isBackUp, value);

  getBackUp() => _storage.read(_isBackUp);

  setToken(String? value) async => await _storage.write(_token, value);

  getToken() => _storage.read(_token);

  setMnemonic(String? value) async => await _storage.write(_mnemonic, value);

  getMnemonic() => _storage.read(_mnemonic);

  setFbToken(String value) async => await _storage.write(_fbToken, value);

  getFbToken() => _storage.read(_fbToken);
}
