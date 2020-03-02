import 'package:flutter/material.dart';
import 'package:mvc/archs/mvc/user_model.dart';

import 'login_repository.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();

  final LoginRepository repository;
  LoginController(this.repository);

  UserModel user = UserModel();

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  Future<bool> login() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();

    try {
      return await repository.doLogin(user);
    } catch (e) {
      return false;
    }
  }
}
