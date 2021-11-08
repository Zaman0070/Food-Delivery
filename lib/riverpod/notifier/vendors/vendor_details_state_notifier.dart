import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class VendorDetailsNotifier extends StateNotifier<VendorDetailsState> {
  final IVendorsRepository _iVendorsRepository;

  VendorDetailsNotifier(this._iVendorsRepository)
      : super(VendorDetailsInitialState());

  Future<void> getVendorDetails(String? slug) async {
    try {
      state = VendorDetailsLoadingState();
      final vendorsDetails = await _iVendorsRepository.fetchVendorDetails(slug);
      state = VendorDetailsLoadedState(vendorsDetails);
    } on NetworkException {
      state = VendorDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
