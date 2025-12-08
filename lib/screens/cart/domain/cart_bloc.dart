import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../data/repository/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {

    /// load cart
    on<LoadCartEvent>((event, emit) async {
      try {
        emit(CartLoading());
        final cart = await repository.getCart();

        if (cart.items == null || cart.items!.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(
            cartItems: cart.items!,
            totalAmount: cart.totalAmount?.toDouble() ?? 0.0,
            totalItems: cart.totalItems?.toInt() ?? 0,
          ));
        }
      } catch (e) {
        emit(CartError('Failed to load cart: $e'));
      }
    });

    /// add item
    on<AddToCartEvent>((event, emit) async {
      try {
        emit(CartLoading());
        final cart = await repository.addItem(
          productId: event.productId,
          quantity: event.quantity,
        );
        emit(CartLoaded(
          cartItems: cart.items!,
          totalAmount: cart.totalAmount?.toDouble() ?? 0.0,
          totalItems: cart.totalItems?.toInt() ?? 0,
        ));
      } catch (e) {
        emit(CartError('Failed to add item: $e'));
      }
    });

    /// remove item
    on<RemoveFromCartEvent>((event, emit) async {
      final current = state;
      if (current is! CartLoaded) return;

      try {
        emit(CartLoading());

        final item = current.cartItems.firstWhere(
              (element) => element.id == event.itemId,
        );

        final cart = await repository.deleteItem(item.productId!.toInt());

        if (cart.items == null || cart.items!.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(
            cartItems: cart.items!,
            totalAmount: cart.totalAmount?.toDouble() ?? 0.0,
            totalItems: cart.totalItems?.toInt() ?? 0,
          ));
        }
      } catch (e) {
        emit(CartError('Failed to remove item: $e'));
      }
    });

    /// increase quantity
    on<IncreaseQuantityEvent>((event, emit) async {
      try {
        final current = state;
        if (current is! CartLoaded) return;

        final item = current.cartItems.firstWhere((element) => element.id == event.itemId);
        final newQty = (item.quantity ?? 0).toInt() + 1;

        final cart = await repository.updateItemQuantity(
          productId: item.productId!.toInt(),
          newQuantity: newQty,
        );

        emit(CartLoaded(
          cartItems: cart.items!,
          totalAmount: cart.totalAmount?.toDouble() ?? 0.0,
          totalItems: cart.totalItems?.toInt() ?? 0,
        ));
      } catch (e) {
        emit(CartError('Failed to increase quantity: $e'));
      }
    });

    /// decrease quantity
    on<DecreaseQuantityEvent>((event, emit) async {
      try {
        final current = state;
        if (current is! CartLoaded) return;

        final item = current.cartItems.firstWhere((element) => element.id == event.itemId);
        final newQty = (item.quantity ?? 0).toInt() - 1;

        if (newQty <= 0) {
          return;
        }

        final cart = await repository.updateItemQuantity(
          productId: item.productId!.toInt(),
          newQuantity: newQty,
        );

        emit(CartLoaded(
          cartItems: cart.items!,
          totalAmount: cart.totalAmount?.toDouble() ?? 0.0,
          totalItems: cart.totalItems?.toInt() ?? 0,
        ));
      } catch (e) {
        emit(CartError('Failed to decrease quantity: $e'));
      }
    });
  }
}
