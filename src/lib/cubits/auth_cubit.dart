
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) {
    // Here you would normally add your authentication logic 
    // such as making a network request. For simplicity, we will 
    // assume the login is always successful if email and password 
    // are not empty.
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  void logout() {
    emit(Unauthenticated());
  }
}
