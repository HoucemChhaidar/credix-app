// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:credix_app/core/data/network/providers/dio_provider.dart' as _i275;
import 'package:credix_app/core/presentation/widgets/navigation/bottom_nav_cubit.dart' as _i188;
import 'package:credix_app/core/routing/app_router.dart' as _i141;
import 'package:credix_app/features/auth/data/datasources/login_service.dart' as _i680;
import 'package:credix_app/features/auth/data/repositories/login_repository_impl.dart' as _i776;
import 'package:credix_app/features/auth/domain/repositories/login_repository.dart' as _i773;
import 'package:credix_app/features/auth/presentation/blocs/login/login_bloc.dart' as _i693;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i680.LoginService>(() => _i680.LoginService());
    gh.factory<_i188.BottomNavbarCubit>(() => _i188.BottomNavbarCubit());
    gh.singleton<_i361.Dio>(() => dioProvider.dio);
    gh.singleton<_i141.AppRouter>(() => _i141.AppRouter());
    gh.factory<_i773.LoginRepository>(() => _i776.LoginRepositoryImpl(
          gh<_i680.LoginService>(),
          gh<_i361.Dio>(),
        ));
    gh.factory<_i693.LoginBloc>(() => _i693.LoginBloc(gh<_i773.LoginRepository>()));
    return this;
  }
}

class _$DioProvider extends _i275.DioProvider {}
