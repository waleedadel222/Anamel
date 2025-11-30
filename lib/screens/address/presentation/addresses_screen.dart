import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/screens/address/domain/address_event.dart';
import 'package:anamel/screens/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routing.dart';
import '../domain/address_bloc.dart';
import '../domain/address_state.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {

  void _setDefaultAddress(BuildContext context, String addressId) {
    context.read<AddressBloc>().add(SetDefaultAddressEvent(addressId));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Default address updated")));
  }

  void _deleteAddress(BuildContext context, AddressModel address) {
    if (address.isDefault) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Cannot delete default address. Set another address as default first.",
          ),
        ),
      );
      return;
    }

    context.read<AddressBloc>().add(DeleteAddressEvent(address.id!));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Address deleted')));
  }

  void _editAddress(BuildContext context, AddressModel address, int index) {
    // Navigate to add address screen with existing address using GoRouter
    GoRouter.of(context).pushNamed(
      AppRouting.addEditAddress,
      extra: {'address': address, 'index': index},
    );
  }

  void _addNewAddress(BuildContext context) {
    // Navigate to add address screen without address (add mode)
    GoRouter.of(context).pushNamed(AppRouting.addEditAddress);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('My Addresses'), centerTitle: true),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewAddress(context),
        child: Icon(Icons.add),
      ),

      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));

          } else if (state is AddressError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },

        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddressError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),

                  SizedBox(height: 16.h),

                  Text(state.message),

                  SizedBox(height: 16.h),

                  ElevatedButton(
                    onPressed: () {
                      context.read<AddressBloc>().add(LoadAddressesEvent());
                    },

                    child: const Text("Try Again"),
                  ),
                ],
              ),
            );
          }

          if (state is AddressListLoaded) {
            if (state.addresses.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_off, size: 64),

                    SizedBox(height: 16.h),

                    Text(
                      'No addresses added yet',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: state.addresses.length,
              itemBuilder: (context, index) {
                final address = state.addresses[index];

                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(
                      color: address.isDefault
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: address.isDefault
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[600],
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${address.governorate}, ${address.city}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            address.isDefault
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'DEFAULT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () => _setDefaultAddress(
                                      context,
                                      address.id!,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.grey[400]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 14,
                                            color: Colors.grey[700],
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Set Default',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildAddressDetailRow(
                          Icons.home_outlined,
                          '${address.street}, Building ${address.building}, Apt ${address.apartment}',
                        ),
                        const SizedBox(height: 8),
                        _buildAddressDetailRow(
                          Icons.place_outlined,
                          address.landmark,
                        ),
                        const SizedBox(height: 8),
                        _buildAddressDetailRow(
                          Icons.mail_outline,
                          'ZIP: ${address.zipCode}',
                        ),
                        const SizedBox(height: 8),
                        _buildAddressDetailRow(
                          Icons.phone_outlined,
                          address.phoneNumber,
                        ),
                        if (address.additionalNotes.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          _buildAddressDetailRow(
                            Icons.note_outlined,
                            address.additionalNotes,
                          ),
                        ],
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () =>
                                    _editAddress(context, address, index),
                                icon: const Icon(Icons.edit_outlined, size: 18),
                                label: const Text('Edit'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () => _deleteAddress(context, address),
                              icon: const Icon(Icons.delete_outline),
                              color: Colors.red[400],
                              tooltip: 'Delete',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildAddressDetailRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20),

        SizedBox(width: 8.h),

        Expanded(child: Text(text, style: AppStyles.text16NormalStyle)),
      ],
    );
  }
}
