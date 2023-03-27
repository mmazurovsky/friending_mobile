import '../data/failures/failures.dart';

class Strings {
  Strings._();
  static final ui = _UiStrings();
  static final failures = _FailureStrings();
  static final ids = _IdStrings();
  static final links = _LinksStrings();
  static final server = _ServerStrings();
}

class _ServerStrings {
  final shortUsersCollection = 'shortUsers';
  final fullUsersCollection = 'fullUsers';
  final positionsCollection = 'userPositions';
  final tagsCollection = 'userTags';
  final connectionsCollection = 'connections';
  final privateInfoCollection = 'privateInfo';
  final positionField = 'position';
  final userEventsCollection = 'userEvents';
}

class _UiStrings {}

class _FailureStrings {
  final clientFailure = const FailureMessages(
    forSystem: 'Client failure',
    forUser: 'App error',
  );

  final serverFaliure = const FailureMessages(
    forSystem: 'Server failure',
    forUser: 'Server error, try later',
  );

  final undefinedFailure = const FailureMessages(
    forSystem: 'Undefined failure',
    forUser: 'Something went wrong',
  );

  final noInternetFailure = const FailureMessages(
    forSystem: 'No internet failure',
    forUser: 'No internet, try again',
  );

  final cacheFailure = const FailureMessages(
    forSystem: 'Cache failure',
    forUser: 'Something went wrong',
  );

  final authFaliure = const FailureMessages(
    forSystem: 'Auth failure',
    forUser: 'Authentication error occured',
  );

  final firebaseAuthFaliure = const FailureMessages(
    forSystem: 'Firebase Auth failure',
    forUser: 'Authentication error occured',
  );
}

class _IdStrings {
  //TODO
  final String appName = 'Flutter App';
  final String iosBundleId = 'com.mmazurovsky.friending';
  final String iosAppStoreId = '1592361916';
  final String appleAuthProviderId = 'apple.com';
  final String androidPackageName = 'com.mmazurovsky.friending';
}

class _LinksStrings {
  final String dynamicLinkUrlPrefix = 'https://thepostravesapp.page.link';
  final String emailSupportAccount = "friending.support@gmail.com";
  final String termsAndConditionsLink =
      'https://postraves.flycricket.io/terms.html';
  // TODO
  final String privacyPolicyLink =
      'https://postraves.flycricket.io/privacy.html';
}
