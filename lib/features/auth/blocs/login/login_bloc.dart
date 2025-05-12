import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:credix_app/features/auth/data/repositories/login_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        login: (email, password) async {
          await login(email, password, emit);
        },
      );
    });
  }

  LoginRepository loginRepository;

  Future<void> login(String email, String password, Emitter<LoginState> emit) async {
    final response = await loginRepository.login(email: email, password: password);
    response.fold(
      (left) => log('>>> TOKEN ${left.token}'),
      (r) {},
    );
  }
}
