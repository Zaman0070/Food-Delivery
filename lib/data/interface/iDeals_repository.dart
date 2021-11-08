import 'package:zcart/data/models/deals/deals_under_the_price_model.dart';

abstract class IDealsRepository {
  Future<DealsUnderThePrice> fetchDealsUnderThePrice();
}
