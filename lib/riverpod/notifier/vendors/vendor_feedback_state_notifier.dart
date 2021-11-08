import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class VendorFeedbackNotifier extends StateNotifier<VendorFeedbackState> {
  final IVendorsRepository _iVendorsRepository;

  VendorFeedbackNotifier(this._iVendorsRepository)
      : super(VendorFeedbackInitialState());

  Future<void> getVendorFeedback(String slug) async {
    try {
      state = VendorFeedbackLoadingState();
      final vendorFeddbacks =
          await _iVendorsRepository.fetchVendorFeedback(slug);
      state = VendorFeedbackLoadedState(vendorFeddbacks);
    } on NetworkException {
      state = VendorFeedbackErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
