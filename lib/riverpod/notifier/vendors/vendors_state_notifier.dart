import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/vendors_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class VendorsNotifier extends StateNotifier<VendorsState> {
  final IVendorsRepository _iVendorsRepository;

  VendorsNotifier(this._iVendorsRepository) : super(VendorsInitialState());

  Future<void> getVendors() async {
    try {
      state = VendorsLoadingState();
      final vendors = await _iVendorsRepository.fetchVendorsList();
      state = VendorsLoadedState(vendors);
    } on NetworkException {
      state = VendorsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
