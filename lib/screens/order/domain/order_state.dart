import '../model/order_model.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<Order> orders;
  final OrderStatus? filterStatus;

  OrdersLoaded(this.orders, {this.filterStatus});

  List<Order> get filteredOrders {
    if (filterStatus == null) return orders;
    return orders.where((order) => order.status == filterStatus).toList();
  }
}

class OrderDetailsLoaded extends OrderState {
  final Order order;
  OrderDetailsLoaded(this.order);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}

class OrderCancelling extends OrderState {}

class OrderCancelled extends OrderState {
  final String message;
  OrderCancelled(this.message);
}
