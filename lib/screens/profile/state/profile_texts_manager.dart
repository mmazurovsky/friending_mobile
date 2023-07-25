import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/entities/tag_entity.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/utils/extensions.dart';
import '../repo/profile_repo.dart';

@injectable
class ProfileTextsAndTagsManager with ChangeNotifier {
  final ProfileRepo _profileRepo;
  ProfileTextsAndTagsManager(this._profileRepo);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;
  final _usernameFocusNode = FocusNode();
  FocusNode get usernameFocusNode => _usernameFocusNode;

  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  final _birthDateController = TextEditingController();
  TextEditingController get birthDateController => _birthDateController;

  final _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;
  final _descriptionFocusNode = FocusNode();
  FocusNode get descriptionFocusNode => _descriptionFocusNode;

  final _lookingForController = TextEditingController();
  TextEditingController get lookingForController => _lookingForController;
  final _lookingForFocusNode = FocusNode();
  FocusNode get lookingForFocusNode => _lookingForFocusNode;

  final _instagramUsernameController = TextEditingController();
  TextEditingController get instagramUsernameController => _instagramUsernameController;
  final _instagramUsernameFocusNode = FocusNode();
  FocusNode get instagramUsernameFocusNode => _instagramUsernameFocusNode;
  SecureFieldStatusEnum _instagramSecureStatus = SecureFieldStatusEnum.public;
  SecureFieldStatusEnum get instagramSecureStatus => _instagramSecureStatus;

  final _telegramUsernameController = TextEditingController();
  TextEditingController get telegramUsernameController => _telegramUsernameController;
  final _telegramUsernameFocusNode = FocusNode();
  FocusNode get telegramUsernameFocusNode => _telegramUsernameFocusNode;
  SecureFieldStatusEnum _telegramSecureStatus = SecureFieldStatusEnum.private;
  SecureFieldStatusEnum get telegramSecureStatus => _telegramSecureStatus;

  final _whatsappPhoneController = TextEditingController();
  TextEditingController get whatsappPhoneController => _whatsappPhoneController;
  final _whatsappPhoneFocusNode = FocusNode();
  FocusNode get whatsappPhoneFocusNode => _whatsappPhoneFocusNode;
  SecureFieldStatusEnum _whatsappSecureStatus = SecureFieldStatusEnum.private;
  SecureFieldStatusEnum get whatsappSecureStatus => _whatsappSecureStatus;

  final _addTagsController = TextEditingController();
  TextEditingController get addTagsController => _addTagsController;
  final _addTagsFocusNode = FocusNode();
  FocusNode get addTagsFocusNode => _addTagsFocusNode;

  final Set<String> _initialTags = {};
  final Set<String> _tagsToDisplay = {};
  List<TagEntity> get tagsToDisplay => _tagsToDisplay.map((e) => TagEntity(e)).toList();

  Failure? _failure;
  Failure? get failure => _failure;

  Set<String> get tagsToAddOnServer {
    return _tagsToDisplay.difference(_initialTags);
  }

  Set<String> get tagsToRemoveOnServer {
    return _initialTags.difference(_tagsToDisplay);
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    _usernameController.dispose();
    _usernameFocusNode.dispose();
    _birthDateController.dispose();
    _descriptionController.dispose();
    _descriptionFocusNode.dispose();
    _lookingForController.dispose();
    _lookingForFocusNode.dispose();
    _instagramUsernameController.dispose();
    _instagramUsernameFocusNode.dispose();
    _telegramUsernameController.dispose();
    _telegramUsernameFocusNode.dispose();
    _whatsappPhoneController.dispose();
    _whatsappPhoneFocusNode.dispose();
    _addTagsController.dispose();
    _addTagsFocusNode.dispose();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) super.notifyListeners();
  }

  void changeInstagramIsPrivate() {
    final newValue = _instagramSecureStatus == SecureFieldStatusEnum.private ? SecureFieldStatusEnum.public : SecureFieldStatusEnum.private;
    _instagramSecureStatus = newValue;
    notifyListeners();
  }

  void changeTelegramIsPrivate() {
    final newValue = _telegramSecureStatus == SecureFieldStatusEnum.private ? SecureFieldStatusEnum.public : SecureFieldStatusEnum.private;
    _telegramSecureStatus = newValue;
    notifyListeners();
  }

  void changeWhatsappIsPrivate() {
    final newValue = _whatsappSecureStatus == SecureFieldStatusEnum.private ? SecureFieldStatusEnum.public : SecureFieldStatusEnum.private;
    _whatsappSecureStatus = newValue;
    notifyListeners();
  }

  void fillFieldsBasedOnProfile(FullReadUserModel? profile) async {
    _isLoading = true;
    if (profile != null && !_isDisposed) {
      _usernameController.text = profile.shortUserModel.username;
      _birthDate = profile.shortUserModel.birthDate;
      _birthDateController.text = _birthDate?.toDateString() ?? '';
      _descriptionController.text = profile.shortUserModel.about ?? '';
      _lookingForController.text = profile.shortUserModel.lookingFor ?? '';
      _instagramSecureStatus =
          profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'Instagram')?.state ?? SecureFieldStatusEnum.private;
      _instagramUsernameController.text = profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'Instagram')?.value ?? '';
      _telegramSecureStatus =
          profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'Telegram')?.state ?? SecureFieldStatusEnum.private;
      _telegramUsernameController.text = profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'Telegram')?.value ?? '';
      _whatsappSecureStatus =
          profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'WhatsApp')?.state ?? SecureFieldStatusEnum.private;
      _whatsappPhoneController.text = profile.secureUserInfoModel.fields.firstWhereOrNull((element) => element.title == 'WhatsApp')?.value ?? '';
      _initialTags.addAll(profile.shortUserModel.tags);
      _tagsToDisplay.addAll(_initialTags);
    }
    _isLoading = false;
    notifyListeners();
  }

  void unfocusAllNodes() {
    _usernameFocusNode.unfocus();
    _descriptionFocusNode.unfocus();
    _lookingForFocusNode.unfocus();
    _instagramUsernameFocusNode.unfocus();
    _telegramUsernameFocusNode.unfocus();
    _addTagsFocusNode.unfocus();
    _whatsappPhoneFocusNode.unfocus();
  }

  Future<bool> checkUsernameIsFree(String username) async {
    late bool isUsernameFree;
    try {
      isUsernameFree = await _profileRepo.isUsernameFree(username);
    } on Failure catch (e) {
      _failure = e;
      notifyListeners();
      _failure = null;
    }
    return isUsernameFree;
  }

  void changeBirthDate(DateTime newBirthDate) {
    if (_birthDate != newBirthDate) {
      _birthDate = newBirthDate;
      _birthDateController.text = _birthDate?.toDateString() ?? '';
      notifyListeners();
    }
  }

  void addTags() {
    final Set<String> inputTags = {};
    _addTagsController.text.split(',').forEach((rawTag) {
      final tag = rawTag.trim();
      if (tag.isNotEmpty) {
        inputTags.add(tag);
      }
    });
    if (inputTags.isNotEmpty) {
      _addTagsSet(inputTags);
      _addTagsController.clear();
    }
  }

  void _addTagsSet(Set<String> inputTags) {
    final tagsToAdd = inputTags.difference(_tagsToDisplay);
    if (tagsToAdd.isNotEmpty) {
      _tagsToDisplay.addAll(tagsToAdd);
      notifyListeners();
    }
  }

  void removeTag(String inputTag) {
    if (_tagsToDisplay.contains(inputTag)) {
      _tagsToDisplay.remove(inputTag);
      notifyListeners();
    }
  }
}
