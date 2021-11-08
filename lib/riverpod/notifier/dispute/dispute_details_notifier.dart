import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/dispute/dispute_details_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class DisputeDetailsNotifier extends StateNotifier<DisputeDetailsState> {
  final IDisputeRepository _iDisputeRepository;

  DisputeDetailsNotifier(this._iDisputeRepository)
      : super(DisputeDetailsInitialState());

  Future getDisputeDetails(disputeId) async {
    try {
      state = DisputeDetailsLoadingState();
      final disputeDetails =
          await _iDisputeRepository.disputeDetails(disputeId);
      state = DisputeDetailsLoadedState(disputeDetails);
    } on NetworkException {
      state = DisputeDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future postDisputeRespose(disputeId, requestBody) async {
    try {
      await _iDisputeRepository.responseDispute(disputeId, requestBody);
      getDisputeDetails(disputeId);
    } on NetworkException {
      state = DisputeDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future postDisputeAppeal(disputeId, requestBody) async {
    try {
      await _iDisputeRepository.appealDispute(disputeId, requestBody);
      await getDisputeDetails(disputeId);
      toast(LocaleKeys.appeal_is_sent.tr());
    } on NetworkException {
      state = DisputeDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
