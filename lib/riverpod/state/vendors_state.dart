import 'package:zcart/data/models/vendors/vendor_details_model.dart';
import 'package:zcart/data/models/vendors/vendor_feedback_model.dart';
import 'package:zcart/data/models/vendors/vendor_items_model.dart';
import 'package:zcart/data/models/vendors/vendors_model.dart';

/// Vendor List State
abstract class VendorsState {
  const VendorsState();
}

class VendorsInitialState extends VendorsState {
  const VendorsInitialState();
}

class VendorsLoadingState extends VendorsState {
  const VendorsLoadingState();
}

class VendorsLoadedState extends VendorsState {
  final List<VendorsList>? vendorsList;

  const VendorsLoadedState(this.vendorsList);
}

class VendorsErrorState extends VendorsState {
  final String message;

  const VendorsErrorState(this.message);
}

/// Vendors Details State
abstract class VendorDetailsState {
  const VendorDetailsState();
}

class VendorDetailsInitialState extends VendorDetailsState {
  const VendorDetailsInitialState();
}

class VendorDetailsLoadingState extends VendorDetailsState {
  const VendorDetailsLoadingState();
}

class VendorDetailsLoadedState extends VendorDetailsState {
  final VendorDetails? vendorDetails;

  const VendorDetailsLoadedState(this.vendorDetails);
}

class VendorDetailsErrorState extends VendorDetailsState {
  final String message;

  const VendorDetailsErrorState(this.message);
}

/// Vendor Items State
abstract class VendorItemsState {
  const VendorItemsState();
}

class VendorItemInitialState extends VendorItemsState {
  const VendorItemInitialState();
}

class VendorItemLoadingState extends VendorItemsState {
  const VendorItemLoadingState();
}

class VendorItemLoadedState extends VendorItemsState {
  final List<VendorItemList>? vendorItem;

  const VendorItemLoadedState(this.vendorItem);
}

class VendorItemErrorState extends VendorItemsState {
  final String message;

  const VendorItemErrorState(this.message);
}

/// Vendor Feedback State
abstract class VendorFeedbackState {
  const VendorFeedbackState();
}

class VendorFeedbackInitialState extends VendorFeedbackState {
  const VendorFeedbackInitialState();
}

class VendorFeedbackLoadingState extends VendorFeedbackState {
  const VendorFeedbackLoadingState();
}

class VendorFeedbackLoadedState extends VendorFeedbackState {
  final List<VendorFeedback>? vendorFeedback;

  const VendorFeedbackLoadedState(this.vendorFeedback);
}

class VendorFeedbackErrorState extends VendorFeedbackState {
  final String message;

  const VendorFeedbackErrorState(this.message);
}
