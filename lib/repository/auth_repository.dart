import 'dart:convert';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class AuthRepository extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCFNtZIzVKMqVG4fI-RNlWP3_xEOoVrUlc';
  final storage = const FlutterSecureStorage();

//REGISTER
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {'key': _firebaseToken},
    );
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    return _validateResponse(decodeResp);
  }

//LOGIN
  Future<String?> loginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signInWithPassword',
      {'key': _firebaseToken},
    );
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    return _validateResponse(decodeResp);
  }

  Future<String?> _validateResponse(Map<String, dynamic> decodeResp) async {
    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp['idToken']);
      await storage.write(key: 'user_id', value: decodeResp['localId']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'user_id');
    await PreferenceUtils.clean();

    return;
  }

  Future<String> isAuthentication() async {
    final data = await storage.read(key: 'token') ?? '';
    return data;
  }

  Future<String> getUserId() async {
    return await storage.read(key: 'user_id') ?? '';
  }
}
