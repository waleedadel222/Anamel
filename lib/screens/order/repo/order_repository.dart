
import 'package:cloud_firestore/cloud_firestore.dart' hide Order;

import '../model/order_model.dart';

class OrderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'orders';

  // Fetch all orders for a user
  Stream<List<Order>> getOrdersStream(String userId) {
    return _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('orderDate', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromFirestore(doc)).toList();
    });
  }

  // Fetch orders with pagination
  Future<List<Order>> getOrders(String userId, {int limit = 10}) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('orderDate', descending: true)
        .limit(limit)
        .get();

    return snapshot.docs.map((doc) => Order.fromFirestore(doc)).toList();
  }

  // Get a single order by ID
  Future<Order?> getOrderById(String orderId) async {
    final doc = await _firestore.collection(_collection).doc(orderId).get();
    if (doc.exists) {
      return Order.fromFirestore(doc);
    }
    return null;
  }

  // Create a new order
  Future<String> createOrder(Order order) async {
    final docRef = await _firestore.collection(_collection).add(order.toMap());
    return docRef.id;
  }

  // Update order status
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    await _firestore.collection(_collection).doc(orderId).update({
      'status': status.toString().split('.').last,
    });
  }

  // Cancel an order
  Future<void> cancelOrder(String orderId) async {
    await updateOrderStatus(orderId, OrderStatus.cancelled);
  }
}