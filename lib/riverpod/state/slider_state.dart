import 'package:zcart/data/models/sliders/slider_model.dart';

abstract class SliderState {
  const SliderState();
}

class SliderInitialState extends SliderState {
  const SliderInitialState();
}

class SliderLoadingState extends SliderState {
  const SliderLoadingState();
}

class SliderLoadedState extends SliderState {
  final List<SliderList>? sliderList;

  const SliderLoadedState(this.sliderList);
}

class SliderErrorState extends SliderState {
  final String message;

  const SliderErrorState(this.message);
}
