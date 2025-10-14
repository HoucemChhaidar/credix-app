// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:credix_app/core/data/network/providers/dio_provider.dart'
    as _i275;
import 'package:credix_app/core/routing/app_router.dart' as _i141;
import 'package:credix_app/features/auth/data/datasources/login_service.dart'
    as _i680;
import 'package:credix_app/features/auth/data/repositories/login_repository_impl.dart'
    as _i776;
import 'package:credix_app/features/auth/domain/interfaces/i_login_repository.dart'
    as _i106;
import 'package:credix_app/features/auth/presentation/blocs/login/login_bloc.dart'
    as _i693;
import 'package:credix_app/features/auth/presentation/blocs/remember_me/remember_me_cubit.dart'
    as _i488;
import 'package:credix_app/features/transactions/data/datasources/transactions_service.dart'
    as _i180;
import 'package:credix_app/features/transactions/data/repositories/transactions_repository_impl.dart'
    as _i942;
import 'package:credix_app/features/transactions/domain/interfaces/i_transactions_repository.dart'
    as _i278;
import 'package:credix_app/features/transactions/presentation/blocs/TransactionsHistory/transactions_history_bloc.dart'
    as _i68;
import 'package:credix_app/features/wallet/data/datasources/wallet_service.dart'
    as _i1064;
import 'package:credix_app/features/wallet/data/repositories/wallet_repository_impl.dart'
    as _i741;
import 'package:credix_app/features/wallet/domain/interfaces/i_wallet_repository.dart'
    as _i1015;
import 'package:credix_app/features/wallet/presentation/blocs/wallet/wallet_bloc.dart'
    as _i1022;
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
    gh.factory<_i488.RememberMeCubit>(() => _i488.RememberMeCubit());
    gh.factory<_i180.TransactionsService>(() => _i180.TransactionsService());
    gh.factory<_i1064.WalletService>(() => _i1064.WalletService());
    gh.singleton<_i141.AppRouter>(() => _i141.AppRouter());
    gh.singleton<_i361.Dio>(() => dioProvider.dio);
    gh.factory<_i278.ITransactionsRepository>(
        () => _i942.TransactionsRepositoryImpl(
              gh<_i180.TransactionsService>(),
              gh<_i361.Dio>(),
            ));
    gh.factory<_i1015.IWalletRepository>(() => _i741.WalletRepositoryImpl(
          gh<_i1064.WalletService>(),
          gh<_i361.Dio>(),
        ));
    gh.factory<_i106.ILoginRepository>(() => _i776.LoginRepositoryImpl(
          gh<_i680.LoginService>(),
          gh<_i361.Dio>(),
        ));
    gh.factory<_i693.LoginBloc>(
        () => _i693.LoginBloc(gh<_i106.ILoginRepository>()));
    gh.factory<_i1022.WalletBloc>(
        () => _i1022.WalletBloc(gh<_i1015.IWalletRepository>()));
    gh.factory<_i68.TransactionsHistoryBloc>(() =>
        _i68.TransactionsHistoryBloc(gh<_i278.ITransactionsRepository>()));
    return this;
  }
}

class _$DioProvider extends _i275.DioProvider {}
