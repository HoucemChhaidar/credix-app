import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/colors/app_colors.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/transactions/presentation/blocs/TransactionsHistory/transactions_history_bloc.dart';
import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TransactionsHistoryBloc>()..add(const TransactionsHistoryEvent.loadTransactionsHistory()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText.h1('Transactions'),
              BlocBuilder<TransactionsHistoryBloc, TransactionsHistoryState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () => context
                        .read<TransactionsHistoryBloc>()
                        .add(const TransactionsHistoryEvent.loadTransactionsHistory()),
                    child: AppIcon(
                      icon: Assets.icons.refreshOutline,
                      color: AppColors.neutral11,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          BlocBuilder<TransactionsHistoryBloc, TransactionsHistoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const TransactionListCard(
                  isPreview: false,
                  state: TransactionListState.loading,
                  transactions: [],
                ),
                loading: () => const TransactionListCard(
                  isPreview: false,
                  state: TransactionListState.loading,
                  transactions: [],
                ),
                empty: () => const TransactionListCard(
                  isPreview: false,
                  state: TransactionListState.empty,
                  transactions: [],
                ),
                error: (error) => TransactionListCard(
                  isPreview: false,
                  state: TransactionListState.error,
                  errorMessage: error,
                  transactions: const [],
                  onRetry: () {
                    context
                        .read<TransactionsHistoryBloc>()
                        .add(const TransactionsHistoryEvent.loadTransactionsHistory());
                  },
                ),
                transactionsHistoryLoaded: (transactions) => TransactionListCard(
                  isPreview: false,
                  transactions: transactions,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
