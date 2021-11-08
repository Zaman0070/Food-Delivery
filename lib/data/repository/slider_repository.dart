import 'package:zcart/data/interface/iSlider_repository.dart';
import 'package:zcart/data/models/sliders/slider_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class SliderRepository implements ISliderRepository {
  @override
  Future<List<SliderList>?> fetchSlider() async {
    var responseBody = await handleResponse(await getRequest(API.slider));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) {
        throw NetworkException();
      }
    }
    SliderModel sliderModel = SliderModel.fromJson(responseBody);
    return sliderModel.data;
  }
}
