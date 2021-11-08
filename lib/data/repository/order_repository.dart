import 'package:zcart/data/interface/iOrder_repository.dart';
import 'package:zcart/data/models/orders/order_details_model.dart';
import 'package:zcart/data/models/orders/orders_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class OrderRepository extends IOrderRepository {
  @override
  Future orders() async {
    var responseBody;
    try {
      responseBody = await handleResponse(await getRequest(API.orders, bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();
      OrdersModel orderModel = OrdersModel.fromJson(responseBody);
      return orderModel.data;
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future order(orderId) async {
    var responseBody;
    try {
      responseBody = await handleResponse(await getRequest(API.order(orderId), bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();
      OrderModel orderDetailsModel = OrderModel.fromJson(responseBody);
      return orderDetailsModel.data;
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future orderReceived(orderId) async {
    var responseBody;
    var requestBody = {'goods_received': true.toString()};
    try {
      responseBody = await handleResponse(await postRequest(API.orderReceived(orderId), requestBody, bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();
      /*OrderDetailsModel orderDetailsModel = OrderDetailsModel.fromJson(responseBody);
      return orderDetailsModel.data;*/
    } catch (e) {
      throw NetworkException();
    }
  }
}
