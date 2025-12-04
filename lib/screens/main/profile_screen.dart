import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routing.dart';
import '../auth/domain/auth_bloc.dart';
import '../auth/domain/auth_event.dart';
import '../auth/domain/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouting.settings);
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          // user info
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.userModel.name)));
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AuthSuccess) {
                var user = state.userModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),

                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 45.r,
                              child: Text(user.name[0].toUpperCase()),
                            ),

                            SizedBox(height: 16.h),

                            Text(user.name, style: AppStyles.text22BoldStyle),

                            SizedBox(height: 8.h),

                            Text(
                              user.email,
                              style: AppStyles.text16NormalStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit Profile'),
                    ),
                  ],
                );
              }

              return const Center(child: Text('Something went wrong'));
            },
          ),

          // divider line
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(thickness: 1.5.h),
            ),
          ),

          // change password
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              // navigate to change password screen
              GoRouter.of(context).pushNamed(AppRouting.createNewPassword);
            },
          ),

          // address
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Addresses"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              // navigate to address screen
              GoRouter.of(context).pushNamed(AppRouting.addresses);
            },
          ),

          // order history
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Order History"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              // navigate to order history screen
              GoRouter.of(context).pushNamed(AppRouting.orderHistory);
            },
          ),

          // logout
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLogOutSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully")),
                );
                // Navigate to login screen
                GoRouter.of(context).pushReplacementNamed(AppRouting.login);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              bool isLoading = state is AuthLoading;

              return ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  // show logout confirmation dialog
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "Confirm Logout",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () => GoRouter.of(context).pop(),
                          child: Text(
                            "No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            // close dialog
                            GoRouter.of(context).pop();

                            if (isLoading) {
                              // show loading dialog
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) =>
                                    Center(child: CircularProgressIndicator()),
                              );
                            }

                            // logout user
                            context.read<AuthBloc>().add(LogoutUser());
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
