import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/address_model.dart';

class AddressRepository {
  AddressRepository();

  // get all addresses
  Stream<List<AddressModel>> getAddresses(String userId) {
    try {
      final addressesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("addresses");

      return addressesCollection.snapshots().map((snapshot) {
        if (snapshot.docs.isEmpty) {
          return [];
        }
        return snapshot.docs
            .map((doc) => AddressModel.fromMap(doc.data(), doc.id))
            .toList();
      });
    } catch (e) {
      throw Exception((e.toString()));
    }
  }

  // Add new address
  Future<void> addAddress(String userId, AddressModel address) async {
    try {
      final addressesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("addresses");
      // If this is the first address, make it default
      final snapshot = await addressesCollection.get();
      final isFirstAddress = snapshot.docs.isEmpty;

      await addressesCollection.add(
        address
            .copyWith(isDefault: isFirstAddress || address.isDefault)
            .toMap(),
      );
    } catch (e) {
      throw Exception((e.toString()));
    }
  }

  // Update address
  Future<void> updateAddress(String userId, AddressModel address) async {
    try {
      final addressesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("addresses");

      if (address.id == null) return;
      await addressesCollection.doc(address.id).update(address.toMap());
    } catch (e) {
      throw Exception((e.toString()));
    }
  }

  // Delete address
  Future<void> deleteAddress(String userId, String addressId) async {
    try {
      final addressesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("addresses");

      await addressesCollection.doc(addressId).delete();
    } catch (e) {
      throw Exception((e.toString()));
    }
  }

  // Set address as default and unset others
  Future<void> setDefaultAddress(String userId, String addressId) async {
    try {
      final addressesCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("addresses");

      final batch = FirebaseFirestore.instance.batch();

      // Get all addresses
      final snapshot = await addressesCollection.get();

      // Update all addresses
      for (var doc in snapshot.docs) {
        batch.update(addressesCollection.doc(doc.id), {
          'isDefault': doc.id == addressId,
        });
      }

      await batch.commit();
    } catch (e) {
      throw Exception((e.toString()));
    }
  }
}
