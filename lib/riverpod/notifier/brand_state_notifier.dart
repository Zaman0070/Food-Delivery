import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iBrand_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/brand_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AllBrandsNotifier extends StateNotifier<BrandsState> {
  final IBrandRepository _iBrandRepository;

  AllBrandsNotifier(this._iBrandRepository) : super(BrandsInitialState());

  Future<void> getAllBrands() async {
    try {
      state = BrandsLoadingState();
      final brands = await _iBrandRepository.fetchAllBrands();
      state = BrandsLoadedState(brands);
    } on NetworkException {
      state = BrandsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class FeaturedBrandsNotifier extends StateNotifier<FeaturedBrandsState> {
  final IBrandRepository _iBrandRepository;

  FeaturedBrandsNotifier(this._iBrandRepository)
      : super(FeaturedBrandsInitialState());

  Future<void> getFeaturedBrands() async {
    try {
      state = FeaturedBrandsLoadingState();
      final brands = await _iBrandRepository.fetchFeaturedBrands();
      state = FeaturedBrandsLoadedState(brands);
    } on NetworkException {
      state = FeaturedBrandsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class BrandProfileNotifier extends StateNotifier<BrandProfileState> {
  final IBrandRepository _iBrandRepository;

  BrandProfileNotifier(this._iBrandRepository)
      : super(BrandProfileInitialState());

  Future<void> getBrandProfile(String? slug) async {
    try {
      state = BrandProfileLoadingState();
      final brandProfile = await _iBrandRepository.fetchBrandProfile(slug);
      state = BrandProfileLoadedState(brandProfile);
    } on NetworkException {
      state = BrandProfileErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class BrandItemsListNotifier extends StateNotifier<BrandItemsState> {
  final IBrandRepository _iBrandRepository;

  BrandItemsListNotifier(this._iBrandRepository)
      : super(BrandItemsInitialState());

  Future<void> getBrandItemsList(String? slug) async {
    try {
      state = BrandItemsInitialState();
      final brandItemsList = await _iBrandRepository.fetchBrandItems(slug);
      state = BrandItemsLoadedState(brandItemsList);
    } on NetworkException {
      state = BrandItemsErrorState(
          "Couldn't fetch brand items list. Something went wrong!");
    }
  }
}
