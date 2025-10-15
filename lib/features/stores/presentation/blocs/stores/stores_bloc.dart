import 'package:bloc/bloc.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/features/stores/domain/interfaces/i_stores_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'stores_bloc.freezed.dart';
part 'stores_event.dart';
part 'stores_state.dart';

@injectable
class StoresBloc extends Bloc<StoresEvent, StoresState> {
  StoresBloc(this._iStoresRepository) : super(const StoresState.initial()) {
    on<StoresEvent>((event, emit) async {
      await event.when(
        loadStores: () async {
          await loadStores(emit);
        },
      );
    });
  }

  final IStoresRepository _iStoresRepository;

  Future<void> loadStores(Emitter<StoresState> emit) async {
    emit(const StoresState.loading());

    final response = await _iStoresRepository.getAllStores();
    await response.fold(
      (left) {
        if (left.isEmpty) {
          emit(const StoresState.empty());
        } else {
          emit(StoresState.storesLoaded(left));
        }
      },
      (right) async {
        emit(StoresState.error(right));
      },
    );
  }
}
