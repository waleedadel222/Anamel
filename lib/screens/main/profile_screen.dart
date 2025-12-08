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
              // context.read<AuthBloc>().add(LogoutUser());

              GoRouter.of(context).pushNamed(AppRouting.settings);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // user info
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              child: ListTile(
                title: Text("ahmed waleed "),
                subtitle: Text("ahmedwaleed1092@gmail.com"),
              ),
            ),
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
            // onTap: () {
            //   // navigate to change password screen
            //   GoRouter.of(context).pushNamed(AppRouting.createNewPassword);
            // },
          ),

          // address
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Addresses"),
            trailing: Icon(Icons.arrow_right),
            // onTap: () {
            //   // navigate to address screen
            //   GoRouter.of(context).pushNamed(AppRouting.addresses);
            // },
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
              if (state is LogoutRequested) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully")),
                );
                // Navigate to login screen
                GoRouter.of(context).pushReplacementNamed(AppRouting.login);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
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

                            // if (isLoading) {
                            //   // show loading dialog
                            //   showDialog(
                            //     barrierDismissible: false,
                            //     context: context,
                            //     builder: (_) =>
                            //         Center(child: CircularProgressIndicator()),
                            //   );
                            // }

                            // // logout user
                            // context.read<AuthBloc>().add(LogoutRequested());
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRouting.login);
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
