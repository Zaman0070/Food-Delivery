import 'package:zcart/data/interface/iAddress_repository.dart';
import 'package:zcart/data/models/address/address_model.dart';
import 'package:zcart/data/models/address/country_model.dart';
import 'package:zcart/data/models/address/packaging_model.dart';
import 'package:zcart/data/models/address/payment_options_model.dart';
import 'package:zcart/data/models/address/shipping_model.dart';
import 'package:zcart/data/models/address/shipping_options_model.dart';
import 'package:zcart/data/models/address/states_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class AddressRepository implements IAddressRepository {
  @override
  Future createAddress(
    String? addressType,
    String? contactPerson,
    String? contactNumber,
    String? countryId,
    String? stateId,
    String? cityId,
    String? zipCode,
    String? addressLine1,
    String? addressLine2,
  ) async {
    var requestBody = {
      'address_type': addressType,
      'address_title': contactPerson,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'city': cityId,
      'state_id': stateId,
      'country_id': countryId,
      'zip_code': zipCode,
      'phone': contactNumber,
    };
    var responseBody;

    try {
      responseBody = await handleResponse(
          await postRequest(API.createAddress, requestBody, bearerToken: true));
    } catch (e) {
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future editAddress(
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
  ) async {
    var requestBody = {
      'address_type': addressType,
      'address_title': contactPerson,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'city': cityId,
      'state_id': stateId,
      'country_id': countryId,
      'zip_code': zipCode,
      'phone': contactNumber,
    };
    var responseBody;

    try {
      responseBody = await handleResponse(await putRequest(
          API.editAddress(addressId), requestBody,
          bearerToken: true));
    } catch (e) {
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future deleteAddress(int? addressId) async {
    var responseBody;

    try {
      responseBody = await handleResponse(
          await deleteRequest(API.deleteAddress(addressId), bearerToken: true));
    } catch (e) {
      throw NetworkException();
    }

    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future<List<Addresses>?> fetchAddresses() async {
    var responseBody;
    AddressModel addressModel;
    try {
      responseBody = await handleResponse(
          await getRequest(API.addresses, bearerToken: true));
      addressModel = AddressModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return addressModel.data;
  }

  @override
  Future<List<Countries>?> fetchCountries() async {
    var responseBody;
    CountryModel countryModel;
    try {
      responseBody = await handleResponse(
          await getRequest(API.countries, bearerToken: true));
      countryModel = CountryModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return countryModel.data;
  }

  @override
  Future<List<States>?> fetchStates(int? countryId) async {
    var responseBody;
    StatesModel statesModel;
    try {
      responseBody = await handleResponse(
          await getRequest(API.states(countryId), bearerToken: true));
      statesModel = StatesModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return statesModel.data;
  }

  @override
  Future<List<PackagingModel>> fetchPackagingInfo(String? shopSlug) async {
    var responseBody;
    List<PackagingModel> packagingModelList;
    try {
      responseBody =
          await handleResponse(await getRequest(API.packaging(shopSlug)));
      packagingModelList = (responseBody as List<dynamic>)
          .map((e) => PackagingModel.fromJson(e))
          .toList();
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) {
      if ((responseBody as int) > 206) throw NetworkException();
    }
    return packagingModelList;
  }

  @override
  Future<List<PaymentOptions>?> fetchPaymentMethods(String? shopSlug) async {
    var responseBody;
    PaymentOptionsModel paymentOptionsModel;
    try {
      responseBody = await handleResponse(await getRequest(
        API.paymentOptions(shopSlug), /*bearerToken: true*/
      ));
      paymentOptionsModel = PaymentOptionsModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return paymentOptionsModel.data;
  }

  @override
  Future<List<ShippingOptions>?> fetchShippingInfo(
      int? shopId, int? zoneId) async {
    var responseBody;
    ShippingModel shippingModel;
    try {
      responseBody = await handleResponse(await postRequest(
        API.shipping(shopId, zoneId),
        null, /*bearerToken: true*/
      ));
      shippingModel = ShippingModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return shippingModel.data;
  }

  @override
  Future<List<ShippingOption>?> fetchShippingOptions(
      id, countryId, stateId) async {
    var responseBody;
    var requestBody = {
      'ship_to': countryId.toString(),
      if (stateId != null) 'state_id': stateId
    };
    ShippingOptionsModel shippingOptionsModel;
    try {
      responseBody = await handleResponse(await postRequest(
          API.shippingOptions(id), requestBody,
          bearerToken: true));
      shippingOptionsModel = ShippingOptionsModel.fromJson(responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    return shippingOptionsModel.shippingOptions;
  }
}
