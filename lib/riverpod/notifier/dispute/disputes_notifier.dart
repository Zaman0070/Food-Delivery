import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/dispute/disputes_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class DisputesNotifier extends StateNotifier<DisputesState> {
  final IDisputeRepository _iDisputeRepository;

  DisputesNotifier(this._iDisputeRepository) : super(DisputesInitialState());

  Future getDisputes() async {
    try {
      state = DisputesLoadingState();
      final disputes = await _iDisputeRepository.fetchDisputes();
      state = DisputesLoadedState(disputes);
    } on NetworkException {
      state = DisputesErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future getMoreDisputes() async {
    try {
      //state = RandomMoreItemLoadingState();
      final disputes = await _iDisputeRepository.fetchMoreDisputes();
      state = DisputesLoadedState(disputes);
    } on NetworkException {
      state = DisputesErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future markAsSolved(disputeId) async {
    try {
      await _iDisputeRepository.markAsSolved(disputeId);
      final disputes = await _iDisputeRepository.fetchDisputes();
      state = DisputesLoadedState(disputes);
    } on NetworkException {
      state = DisputesErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
