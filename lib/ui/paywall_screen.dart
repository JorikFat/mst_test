import 'package:flutter/material.dart';
import 'package:mst_test/domain/subscriptions.dart';
import 'package:mst_test/main.dart';
import 'package:mst_test/ui/main_screen.dart';

class PaywallScreen extends StatefulWidget {
  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => PaywallScreen());
  const PaywallScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PaywallScreen> {
  final Subscriptions subscriptions = Subscriptions(purchasePrefs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paywall"), centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: subscriptions,
        builder: (context, value, _) {
          return Column(
            children: [
              const Spacer(),
              RadioGroup(
                groupValue: value,
                onChanged: (value) => subscriptions.pick(value!),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: subscriptions.subscriptions
                        .map(
                          (it) => Card(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => subscriptions.pick(it),
                              child: Padding(
                                padding: const EdgeInsetsGeometry.all(8),
                                child: Row(
                                  children: [
                                    Radio(
                                      value:
                                          subscriptions
                                              .subscriptions[subscriptions
                                              .subscriptions
                                              .indexOf(it)],
                                    ),
                                    const SizedBox(width: 16),
                                    Text(it.period),
                                    const Spacer(),
                                    Text("${it.price} р"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsGeometry.all(16),
                child: ElevatedButton(
                  onPressed: value == null
                      ? null
                      : () {
                          subscriptions.purchase();
                          Navigator.of(
                            context,
                          ).pushReplacement(MainScreen.route);
                        },
                  child: Text("Продолжить"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
