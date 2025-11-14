import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/domain/auth_bloc.dart';
import '../auth/domain/auth_event.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  const ProfileScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${userData['name']}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {

              context.read<AuthBloc>().add(LogoutUser());

              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (_) => const LoginScreen()),
              // );

            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: ListTile(
            title: Text(userData['name'] ?? ''),
            subtitle: Text(userData['email'] ?? ''),
          ),
        ),
      ),
    );
  }
}
