import 'package:zcart/data/models/offers/offers_model.dart';

/* More offers from Seller */
abstract class IOffersRepository {
  Future<OffersModel> fetchOffersFromOtherSellers(String? slug);
}
