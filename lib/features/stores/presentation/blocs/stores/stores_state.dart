part of 'stores_bloc.dart';

@freezed
class StoresState with _$StoresState {
  const factory StoresState.initial() = _Initial;

  const factory StoresState.loading() = _Loading;

  const factory StoresState.empty() = _Empty;

  const factory StoresState.storesLoaded(List<StoreResponse> stores) = _StoresLoaded;

  const factory StoresState.error(String errorMessage) = _Error;
}
