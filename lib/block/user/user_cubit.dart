import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitUser());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit(ActiveUser(newUser));
    }
  }

  void addProf() {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newProf = [
        ...?currentState.user.professions,
        'Profesión: ${currentState.user.professions!.length + 1}'
      ];
      final newUser = currentState.user.copyWith(professions: newProf);
      emit(ActiveUser(newUser));
    }
  }

  void logout() {
    emit(InitUser());
  }
}
