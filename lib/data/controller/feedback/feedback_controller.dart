import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/feedback/feedback_state.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

final sellerFeedbackProvider = StateNotifierProvider<SellerFeedbackRepository, SellerFeedbackState>((ref) => SellerFeedbackRepository());

class SellerFeedbackRepository extends StateNotifier<SellerFeedbackState> {
  SellerFeedbackRepository() : super(SellerFeedbackInitialState());

  Future postFeedback(orderId, rating, comment) async {
    state = SellerFeedbackLoadingState();

    var responseBody;

    var requestBody = {
      'rating': rating,
      'comment': comment,
    };
    try {
      responseBody = await handleResponse(await postRequest(API.sellerFeedback(orderId), requestBody, bearerToken: true));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      state = SellerFeedbackLoadedState();
    } on NetworkException {
      state = SellerFeedbackErrorState('Something went wrong');
    }
  }
}

final productFeedbackProvider = StateNotifierProvider<ProductFeedbackRepository, ProductFeedbackState>((ref) => ProductFeedbackRepository());

class ProductFeedbackRepository extends StateNotifier<ProductFeedbackState> {
  ProductFeedbackRepository() : super(ProductFeedbackInitialState());

  Future postFeedback(orderId, List listingId, List ratings, List comments) async {
    state = ProductFeedbackLoadingState();

    var responseBody;

    var requestBody = {};
    for (int i = 0; i < listingId.length; i++) {
      requestBody['items[${listingId[i]}][rating]'] = ratings[i].toString();
      requestBody['items[${listingId[i]}][comment]'] = comments[i];
    }
    print(requestBody);
    try {
      responseBody = await handleResponse(await postRequest(API.productFeedback(orderId), requestBody, bearerToken: true));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      state = ProductFeedbackLoadedState();
    } on NetworkException {
      state = ProductFeedbackErrorState('Something went wrong');
    }
  }
}
