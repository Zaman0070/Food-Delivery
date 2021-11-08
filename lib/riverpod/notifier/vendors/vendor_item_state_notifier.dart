import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class VendorItemNotifier extends StateNotifier<VendorItemsState> {
  final IVendorsRepository _iVendorsRepository;

  VendorItemNotifier(this._iVendorsRepository)
      : super(VendorItemInitialState());

  Future<void> getVendorItems(String? slug) async {
    try {
      state = VendorItemLoadingState();
      final vendorsDetails =
          await _iVendorsRepository.fetchVendorItemList(slug);
      state = VendorItemLoadedState(vendorsDetails);
    } on NetworkException {
      state = VendorItemErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> getMoreVendorItems() async {
    try {
      // state = VendorItemLoadingState();
      final vendorsDetails =
          await _iVendorsRepository.fetchMoreVendorItemList();
      state = VendorItemLoadedState(vendorsDetails);
    } on NetworkException {
      state = VendorItemErrorState(
          "Couldn't fetch Vendors Item Data. Something went wrong!");
    }
  }
}
