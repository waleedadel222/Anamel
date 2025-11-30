import '../model/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressListLoaded extends AddressState {
  final List<AddressModel> addresses;
  AddressListLoaded(this.addresses);
}

class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}

class AddressSuccess extends AddressState {
  final String message;
  AddressSuccess(this.message);
}