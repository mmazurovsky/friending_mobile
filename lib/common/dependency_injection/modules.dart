import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uuid/uuid.dart';

@module
abstract class Modules {
  @lazySingleton
  FirebaseFirestore get firebaseFirestore {
    final instance = FirebaseFirestore.instance;
    return instance;
  }

  @lazySingleton
  FirebaseAuth get firebaseAuth {
    final instance = FirebaseAuth.instance;
    return instance;
  }

  @lazySingleton
  FirebaseAnalytics get firebaseAnalytics {
    final instance = FirebaseAnalytics.instance;
    return instance;
  }

  @lazySingleton
  FirebaseCrashlytics get firebaseCrashlytics {
    final instance = FirebaseCrashlytics.instance;
    return instance;
  }

  @lazySingleton
  FirebaseStorage get firebaseStorage {
    final instance = FirebaseStorage.instance;
    return instance;
  }

  @lazySingleton
  FirebaseMessaging get firebaseMessaging {
    final instance = FirebaseMessaging.instance;
    return instance;
  }

  @lazySingleton
  Uuid get uuid {
    const instance = Uuid();
    return instance;
  }

  @lazySingleton
  GeoFlutterFire get getFlutterFire {
    final instance = GeoFlutterFire();
    return instance;
  }

  @lazySingleton
  Connectivity get connectivity {
    final instance = Connectivity();
    return instance;
  }

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker {
    final instance = InternetConnectionChecker();
    return instance;
  }

  @lazySingleton
  ImagePicker get imagePicker {
    return ImagePicker();
  }

  @lazySingleton
  ImageCropper get imageCropper {
    return ImageCropper();
  }
}
