import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iUser_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/user_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class UserNotifier extends StateNotifier<UserState> {
  final IUserRepository _iUserRepository;

  UserNotifier(this._iUserRepository) : super(UserInitialState());

  Future<void> login(String username, String password) async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.logIn(username, password);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> loginUsingGoogle(String access_token) async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.logInUsingGoogle(access_token);
      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> loginUsingFacebook(String access_token) async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.logInUsingFacebook(access_token);
      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> register(String name, email, password,
      bool agreeToTermsAndCondition, acceptMarkeing) async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.register(
          name, email, password, agreeToTermsAndCondition, acceptMarkeing);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print('Registration Successfull with firebase');
      }
      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> logout() async {
    try {
      await _iUserRepository.logout();
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> getUserInfo() async {
    try {
      state = UserLoadingState();
      final user = await _iUserRepository.fetchUserInfo();
      state = UserLoadedState(user);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> updateUserInfo(String fullName, String nickName, String bio,
      String email, dynamic dob) async {
    try {
      await _iUserRepository.updateBasicInfo(
          fullName: fullName,
          nickName: nickName,
          bio: bio,
          email: email,
          dob: dob);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> updatePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    try {
      await _iUserRepository.updatePassword(
          oldPassword, newPassword, confirmPassword);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _iUserRepository.forgotPassword(email);
    } on NetworkException {
      state = UserErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
