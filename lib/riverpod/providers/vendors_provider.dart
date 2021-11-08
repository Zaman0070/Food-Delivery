import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iVendors_repository.dart';
import 'package:zcart/data/repository/vendors_repository.dart';
import 'package:zcart/riverpod/notifier/vendors/vendor_feedback_state_notifier.dart';
import 'package:zcart/riverpod/notifier/vendors/vendor_item_state_notifier.dart';
import 'package:zcart/riverpod/notifier/vendors/vendors_state_notifier.dart';
import 'package:zcart/riverpod/notifier/vendors/vendor_details_state_notifier.dart';
import 'package:zcart/riverpod/state/state.dart';

/// Vendor Repo
final _vendorsRepositoryProvider =
    Provider<IVendorsRepository>((ref) => VendorRepository());

/// Vendor List
final vendorsNotifierProvider =
    StateNotifierProvider<VendorsNotifier, VendorsState>(
        (ref) => VendorsNotifier(ref.watch(_vendorsRepositoryProvider)));

/// Vendor Details
final vendorDetailsNotifierProvider =
    StateNotifierProvider<VendorDetailsNotifier, VendorDetailsState>(
        (ref) => VendorDetailsNotifier(ref.watch(_vendorsRepositoryProvider)));

/// Vendor Items
final vendorItemsNotifierProvider =
    StateNotifierProvider<VendorItemNotifier, VendorItemsState>(
        (ref) => VendorItemNotifier(ref.watch(_vendorsRepositoryProvider)));

/// Vendor Details
final vendorFeedbackNotifierProvider =
    StateNotifierProvider<VendorFeedbackNotifier, VendorFeedbackState>(
        (ref) => VendorFeedbackNotifier(ref.watch(_vendorsRepositoryProvider)));
