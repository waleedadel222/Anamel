import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/order_model.dart';
import '../repo/order_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _repository;
  OrderStatus? _currentFilter;

  OrderBloc(this._repository) : super(OrderInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<RefreshOrders>(_onRefreshOrders);
    on<LoadOrderDetails>(_onLoadOrderDetails);
    on<CancelOrder>(_onCancelOrder);
    on<FilterOrdersByStatus>(_onFilterOrdersByStatus);
  }

  Future<void> _onLoadOrders(
      LoadOrders event,
      Emitter<OrderState> emit,
      ) async {
    emit(OrderLoading());
    try {
      final orders = await _repository.getOrders(event.userId);
      emit(OrdersLoaded(orders, filterStatus: _currentFilter));
    } catch (e) {
      emit(OrderError('Failed to load orders: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshOrders(
      RefreshOrders event,
      Emitter<OrderState> emit,
      ) async {
    try {
      final orders = await _repository.getOrders(event.userId);
      emit(OrdersLoaded(orders, filterStatus: _currentFilter));
    } catch (e) {
      emit(OrderError('Failed to refresh orders: ${e.toString()}'));
    }
  }

  Future<void> _onLoadOrderDetails(
      LoadOrderDetails event,
      Emitter<OrderState> emit,
      ) async {
    emit(OrderLoading());
    try {
      final order = await _repository.getOrderById(event.orderId);
      if (order != null) {
        emit(OrderDetailsLoaded(order));
      } else {
        emit(OrderError('Order not found'));
      }
    } catch (e) {
      emit(OrderError('Failed to load order details: ${e.toString()}'));
    }
  }

  Future<void> _onCancelOrder(
      CancelOrder event,
      Emitter<OrderState> emit,
      ) async {
    emit(OrderCancelling());
    try {
      await _repository.cancelOrder(event.orderId);
      emit(OrderCancelled('Order cancelled successfully'));
    } catch (e) {
      emit(OrderError('Failed to cancel order: ${e.toString()}'));
    }
  }

  void _onFilterOrdersByStatus(
      FilterOrdersByStatus event,
      Emitter<OrderState> emit,
      ) {
    _currentFilter = event.status;
    if (state is OrdersLoaded) {
      final currentState = state as OrdersLoaded;
      emit(OrdersLoaded(currentState.orders, filterStatus: event.status));
    }
  }
}
