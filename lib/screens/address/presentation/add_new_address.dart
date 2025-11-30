import 'package:anamel/screens/address/domain/address_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/address_bloc.dart';
import '../model/address_model.dart';


class AddNewAddress extends StatefulWidget {
  final AddressModel? address; // null means "add new"
  final int? index; // null means "add new"

  const AddNewAddress({super.key, this.address, this.index});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController governorateController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController buildingController;
  late TextEditingController apartmentController;
  late TextEditingController landmarkController;
  late TextEditingController zipCodeController;
  late TextEditingController phoneNumberController;
  late TextEditingController additionalNotesController;

  bool isEditMode = false;

  @override
  void initState() {
    super.initState();

    // Check if we're in edit mode or add mode
    isEditMode = widget.address != null;

    // Initialize controllers with existing data (if editing) or empty (if adding)
    governorateController = TextEditingController(
      text: widget.address?.governorate ?? '',
    );
    cityController = TextEditingController(text: widget.address?.city ?? '');
    streetController = TextEditingController(
      text: widget.address?.street ?? '',
    );
    buildingController = TextEditingController(
      text: widget.address?.building ?? '',
    );
    apartmentController = TextEditingController(
      text: widget.address?.apartment ?? '',
    );
    landmarkController = TextEditingController(
      text: widget.address?.landmark ?? '',
    );
    zipCodeController = TextEditingController(
      text: widget.address?.zipCode ?? '',
    );
    phoneNumberController = TextEditingController(
      text: widget.address?.phoneNumber ?? '',
    );
    additionalNotesController = TextEditingController(
      text: widget.address?.additionalNotes ?? '',
    );
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      AddressModel newAddress = AddressModel(
        id: widget.address?.id,
        governorate: governorateController.text,
        city: cityController.text,
        street: streetController.text,
        building: buildingController.text,
        apartment: apartmentController.text,
        landmark: landmarkController.text,
        zipCode: zipCodeController.text,
        phoneNumber: phoneNumberController.text,
        additionalNotes: additionalNotesController.text,
        isDefault: widget.address?.isDefault ?? false,
      );

      if (isEditMode) {
        context.read<AddressBloc>().add(UpdateAddressEvent(newAddress));
      } else {
        context.read<AddressBloc>().add(AddAddressEvent(newAddress));
      }

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Address' : 'Add New Address'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: governorateController,
                decoration: const InputDecoration(
                  labelText: 'Governorate',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter governorate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: streetController,
                decoration: const InputDecoration(
                  labelText: 'Street',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.route),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter street';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: buildingController,
                      decoration: const InputDecoration(
                        labelText: 'Building',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.business),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: apartmentController,
                      decoration: const InputDecoration(
                        labelText: 'Apartment',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.home),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: landmarkController,
                decoration: const InputDecoration(
                  labelText: 'Landmark',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.place),
                  hintText: 'e.g., Near City Mall',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter landmark';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: zipCodeController,
                decoration: const InputDecoration(
                  labelText: 'ZIP Code',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ZIP code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: additionalNotesController,
                decoration: const InputDecoration(
                  labelText: 'Additional Notes (Optional)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note),
                  hintText: 'e.g., Ring the bell twice',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _saveAddress,
                  icon: Icon(isEditMode ? Icons.save : Icons.add),
                  label: Text(
                    isEditMode ? 'Save Changes' : 'Add Address',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
