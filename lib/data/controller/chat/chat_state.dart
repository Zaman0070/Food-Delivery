import 'package:zcart/data/models/chat/conversation/conversation_model.dart';
import 'package:zcart/data/models/chat/order/order_chat_model.dart';
import 'package:zcart/data/models/chat/product/product_chat_model.dart';

/*Order Chat - Get*/
abstract class OrderChatState {
  const OrderChatState();
}

class OrderChatInitialState extends OrderChatState {
  const OrderChatInitialState();
}

class OrderChatLoadingState extends OrderChatState {
  const OrderChatLoadingState();
}

class OrderChatUpdatingState extends OrderChatState {
  const OrderChatUpdatingState();
}

class OrderChatInitialLoadedState extends OrderChatState {
  final OrderChatInitialModel orderChatInitialModel;
  OrderChatInitialLoadedState(
    this.orderChatInitialModel,
  );
}

class OrderChatLoadedState extends OrderChatState {
  final OrderChatModel orderChatModel;

  const OrderChatLoadedState(this.orderChatModel);
}

class OrderChatErrorState extends OrderChatState {
  final String message;

  const OrderChatErrorState(this.message);
}

/*Order Chat - Send*/
abstract class OrderChatSendState {
  const OrderChatSendState();
}

class OrderChatSendInitialState extends OrderChatSendState {
  const OrderChatSendInitialState();
}

class OrderChatSendLoadingState extends OrderChatSendState {
  const OrderChatSendLoadingState();
}

class OrderChatSendLoadedState extends OrderChatSendState {
  const OrderChatSendLoadedState();
}

class OrderChatSendErrorState extends OrderChatSendState {
  final String message;

  const OrderChatSendErrorState(this.message);
}

/*Product Chat - Get*/
abstract class ProductChatState {
  const ProductChatState();
}

class ProductChatInitialState extends ProductChatState {
  const ProductChatInitialState();
}

class ProductChatLoadingState extends ProductChatState {
  const ProductChatLoadingState();
}

class ProductChatUpdatingState extends ProductChatState {
  const ProductChatUpdatingState();
}

class ProductChatInitialLoadedState extends ProductChatState {
  final ProductChatInitialModel productChatModel;

  const ProductChatInitialLoadedState(this.productChatModel);
}

class ProductChatLoadedState extends ProductChatState {
  final ProductChatModel productChatModel;

  const ProductChatLoadedState(this.productChatModel);
}

class ProductChatErrorState extends ProductChatState {
  final String message;

  const ProductChatErrorState(this.message);
}

/*Product Chat - Send*/
abstract class ProductChatSendState {
  const ProductChatSendState();
}

class ProductChatSendInitialState extends ProductChatSendState {
  const ProductChatSendInitialState();
}

class ProductChatSendLoadingState extends ProductChatSendState {
  const ProductChatSendLoadingState();
}

class ProductChatSendLoadedState extends ProductChatSendState {
  const ProductChatSendLoadedState();
}

class ProductChatSendErrorState extends ProductChatSendState {
  final String message;

  const ProductChatSendErrorState(this.message);
}

/*Conversation*/
abstract class ConversationState {
  const ConversationState();
}

class ConversationInitialState extends ConversationState {
  const ConversationInitialState();
}

class ConversationLoadingState extends ConversationState {
  const ConversationLoadingState();
}

class ConversationUpdatingState extends ConversationState {
  const ConversationUpdatingState();
}

class ConversationLoadedState extends ConversationState {
  final ConversationModel conversationModel;

  const ConversationLoadedState(this.conversationModel);
}

class ConversationErrorState extends ConversationState {
  final String message;

  const ConversationErrorState(this.message);
}
