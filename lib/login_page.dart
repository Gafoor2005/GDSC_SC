import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_sc/auth_controller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login"),
              ElevatedButton(
                onPressed: () {
                  ref
                      .watch(authControllerProvider.notifier)
                      .signInWithGoogle(context, true);
                },
                child: const Text("Login"),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     ref.watch(authRepositoryProvider).logOut();
              //   },
              //   child: const Text("out"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
