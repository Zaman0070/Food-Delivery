import 'package:zcart/data/interface/iAddress_repository.dart';
import 'package:zcart/data/models/address/address_model.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/riverpod/state/address/address_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  final IAddressRepository _iAddressRepository;

  AddressNotifier(this._iAddressRepository) : super(AddressInitialState());

  Future fetchAddress() async {
    try {
      state = AddressLoadingState();
      final addresses = await _iAddressRepository.fetchAddresses();
      state = AddressLoadedState(addresses);
    } on NetworkException {
      state = AddressErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future createAddress({
    String? addressType,
    String? contactPerson,
    String? contactNumber,
    String? countryId,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? addressLine1,
    String? addressLine2,
  }) async {
    if (!accessAllowed) {
      var requestBody = {
        'data': [
          {
            'address_type': addressType,
            'address_title': contactPerson,
            'address_line_1': addressLine1,
            'address_line_2': addressLine2,
            'city': cityId,
            'state_id': stateId,
            'country_id': countryId,
            'zip_code': zipCode,
            'phone': contactNumber,
          },
        ]
      };
      AddressModel addressModel = AddressModel.fromJson(requestBody);
      state = AddressLoadedState(addressModel.data);
    } else {
      try {
        //state = AddressLoadingState();
        await _iAddressRepository.createAddress(
          addressType,
          contactPerson,
          contactNumber,
          countryId,
          stateId,
          cityId,
          zipCode,
          addressLine1,
          addressLine2,
        );
        //state = AddressLoadedState();
        fetchAddress();
      } on NetworkException {
        state = AddressErrorState(LocaleKeys.something_went_wrong.tr());
      }
    }
  }

  Future editAddress({
    int? addressId,
    String? addressType,
    String? contactPerson,
    String? contactNumber,
    String? countryId,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? addressLine1,
    String? addressLine2,
  }) async {
    if (!accessAllowed) {
      var requestBody = {
        'data': [
          {
            'address_type': addressType,
            'address_title': contactPerson,
            'address_line_1': addressLine1,
            'address_line_2': addressLine2,
            'city': cityId,
            'state_id': stateId,
            'country_id': countryId,
            'zip_code': zipCode,
            'phone': contactNumber,
          },
        ]
      };
      AddressModel addressModel = AddressModel.fromJson(requestBody);
      state = AddressLoadedState(addressModel.data);
    } else {
      try {
        // state = AddressLoadingState();
        await _iAddressRepository.editAddress(
          addressId,
          addressType,
          contactPerson,
          contactNumber,
          countryId,
          stateId,
          cityId,
          zipCode,
          addressLine1,
          addressLine2,
        );
        // state = AddressLoadedState();
        fetchAddress();
      } on NetworkException {
        state = AddressErrorState(LocaleKeys.something_went_wrong.tr());
      }
    }
  }

  Future deleteAddress({
    int? addressId,
    String? addressType,
    String? contactPerson,
    String? contactNumber,
    String? countryId,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? addressLine1,
    String? addressLine2,
  }) async {
    try {
      //state = AddressLoadingState();
      await _iAddressRepository.deleteAddress(addressId);
      //state = AddressLoadedState();
      fetchAddress();
    } on NetworkException {
      state = AddressErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class PackagingNotifier extends StateNotifier<PackagingState> {
  final IAddressRepository _iAddressRepository;

  PackagingNotifier(this._iAddressRepository) : super(PackagingInitialState());

  Future fetchPackagingInfo(shopSlug) async {
    try {
      state = PackagingLoadingState();
      final packagingList =
          await _iAddressRepository.fetchPackagingInfo(shopSlug);
      state = PackagingLoadedState(packagingList);
    } on NetworkException {
      state = PackagingErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class ShippingNotifier extends StateNotifier<ShippingState> {
  final IAddressRepository _iAddressRepository;

  ShippingNotifier(this._iAddressRepository) : super(ShippingInitialState());

  Future fetchShippingInfo(shopId, zoneId) async {
    try {
      state = ShippingLoadingState();
      final shippingInfo =
          await _iAddressRepository.fetchShippingInfo(shopId, zoneId);
      state = ShippingLoadedState(shippingInfo);
    } on NetworkException {
      state = ShippingErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future fetchShippingOptions(id, countryId, stateId) async {
    try {
      state = ShippingLoadingState();
      final shippingOptions = await _iAddressRepository.fetchShippingOptions(
          id, countryId, stateId);
      state = ShippingOptionsLoadedState(shippingOptions);
    } on NetworkException {
      state = ShippingErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class PaymentOptionsNotifier extends StateNotifier<PaymentOptionsState> {
  final IAddressRepository _iAddressRepository;

  PaymentOptionsNotifier(this._iAddressRepository)
      : super(PaymentOptionsInitialState());

  Future fetchPaymentMethod(shopSlug) async {
    try {
      state = PaymentOptionsLoadingState();
      final paymentOptions =
          await _iAddressRepository.fetchPaymentMethods(shopSlug);
      state = PaymentOptionsLoadedState(paymentOptions);
    } on NetworkException {
      state = PaymentOptionsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
