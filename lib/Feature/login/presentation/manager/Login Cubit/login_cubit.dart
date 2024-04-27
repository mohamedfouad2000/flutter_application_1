import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Feature/login/data/repo/login%20repo/login_repo.dart';
import 'package:flutter_application_1/Feature/login/presentation/manager/Login%20Cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.homrepo) : super(LoginInitial());
  final LoginRepo homrepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    print('email is $email password is $password');
    var result = await homrepo.login(email, password);
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(LoginEroor(failure.msq));
    }, (status) {
      emit(LoginSucc(status));
    });
  }
}
