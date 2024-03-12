import 'package:accounting_bunny/controller/profile/profile_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileController().getProfile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text("Home Screen")),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Home Screen")),
          body: Center(child: Text(snapshot.data!.name)),
        );
      },
    );
  }
}
