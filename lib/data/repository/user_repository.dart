import 'package:zcart/data/interface/iUser_repository.dart';
import 'package:zcart/data/models/user/user_model.dart';
import 'package:zcart/helper/constants.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class UserRepository implements IUserRepository {
  /// Login user
  @override
  Future<User?> logIn(username, password) async {
    await setValue(LOGGED_IN, false);

    var requestBody = {'email': username.trim(), 'password': password};
    var responseBody;

    try {
      responseBody =
          await handleResponse(await postRequest(API.login, requestBody));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    UserModel userModel = UserModel.fromJson(responseBody);

    toast(LocaleKeys.sign_in_successfull.tr());
    await setValue(LOGGED_IN, true);
    await setValue(ACCESS, userModel.data!.apiToken);

    return userModel.data;
  }

  /// Login user Using Google
  @override
  Future<User?> logInUsingGoogle(String access_token) async {
    await setValue(LOGGED_IN, false);

    var requestBody = {'access_token': access_token};
    var responseBody;

    try {
      responseBody = await handleResponse(
          await postRequest(API.loginUsingGoogle, requestBody));
    } catch (e) {
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    UserModel userModel = UserModel.fromJson(responseBody);

    toast(LocaleKeys.sign_in_successfull.tr());
    await setValue(LOGGED_IN, true);
    await setValue(ACCESS, userModel.data!.apiToken);

    return userModel.data;
  }

  @override
  Future<User?> logInUsingFacebook(String access_token) async {
    await setValue(LOGGED_IN, false);

    var requestBody = {'access_token': access_token};
    var responseBody;

    try {
      responseBody = await handleResponse(
          await postRequest(API.loginUsingFacebook, requestBody));
    } catch (e) {
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    UserModel userModel = UserModel.fromJson(responseBody);

    toast(LocaleKeys.sign_in_successfull.tr());
    await setValue(LOGGED_IN, true);
    await setValue(ACCESS, userModel.data!.apiToken);

    return userModel.data;
  }

  /// Register User
  @override
  Future<User?> register(String name, email, password,
      bool agreeToTermsAndCondition, acceptMarkeing) async {
    var requestBody = {
      'name': name.trim(),
      'email': email.trim(),
      'password': password,
      'password_confirmation': password,
      'agree': agreeToTermsAndCondition.toString(),
      'accepts_marketing': acceptMarkeing.toString()
    };
    var responseBody;

    try {
      responseBody =
          await handleResponse(await postRequest(API.register, requestBody));
    } catch (e) {
      print(e);
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    UserModel userModel = UserModel.fromJson(responseBody);

    toast(LocaleKeys.register_successful.tr());
    await setValue(LOGGED_IN, true);
    await setValue(ACCESS, userModel.data!.apiToken);
    return userModel.data;
  }

  @override
  Future logout() async {
    var requestBody = {};
    var responseBody;

    try {
      responseBody = await handleResponse(
          await postRequest(API.logout, requestBody, bearerToken: true));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    toast(LocaleKeys.logged_out.tr());
    await getSharedPref().then((value) => value.clear());
  }

  /// Fetch user info
  @override
  Future<User?> fetchUserInfo() async {
    var responseBody;

    try {
      responseBody = await handleResponse(
          await getRequest(API.userInfo, bearerToken: true));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    UserModel userModel = UserModel.fromJson(responseBody);

    return userModel.data;
  }

  /// Update user account
  @override
  Future<void> updateBasicInfo(
      {String? fullName,
      String? nickName,
      String? bio,
      dynamic dob,
      String? email}) async {
    var requestBody = {
      'name': fullName,
      'nice_name': nickName,
      'description': bio,
      'dob': dob,
      'email': email
    };
    var responseBody;

    try {
      responseBody =
          await handleResponse(await putRequest(API.userInfo, requestBody));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    toast(
      LocaleKeys.profile_updated_successfully.tr(),
      gravity: ToastGravity.CENTER,
      bgColor: kPrimaryColor,
      textColor: kLightColor,
    );
  }

  @override
  Future updatePassword(String currentPassword, String newPassword,
      String confirmPassword) async {
    var requestBody = {
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': confirmPassword,
    };
    var responseBody;

    try {
      responseBody = await handleResponse(
          await putRequest(API.updatePassword, requestBody));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    toast(
      LocaleKeys.password_updated_successfully.tr(),
      gravity: ToastGravity.CENTER,
      bgColor: kPrimaryColor,
      textColor: kLightColor,
    );
  }

  @override
  Future forgotPassword(String email) async {
    var requestBody = {
      'email': email,
    };
    var responseBody;

    try {
      responseBody =
          await handleResponse(await postRequest(API.forgot, requestBody));
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    toast(
      LocaleKeys.password_reset_link_sent.tr(),
      gravity: ToastGravity.CENTER,
      bgColor: kPrimaryColor,
      textColor: kLightColor,
    );
  }
}
