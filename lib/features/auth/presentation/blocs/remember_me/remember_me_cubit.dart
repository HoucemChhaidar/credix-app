import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'remember_me_cubit.freezed.dart';
part 'remember_me_state.dart';

@injectable
class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(const RememberMeState.remember(remember: false));

  void toggle() {
    emit(RememberMeState.remember(remember: !state.remember));
  }

  void setRemember({required bool remember}) {
    emit(RememberMeState.remember(remember: remember));
  }

  bool get isRemembering => state.remember;
}
