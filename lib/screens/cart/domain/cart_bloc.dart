import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../data/repository/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {

    // Load Cart Event
    on<LoadCartEvent>((event, emit) async {
      try {
        emit(CartLoading());


        final items = repository.getCartItems();

        if (items.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(items));
        }
      } catch (e) {
        emit(CartError('Failed to load cart: ${e.toString()}'));
      }
    });

    // Add to Cart Event
    on<AddToCartEvent>((event, emit) async {
      try {
        final currentState = state;

        emit(CartLoading());

        repository.addToCart(event.item);
        final items = repository.getCartItems();

        emit(CartLoaded(items));
      } catch (e) {
        emit(CartError('Failed to add item: ${e.toString()}'));
      }
    });

    // Remove from Cart Event
    on<RemoveFromCartEvent>((event, emit) async {
      try {
        emit(CartLoading());

        repository.removeFromCart(event.id);
        final items = repository.getCartItems();

        if (items.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(items));
        }
      } catch (e) {
        emit(CartError('Failed to remove item: ${e.toString()}'));
      }
    });

    // Increase Quantity Event
    on<IncreaseQuantityEvent>((event, emit) async {
      try {
        repository.increaseQuantity(event.id);
        final items = repository.getCartItems();

        emit(CartLoaded(items));
      } catch (e) {
        emit(CartError('Failed to increase quantity: ${e.toString()}'));
      }
    });

    // Decrease Quantity Event
    on<DecreaseQuantityEvent>((event, emit) async {
      try {
        repository.decreaseQuantity(event.id);
        final items = repository.getCartItems();

        // لو الـ item quantity بقى 0 نشيله
        if (items.isEmpty) {
          emit(CartEmpty());
        } else {
          emit(CartLoaded(items));
        }
      } catch (e) {
        emit(CartError('Failed to decrease quantity: ${e.toString()}'));
      }
    });
  }
}