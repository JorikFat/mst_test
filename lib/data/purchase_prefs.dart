import 'package:mst_test/domain/subscriptions.dart';
import 'package:mst_test/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchasePrefs implements SubscriptionsStorage {
  final SharedPreferences _prefs;
  final String _key = 'subscription';

  PurchasePrefs(this._prefs);

  Subscription? getSubscription() => _prefs.getString(_key)?.let(Subscription.deserialize);

  @override
  void purchase(Subscription subscription) =>
      _prefs.setString(_key, subscription.serialize());
}
