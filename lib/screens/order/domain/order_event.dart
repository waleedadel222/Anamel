import '../model/order_model.dart';

abstract class OrderEvent {}

class LoadOrders extends OrderEvent {
  final String userId;
  LoadOrders(this.userId);
}

class RefreshOrders extends OrderEvent {
  final String userId;
  RefreshOrders(this.userId);
}

class LoadOrderDetails extends OrderEvent {
  final String orderId;
  LoadOrderDetails(this.orderId);
}

class CancelOrder extends OrderEvent {
  final String orderId;
  CancelOrder(this.orderId);
}

class FilterOrdersByStatus extends OrderEvent {
  final OrderStatus? status;
  FilterOrdersByStatus(this.status);
}