import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iBrand_repository.dart';
import 'package:zcart/data/repository/brand_repository.dart';
import 'package:zcart/riverpod/notifier/brand_state_notifier.dart';
import 'package:zcart/riverpod/state/brand_state.dart';

/// Brand Repo
final _brandRepositoryProvider =
    Provider<IBrandRepository>((ref) => BrandRepository());

/// All Brands
final allBrandsNotifierProvider =
    StateNotifierProvider<AllBrandsNotifier, BrandsState>(
        (ref) => AllBrandsNotifier(ref.watch(_brandRepositoryProvider)));

/// All Brands
final featuredBrandsNotifierProvider =
    StateNotifierProvider<FeaturedBrandsNotifier, FeaturedBrandsState>(
        (ref) => FeaturedBrandsNotifier(ref.watch(_brandRepositoryProvider)));

/// Brand Profile
final brandProfileNotifierProvider =
    StateNotifierProvider<BrandProfileNotifier, BrandProfileState>(
        (ref) => BrandProfileNotifier(ref.watch(_brandRepositoryProvider)));

/// Brand Items List
final brandItemsListNotifierProvider =
    StateNotifierProvider<BrandItemsListNotifier, BrandItemsState>(
        (ref) => BrandItemsListNotifier(ref.watch(_brandRepositoryProvider)));
