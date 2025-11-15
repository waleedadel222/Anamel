import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routing.dart';
import '../auth/domain/auth_bloc.dart';
import '../auth/domain/auth_event.dart';

class ProfileScreen extends StatelessWidget {
  // final UserModel userModel;

  const ProfileScreen({super.key});
  // const ProfileScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome {userModel.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutUser());

              GoRouter.of(context).pushReplacementNamed(AppRouting.login);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: ListTile(
            title: Text("userModel.name"),
            subtitle: Text("userModel.email"),
          ),
        ),
      ),
    );
  }
}
