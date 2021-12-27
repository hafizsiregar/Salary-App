import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salary/models/login_karyawan.dart';

class AuthService {

  String baseUrl = 'https://bootcamp.jagoantech.com/api';

  Future<LoginKaryawanModel> login({
    required String username,
    required String password
  }) async {

    Uri url = Uri.parse('$baseUrl/login_karyawan'); 
    var headers = {'Content-Type' : 'application/json'};
    var body = jsonEncode({
      'username' : username,
      'password' : password
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    print(response.body);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      LoginKaryawanModel login = LoginKaryawanModel.fromJson(data['karyawan']);
      return login;
    } else {
      throw Exception('Gagal Login');
    }
  }
}