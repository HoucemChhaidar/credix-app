part of 'stores_bloc.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.loadStores() = _LoadStores;

}
