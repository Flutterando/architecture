import 'dart:async';

import 'login_repository.dart';
import 'user_model.dart';

class PageViewModel {
  final _isLoading$ = StreamController<bool>();

  PageViewModel(this.repository);
  Sink<bool> get isLoadingIn => _isLoading$.sink;
  Stream<bool> get isLoadingOut => _isLoading$.stream;

  final _isLogin$ = StreamController<UserModel>();
  Sink<UserModel> get isLoginIn => _isLogin$.sink;
  Stream<bool> get isLoginOut => _isLogin$.stream.asyncMap(login);

  final LoginRepository repository;

  Future<bool> login(UserModel user) async {
    bool isLogin;
    isLoadingIn.add(true);

    try {
      isLogin = await repository.doLogin(user);
    } catch (e) {
      isLogin = false;
    }

    isLoadingIn.add(false);
    return isLogin;
  }

  dispose() {
    _isLoading$.close();
    _isLogin$.close();
  }
}
