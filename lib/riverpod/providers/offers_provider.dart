import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iOffers_repository.dart';
import 'package:zcart/data/repository/offers_repository.dart';
import 'package:zcart/riverpod/notifier/offers_state_notifier.dart';
import 'package:zcart/riverpod/state/offers_state.dart';

final offersRepositoryProvider =
    Provider<IOffersRepository>((ref) => OffersRepository());

final offersNotifierProvider =
    StateNotifierProvider<OffersNotifier, OffersState>(
        (ref) => OffersNotifier(ref.watch(offersRepositoryProvider)));
