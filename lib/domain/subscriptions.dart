import 'dart:convert';

import 'package:flutter/material.dart';

class Subscriptions extends ValueNotifier<Subscription?> {
  final SubscriptionsStorage storage;

  Subscriptions(this.storage) : super(null);
  final List<Subscription> subscriptions = [
    Subscription(period: "месяц", price: 100),
    Subscription(period: "год", price: 1000)
  ];

  void pick(Subscription subscription) {
    value = subscription;
  }

  void purchase() {
    storage.purchase(value!);
  }
}

class Subscription {
  final String period;
  final int price;

  Subscription({required this.period, required this.price});

  factory Subscription.deserialize(String line) {
    final map = jsonDecode(line);
    return Subscription(period: map['period'], price: map['price']);
  }

  String serialize() => jsonEncode({'period': period, 'price': price});
}

abstract interface class SubscriptionsStorage {
  void purchase(Subscription subscription);
}
