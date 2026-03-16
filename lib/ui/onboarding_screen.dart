import 'package:flutter/material.dart';
import 'package:mst_test/domain/onboarding.dart';
import 'package:mst_test/main.dart';
import 'package:mst_test/ui/main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<OnboardingScreen> {
  final Onboarding onboarding = Onboarding(onboardingPrefs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding"), centerTitle: true),
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Onboarding screen"))),
          Padding(
            padding: const EdgeInsetsGeometry.all(32),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MainScreen.route);
                onboarding.complete();
              },
              child: Text("Продолжить"),
            ),
          ),
        ],
      ),
    );
  }
}
