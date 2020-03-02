import 'user_model.dart';

class LoginRepository {
  Future<bool> doLogin(UserModel model) async {
    //API Conection
    await Future.delayed(Duration(seconds: 2));
    return model.email.trim() == 'jacob@gmail.com' &&
        model.password.trim() == '123';
  }
}
