import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/dispute/open_dispute_state.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class OpenDisputeNotifier extends StateNotifier<OpenDisputeState> {
  final IDisputeRepository _iDisputeRepository;

  OpenDisputeNotifier(this._iDisputeRepository)
      : super(OpenDisputeInitialState());

  String? disputeType;
  String? orderReceived;
  String? productId;
  String? refundAmount;
  String? description;
  String? returnGoods;

  Future getOpenDispute(orderId) async {
    var requestBody = {
      if (disputeType != null) "dispute_type_id": disputeType,
      if (orderReceived != null) "order_received": orderReceived,
      if (productId != null) "product_id": productId,
      if (refundAmount != null) "refund_amount": refundAmount,
      if (description != null) "description": description,
      if (returnGoods != null) "return_goods": returnGoods,
    };
    try {
      state = OpenDisputeLoadingState();
      await _iDisputeRepository.openDispute(orderId, requestBody);
      state = OpenDisputeLoadedState();
      disputeType = null;
      orderReceived = null;
      productId = null;
      refundAmount = null;
      description = null;
      returnGoods = null;
    } on NetworkException {
      state = OpenDisputeErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
