import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_sc/auth_controller.dart';
import 'package:gdsc_sc/auth_repository.dart';

class MyAccount extends ConsumerStatefulWidget {
  const MyAccount({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAccountState();
}

class _MyAccountState extends ConsumerState<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("account"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ref.watch(userProvider)!.name),
              Text(ref.watch(userProvider)!.email),
              ElevatedButton(
                onPressed: () {
                  ref.watch(authRepositoryProvider).logOut();
                  Navigator.of(context).pop();
                },
                child: const Text("logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
