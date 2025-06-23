import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/wallet/presentation/blocs/wallet/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    return BlocProvider(
      create: (context) => getIt<WalletBloc>()..add(const WalletEvent.started()),
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return Column(
            spacing: AppSizes.md,
            children: [
              const ProfileHeader(),
              state.when(
                initial: () => const BalanceCard(
                  state: BalanceCardState.loading,
                ),
                loading: () => const BalanceCard(
                  state: BalanceCardState.loading,
                ),
                success: (wallet) => BalanceCard(
                  state: BalanceCardState.success,
                  wallet: wallet,
                ),
                failure: (message) => BalanceCard(
                  state: BalanceCardState.error,
                  errorMessage: message,
                  onRetryPressed: () {
                    context.read<WalletBloc>().add(const WalletEvent.started());
                  },
                ),
              ),
              TransactionListCard(
                onViewAll: () => tabsRouter.setActiveIndex(1),
              ),
            ],
          );
        },
      ),
    );
  }
}
