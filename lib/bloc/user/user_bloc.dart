import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(age: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;

      final professions = [...state.user!.professions, event.profession];
      emit(UserSetState(state.user!.copyWith(professions: professions)));
    });

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));
  }
}
