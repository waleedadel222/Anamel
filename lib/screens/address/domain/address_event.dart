import '../model/address_model.dart';

abstract class AddressEvent {}

class LoadAddressesEvent extends AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final AddressModel address;
  AddAddressEvent(this.address);
}

class UpdateAddressEvent extends AddressEvent {
  final AddressModel address;
  UpdateAddressEvent(this.address);
}

class DeleteAddressEvent extends AddressEvent {
  final String addressId;
  DeleteAddressEvent(this.addressId);
}

class SetDefaultAddressEvent extends AddressEvent {
  final String addressId;
  SetDefaultAddressEvent(this.addressId);
}