

class Onboarding {
  final OnboardingStorage storage;

  Onboarding(this.storage);

  bool get isComplete => storage.isCompleted;

  void complete() => storage.isCompleted = true;
}

abstract interface class OnboardingStorage {
  set isCompleted(bool complete);
  bool get isCompleted;
}