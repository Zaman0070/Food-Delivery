import 'package:zcart/data/models/others/privacy_policy_model.dart';

abstract class PrivacyPolicyState {
  const PrivacyPolicyState();
}

class PrivacyPolicyInitialState extends PrivacyPolicyState {
  const PrivacyPolicyInitialState();
}

class PrivacyPolicyLoadingState extends PrivacyPolicyState {
  const PrivacyPolicyLoadingState();
}

class PrivacyPolicyUpdatingState extends PrivacyPolicyState {
  const PrivacyPolicyUpdatingState();
}

class PrivacyPolicyLoadedState extends PrivacyPolicyState {
  final PrivacyPolicyModel privacyPolicyModel;

  const PrivacyPolicyLoadedState(this.privacyPolicyModel);
}

class PrivacyPolicyErrorState extends PrivacyPolicyState {
  final String message;

  const PrivacyPolicyErrorState(this.message);
}