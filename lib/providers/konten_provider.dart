import 'package:flutter/material.dart';
import 'package:salary/models/konten.dart';
import 'package:salary/services/konten_service.dart';

class KontenProvider extends ChangeNotifier {

  List<KontenModel>? _listKonten;

  List<KontenModel> get kontenModel => _listKonten!;

  set kontenModel(List<KontenModel> listKonten) {
    _listKonten = listKonten;
    notifyListeners();
  }

  Future<List<KontenModel>> getAllKonten() async {
    var data = await KontenService().getAllKonten();
    _listKonten = data;
    return _listKonten!;
  }
}