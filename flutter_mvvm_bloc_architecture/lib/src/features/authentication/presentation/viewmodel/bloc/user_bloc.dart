import '../../../../../core/bloc/generic_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_bloc/src/features/authentication/presentation/viewmodel/bloc/user_event.dart';

import '../../../../../core/bloc/bloc_helper.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';

typedef Emit = Emitter<GenericBlocState<UserModel>>;

class UserBloc extends Bloc<UserEvent, GenericBlocState<UserModel>>
    with BlocHelper<UserModel> {
  UserBloc({required this.userRepository}) : super(GenericBlocState.loading()) {
    on<UsersFetched>(getUserList);
    on<UserCreated>(createUser);
    on<UserUpdated>(updateUser);
    on<UserDeleted>(deleteUser);
  }

  final UserRepository userRepository;

  Future<void> getUserList(UsersFetched event, Emit emit) async {
    await getItems(
        userRepository.getUsers(gender: event.gender, status: event.status),
        emit);
  }

  Future<void> createUser(UserCreated event, Emit emit) async {
    await createItem(userRepository.createUser(event.user), emit);
  }

  Future<void> updateUser(UserUpdated event, Emit emit) async {
    await updateItem(userRepository.updateUser(event.user), emit);
  }

  Future<void> deleteUser(UserDeleted event, Emit emit) async {
    await deleteItem(userRepository.deleteUser(event.user), emit);
  }
}
