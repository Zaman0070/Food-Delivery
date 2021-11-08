abstract class ICheckoutRepository {
  Future checkout(int? cartId, requestBody);
  Future guestCheckout(cartId, requestBody);
}
