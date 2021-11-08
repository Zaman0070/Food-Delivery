import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/dispute/dispute_info_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class DisputeInfoNotifier extends StateNotifier<DisputeInfoState> {
  final IDisputeRepository _iDisputeRepository;

  DisputeInfoNotifier(this._iDisputeRepository)
      : super(DisputeInfoInitialState());

  Future getDisputeInfo(orderId) async {
    try {
      state = DisputeInfoLoadingState();
      final disputeInfo = await _iDisputeRepository.fetchDisputeInfo(orderId);
      state = DisputeInfoLoadedState(disputeInfo);
    } on NetworkException {
      state = DisputeInfoErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
