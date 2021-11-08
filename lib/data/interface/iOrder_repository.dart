abstract class IOrderRepository {
  Future orders();
  Future order(orderId);
  Future orderReceived(orderId);
}
