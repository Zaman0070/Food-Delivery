import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/models/vendors/vendor_details_model.dart';
import 'package:zcart/data/models/vendors/vendor_feedback_model.dart';
import 'package:zcart/data/models/vendors/vendor_items_model.dart';
import 'package:zcart/data/models/vendors/vendors_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class VendorRepository implements IVendorsRepository {
  late VendorItemsModel vendorItemsModel;
  List<VendorItemList>? vendorItemList = [];

  @override
  Future<List<VendorsList>?> fetchVendorsList() async {
    var responseBody = await handleResponse(await getRequest(API.vendors));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    VendorModel vendorModel = VendorModel.fromJson(responseBody);
    return vendorModel.data;
  }

  @override
  Future<VendorDetails?> fetchVendorDetails(String? slug) async {
    var responseBody =
        await handleResponse(await getRequest(API.vendorDetails(slug)));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    VendorDetailsModel vendorDetailsModel =
        VendorDetailsModel.fromJson(responseBody);
    return vendorDetailsModel.data;
  }

  @override
  Future<List<VendorItemList>?> fetchVendorItemList(String? slug) async {
    if (vendorItemList != null) vendorItemList!.clear();
    var responseBody =
        await handleResponse(await getRequest(API.vendorItem(slug)));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    vendorItemsModel = VendorItemsModel.fromJson(responseBody);
    vendorItemList = vendorItemsModel.data;
    return vendorItemList;
  }

  @override
  Future<List<VendorItemList>?> fetchMoreVendorItemList() async {
    var responseBody;
    if (vendorItemsModel.links!.next != null) {
      toast(LocaleKeys.loading.tr());

      responseBody = await handleResponse(
          await getRequest(vendorItemsModel.links!.next!.split('api/').last));
      if (responseBody.runtimeType == int) if (responseBody > 206)
        throw NetworkException();

      vendorItemsModel = VendorItemsModel.fromJson(responseBody);
      vendorItemList!.addAll(vendorItemsModel.data!);
    } else {
      toast(LocaleKeys.reached_to_the_end.tr());
    }
    return vendorItemList;
  }

  @override
  Future<List<VendorFeedback>?> fetchVendorFeedback(String slug) async {
    var responseBody =
        await handleResponse(await getRequest(API.vendorFeedback(slug)));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    VendorFeedbackModel vendorFeedbackModel =
        VendorFeedbackModel.fromJson(responseBody);
    return vendorFeedbackModel.data;
  }
}
