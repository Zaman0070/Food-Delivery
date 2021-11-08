import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:zcart/data/repository/dispute_repository.dart';
import 'package:zcart/riverpod/notifier/dispute/dispute_details_notifier.dart';
import 'package:zcart/riverpod/notifier/dispute/dispute_info_notifier.dart';
import 'package:zcart/riverpod/notifier/dispute/disputes_notifier.dart';
import 'package:zcart/riverpod/notifier/dispute/open_dispute_notifier.dart';
import 'package:zcart/riverpod/state/dispute/dispute_details_state.dart';
import 'package:zcart/riverpod/state/dispute/dispute_info_state.dart';
import 'package:zcart/riverpod/state/dispute/disputes_state.dart';
import 'package:zcart/riverpod/state/dispute/open_dispute_state.dart';

final disputeRepositoryProvider =
    Provider<IDisputeRepository>((ref) => DisputeRepository());

final disputesProvider = StateNotifierProvider<DisputesNotifier, DisputesState>(
    (ref) => DisputesNotifier(ref.watch(disputeRepositoryProvider)));
final disputeInfoProvider =
    StateNotifierProvider<DisputeInfoNotifier, DisputeInfoState>(
        (ref) => DisputeInfoNotifier(ref.watch(disputeRepositoryProvider)));
final openDisputeInfoProvider =
    StateNotifierProvider<OpenDisputeNotifier, OpenDisputeState>(
        (ref) => OpenDisputeNotifier(ref.watch(disputeRepositoryProvider)));
final disputeDetailsProvider =
    StateNotifierProvider<DisputeDetailsNotifier, DisputeDetailsState>(
        (ref) => DisputeDetailsNotifier(ref.watch(disputeRepositoryProvider)));
