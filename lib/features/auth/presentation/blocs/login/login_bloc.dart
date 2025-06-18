import 'package:bloc/bloc.dart';
import 'package:credix_app/core/data/local/credentials_storage.dart';
import 'package:credix_app/core/data/local/token_storage.dart';
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
        loadSavedCredentials: () async {
          await loadSavedCredentials(emit);
        },
        login: (isRemembering, email, password) async {
          await login(isRemembering: isRemembering, email, password, emit);
        },
      );
    });
  }

  LoginRepository loginRepository;

  Future<void> loadSavedCredentials(Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    final credentials = await CredentialsStorage.getSavedCredentials();
    if (credentials['email'] != null && credentials['password'] != null) {
      final enabled = credentials['rememberMe'] == 'true';
      emit(
        LoginState.credentialsLoaded(
          email: credentials['email'] ?? '',
          password: credentials['password'] ?? '',
          rememberMe: enabled,
        ),
      );
    } else {
      emit(const LoginState.initial());
    }
  }

  Future<void> login(String email, String password, Emitter<LoginState> emit, {required bool isRemembering}) async {
    emit(const LoginState.loading());
    if (isRemembering) {
      await CredentialsStorage.saveCredentials(email: email, password: password);
    } else {
      await CredentialsStorage.clearCredentials();
    }

    final response = await loginRepository.login(email: email, password: password);
    await response.fold(
      (left) async {
        emit(const LoginState.success());
        await TokenStorage.saveAuthData(token: left.token!);
        await getIt<AppRouter>().replaceAll([const MainRoute()]);
      },
      (right) async {
        emit(LoginState.error(message: right));
      },
    );
  }
}
