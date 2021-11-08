import 'package:zcart/data/models/sliders/slider_model.dart';

abstract class ISliderRepository {
  Future<List<SliderList>?> fetchSlider();
}
