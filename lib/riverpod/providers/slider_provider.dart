import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iSlider_repository.dart';
import 'package:zcart/data/repository/slider_repository.dart';
import 'package:zcart/riverpod/notifier/slider_state_notifier.dart';
import 'package:zcart/riverpod/state/slider_state.dart';

final sliderRepositoryProvider =
    Provider<ISliderRepository>((ref) => SliderRepository());

final sliderNotifierProvider =
    StateNotifierProvider<SliderNotifier, SliderState>(
        (ref) => SliderNotifier(ref.watch(sliderRepositoryProvider)));
