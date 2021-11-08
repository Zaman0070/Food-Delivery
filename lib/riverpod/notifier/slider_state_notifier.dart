import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iSlider_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/slider_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class SliderNotifier extends StateNotifier<SliderState> {
  final ISliderRepository _iSliderRepository;

  SliderNotifier(this._iSliderRepository) : super(SliderInitialState());

  Future<void> getSlider() async {
    try {
      state = SliderLoadingState();
      final slider = await _iSliderRepository.fetchSlider();
      state = SliderLoadedState(slider);
    } on NetworkException {
      state = SliderErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
