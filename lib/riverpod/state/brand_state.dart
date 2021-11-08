import 'package:zcart/data/models/brand/all_brands_model.dart';
import 'package:zcart/data/models/brand/brand_items_list_model.dart';
import 'package:zcart/data/models/brand/brand_profile_model.dart';

/// Brand List State
abstract class BrandsState {
  const BrandsState();
}

class BrandsInitialState extends BrandsState {
  const BrandsInitialState();
}

class BrandsLoadingState extends BrandsState {
  const BrandsLoadingState();
}

class BrandsLoadedState extends BrandsState {
  final AllBrands? allBrands;

  const BrandsLoadedState(this.allBrands);
}

class BrandsErrorState extends BrandsState {
  final String message;

  const BrandsErrorState(this.message);
}

/// Brand List State
abstract class FeaturedBrandsState {
  const FeaturedBrandsState();
}

class FeaturedBrandsInitialState extends FeaturedBrandsState {
  const FeaturedBrandsInitialState();
}

class FeaturedBrandsLoadingState extends FeaturedBrandsState {
  const FeaturedBrandsLoadingState();
}

class FeaturedBrandsLoadedState extends FeaturedBrandsState {
  final AllBrands? featuredBrands;

  const FeaturedBrandsLoadedState(this.featuredBrands);
}

class FeaturedBrandsErrorState extends FeaturedBrandsState {
  final String message;

  const FeaturedBrandsErrorState(this.message);
}

/// Brand Details State
abstract class BrandProfileState {
  const BrandProfileState();
}

class BrandProfileInitialState extends BrandProfileState {
  const BrandProfileInitialState();
}

class BrandProfileLoadingState extends BrandProfileState {
  const BrandProfileLoadingState();
}

class BrandProfileLoadedState extends BrandProfileState {
  final BrandProfile brandProfile;

  const BrandProfileLoadedState(this.brandProfile);
}

class BrandProfileErrorState extends BrandProfileState {
  final String message;

  const BrandProfileErrorState(this.message);
}

/// Brand Items State
abstract class BrandItemsState {
  const BrandItemsState();
}

class BrandItemsInitialState extends BrandItemsState {
  const BrandItemsInitialState();
}

class BrandItemsLoadingState extends BrandItemsState {
  const BrandItemsLoadingState();
}

class BrandItemsLoadedState extends BrandItemsState {
  final BrandItemsList brandItemsList;

  const BrandItemsLoadedState(this.brandItemsList);
}

class BrandItemsErrorState extends BrandItemsState {
  final String message;

  const BrandItemsErrorState(this.message);
}
