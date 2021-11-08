import 'package:zcart/data/models/others/about_us_model.dart';

abstract class AboutUsState {
  const AboutUsState();
}

class AboutUsInitialState extends AboutUsState {
  const AboutUsInitialState();
}

class AboutUsLoadingState extends AboutUsState {
  const AboutUsLoadingState();
}

class AboutUsUpdatingState extends AboutUsState {
  const AboutUsUpdatingState();
}

class AboutUsLoadedState extends AboutUsState {
  final AboutUsModel aboutUsModel;

  const AboutUsLoadedState(this.aboutUsModel);
}

class AboutUsErrorState extends AboutUsState {
  final String message;

  const AboutUsErrorState(this.message);
}