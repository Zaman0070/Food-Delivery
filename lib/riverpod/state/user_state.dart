import 'package:zcart/data/models/user/user_model.dart';

/// Auth State
abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {
  const UserInitialState();
}

class UserLoadingState extends UserState {
  const UserLoadingState();
}

class UserLoadedState extends UserState {
  final User? user;
  const UserLoadedState(this.user);
}

class UserErrorState extends UserState {
  final String message;

  const UserErrorState(this.message);
}
