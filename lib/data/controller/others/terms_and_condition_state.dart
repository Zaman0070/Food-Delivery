import 'package:zcart/data/models/others/terms_and_condition_model.dart';

abstract class TermsAndConditionState {
  const TermsAndConditionState();
}

class TermsAndConditionInitialState extends TermsAndConditionState {
  const TermsAndConditionInitialState();
}

class TermsAndConditionLoadingState extends TermsAndConditionState {
  const TermsAndConditionLoadingState();
}

class TermsAndConditionUpdatingState extends TermsAndConditionState {
  const TermsAndConditionUpdatingState();
}

class TermsAndConditionLoadedState extends TermsAndConditionState {
  final TermsAndConditionModel termsAndConditionModel;

  const TermsAndConditionLoadedState(this.termsAndConditionModel);
}

class TermsAndConditionErrorState extends TermsAndConditionState {
  final String message;

  const TermsAndConditionErrorState(this.message);
}
