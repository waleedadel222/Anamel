import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/repository/auth_firebase_repository.dart';
import '../address_repository/address_repository.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AuthFirebaseRepository authRepo = AuthFirebaseRepository();

  final AddressRepository repository;
  StreamSubscription? _addressSubscription;

  AddressBloc({required this.repository}) : super(AddressInitial()) {
    on<LoadAddressesEvent>(_onLoadAddresses);
    on<AddAddressEvent>(_onAddAddress);
    on<UpdateAddressEvent>(_onUpdateAddress);
    on<DeleteAddressEvent>(_onDeleteAddress);
    on<SetDefaultAddressEvent>(_onSetDefaultAddress);
  }

  Future<void> _onLoadAddresses(
    LoadAddressesEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());

    try {
      final user = authRepo.getCurrentUser();
      final userId = await user.then((value) => value?.uid ?? '');

      if (userId.isEmpty) {
        emit(AddressError("no user found"));
        return;
      } else {
        _addressSubscription?.cancel();
        _addressSubscription = repository
            .getAddresses(userId)
            .listen(
              (addresses) {
                if (addresses.isEmpty) {
                  emit(AddressError("empty list"));
                  return;
                }
                emit(AddressListLoaded(addresses));
              },
              onError: (error) {
                emit(AddressError(error.toString()));
              },
            );
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final user = authRepo.getCurrentUser();
      final userId = await user.then((value) => value?.uid ?? '');

      if (userId.isEmpty) {
        emit(AddressError("no user found"));
        return;
      } else {
        await repository.addAddress(userId, event.address);
        emit(AddressSuccess('Address added successfully'));
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

  Future<void> _onUpdateAddress(
    UpdateAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final user = authRepo.getCurrentUser();
      final userId = await user.then((value) => value?.uid ?? '');

      if (userId.isEmpty) {
        emit(AddressError("no user found"));
        return;
      } else {
        await repository.updateAddress(userId, event.address);
        emit(AddressSuccess('Address updated successfully'));
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final user = authRepo.getCurrentUser();
      final userId = await user.then((value) => value?.uid ?? '');

      if (userId.isEmpty) {
        emit(AddressError("no user found"));
        return;
      } else {
        await repository.deleteAddress(userId, event.addressId);
        emit(AddressSuccess('Address deleted successfully'));
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

  Future<void> _onSetDefaultAddress(
    SetDefaultAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      final user = authRepo.getCurrentUser();
      final userId = await user.then((value) => value?.uid ?? '');

      if (userId.isEmpty) {
        emit(AddressError("no user found"));
        return;
      } else {
        await repository.setDefaultAddress(userId, event.addressId);
        emit(AddressSuccess('Default address updated'));
      }
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _addressSubscription?.cancel();
    return super.close();
  }
}
