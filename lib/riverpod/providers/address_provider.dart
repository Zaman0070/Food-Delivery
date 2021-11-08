import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iAddress_repository.dart';
import 'package:zcart/data/repository/address_repository.dart';
import 'package:zcart/riverpod/notifier/address/address_state_notifier.dart';
import 'package:zcart/riverpod/notifier/address/country_state_notifier.dart';
import 'package:zcart/riverpod/notifier/address/states_state_notifier.dart';
import 'package:zcart/riverpod/state/address/address_state.dart';
import 'package:zcart/riverpod/state/address/country_state.dart'
    as countryState;
import 'package:zcart/riverpod/state/address/states_state.dart';

final addressRepositoryProvider =
    Provider<IAddressRepository>((ref) => AddressRepository());

final addressNotifierProvider =
    StateNotifierProvider<AddressNotifier, AddressState>(
        (ref) => AddressNotifier(ref.watch(addressRepositoryProvider)));

final countryNotifierProvider =
    StateNotifierProvider<CountryNotifier, countryState.CountryState>(
        (ref) => CountryNotifier(ref.watch(addressRepositoryProvider)));

final statesNotifierProvider =
    StateNotifierProvider<StatesNotifier, StatesState>(
        (ref) => StatesNotifier(ref.watch(addressRepositoryProvider)));

final packagingNotifierProvider =
    StateNotifierProvider<PackagingNotifier, PackagingState>(
        (ref) => PackagingNotifier(ref.watch(addressRepositoryProvider)));

final shippingNotifierProvider =
    StateNotifierProvider<ShippingNotifier, ShippingState>(
        (ref) => ShippingNotifier(ref.watch(addressRepositoryProvider)));

final paymentOptionsNotifierProvider =
    StateNotifierProvider<PaymentOptionsNotifier, PaymentOptionsState>(
        (ref) => PaymentOptionsNotifier(ref.watch(addressRepositoryProvider)));
