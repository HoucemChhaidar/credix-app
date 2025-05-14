import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BottomNavbarCubit extends Cubit<int> {
  BottomNavbarCubit() : super(0);

  void selectTab({required int index}) => emit(index);
}
