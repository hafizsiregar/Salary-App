

import 'package:flutter/material.dart';
import 'package:salary/models/login_karyawan.dart';
import 'package:salary/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
 
  LoginKaryawanModel? _loginKaryawanModel;

  LoginKaryawanModel? get loginKaryawanModel => _loginKaryawanModel;

  set loginKaryawanModel(LoginKaryawanModel? loginKaryawanModel) {
    _loginKaryawanModel = loginKaryawanModel;
    notifyListeners();
  }

  Future<bool> login({String? username, String? password}) async {

    try {
      LoginKaryawanModel loginKaryawanModel = await 
      AuthService().login(
        username: username!, 
        password: password!);

        _loginKaryawanModel = loginKaryawanModel;
        return true;       
    } catch (e) {
      print(e);
      return false;
    }
  }
} 