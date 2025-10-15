import 'package:auto_route/auto_route.dart';
import 'package:credix_app/core/di/injection.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/stores/presentation/blocs/stores/stores_bloc.dart';
import 'package:credix_app/features/stores/presentation/widgets/stores_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StoresPage extends StatefulWidget {
  const StoresPage({super.key});

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  String _selectedType = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StoresBloc>()..add(const StoresEvent.loadStores()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.h1('Stores'),
          const SizedBox(height: AppSizes.md),
          BlocBuilder<StoresBloc, StoresState>(
            builder: (context, state) {
              final storesBloc = context.read<StoresBloc>();

              return state.maybeWhen(
                orElse: () => StoresListCard(
                  stores: const [],
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                  isLoading: true,
                ),
                initial: () => StoresListCard(
                  stores: const [],
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                  isLoading: true,
                ),
                loading: () => StoresListCard(
                  stores: const [],
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                  isLoading: true,
                ),
                empty: () => StoresListCard(
                  stores: const [],
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                  isEmpty: true,
                ),
                error: (error) => StoresListCard(
                  stores: const [],
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                  errorMessage: error,
                  onRetry: () => storesBloc.add(const StoresEvent.loadStores()),
                ),
                storesLoaded: (stores) => StoresListCard(
                  stores: stores,
                  selectedType: _selectedType,
                  onTypeChanged: (type) => setState(() => _selectedType = type),
                  searchQuery: _searchQuery,
                  onSearchChanged: (query) => setState(() => _searchQuery = query),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
