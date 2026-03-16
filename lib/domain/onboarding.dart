

class Onboarding {
  final OnboardingStorage storage;

  Onboarding(this.storage);

  void complete() => storage.isCompleted = true;
}

abstract interface class OnboardingStorage {
  set isCompleted(bool complete);
}