import 'package:zcart/data/models/vendors/vendor_details_model.dart';
import 'package:zcart/data/models/vendors/vendor_feedback_model.dart';
import 'package:zcart/data/models/vendors/vendor_items_model.dart';
import 'package:zcart/data/models/vendors/vendors_model.dart';

abstract class IVendorsRepository {
  Future<List<VendorsList>?> fetchVendorsList();

  Future<VendorDetails?> fetchVendorDetails(String? slug);

  /// Fetch Items under vendor
  Future<List<VendorItemList>?> fetchVendorItemList(String? slug);
  Future<List<VendorItemList>?> fetchMoreVendorItemList();

  Future<List<VendorFeedback>?> fetchVendorFeedback(String slug);
}