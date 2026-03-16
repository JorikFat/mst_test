import 'package:mst_test/domain/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPrefs implements OnboardingStorage {
  final SharedPreferences _prefs;
  final String _key = 'onboarding_completed';

  OnboardingPrefs(this._prefs);

  bool get isCompleted => _prefs.getBool(_key) ?? false;

  @override
  set isCompleted(bool complete) => _prefs.setBool(_key, complete);
}
