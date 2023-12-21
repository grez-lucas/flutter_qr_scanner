import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = '';
  final String _firebaseToken = '';

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounds:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));

    // Decode the response
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    // Eventually, manage errors here
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      // Save token in the device SECURE STORAGE
      return null;
    } else {
      // Return the error message so that we can later display it in screen
      return decodedResp['error']['message'];
    }
  }
  
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));

    // Decode the response
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    // Eventually, manage errors here
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      // Save token in the device SECURE STORAGE
      return null;
    } else {
      // Return the error message so that we can later display it in screen
      return decodedResp['error']['message'];
    }
  }


}
