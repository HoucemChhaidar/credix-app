import 'package:bloc/bloc.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/routing/app_router.dart';
import 'package:credix_app/features/auth/domain/repositories/login_repository.dart';
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
    emit(const LoginState.loading());
    final response = await loginRepository.login(email: email, password: password);
    await response.fold(
      (left) async {
        // Simulate real-world response delay (e.g., network latency or transition timing)
        await Future<void>.delayed(const Duration(milliseconds: 1200));
        emit(const LoginState.success());
        await getIt<AppRouter>().replaceAll([const HomeRoute()]);
      },
      (right) async {
        await Future<void>.delayed(const Duration(milliseconds: 800));
        emit(LoginState.error(message: right));
      },
    );
  }
}
