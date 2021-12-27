
import 'package:flutter/material.dart';
import 'package:salary/models/login_karyawan.dart';
import 'package:salary/models/salary_model.dart';
import 'package:salary/services/salary_service.dart';

class SalaryProvider extends ChangeNotifier {

  LoginKaryawanModel? karyawanModel;

  SalaryModel? _salaryModel;

  SalaryModel get data => _salaryModel!;

  set data(SalaryModel salaryModel) {
    _salaryModel = salaryModel;
    notifyListeners();
  } 

  Future<void> getPenggajian() async {

    try {
      SalaryModel data = await SalaryService().getPenggajian();
      _salaryModel = data;
    } catch (e) {
      print(e);
    }
  }
}