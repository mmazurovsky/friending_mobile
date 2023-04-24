import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_fields.dart';
import '../../state/profile_texts_manager.dart';

class NicknameTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function() triggerValidationOnForm;
  const NicknameTextField({
    required this.focusNode,
    required this.textEditingController,
    required this.triggerValidationOnForm,
    Key? key,
  }) : super(key: key);

  @override
  _NicknameTextFieldState createState() => _NicknameTextFieldState();
}

class _NicknameTextFieldState extends State<NicknameTextField> {
  bool _isNicknameFree = true;
  String? _previouslyCheckedNickname;
  String? _initialValue;

  @override
  void initState() {
    super.initState();
    if (widget.textEditingController.text.isNotEmpty) {
      _initialValue = widget.textEditingController.text;
    }
  }

  ///* this function can't be async, so it can't use
  ///* async function inside that check is nickname free
  ///* that is why _isNicknameFree field and void
  ///* function _checkNicknameIsFree are used
  String? _nicknameValidator(
    String nickname,
  ) {
    if (_initialValue == nickname) return null;
    final nicknameErrorMessage = _basicCheckNickname(nickname);
    if (nicknameErrorMessage != null) return nicknameErrorMessage;
    _checkNicknameIsFreeThenWaitForResponseThenTriggerValidationAgain(nickname);
    if (!_isNicknameFree) {
      return 'This username is taken';
    } else {
      return null;
    }
  }

  String? _basicCheckNickname(String nickname) {
    if (_previouslyCheckedNickname != nickname) {
      if (nickname.length < 4 || nickname.length > 15) {
        return 'Username can be 4 to 15 symbols long';
      }
      if (!RegExp(r"^[a-z0-9]*$").hasMatch(nickname)) {
        return 'Username can only contain lowercase letters and numbers';
      }
    }
    return null;
  }

  void _checkNicknameIsFreeThenWaitForResponseThenTriggerValidationAgain(
      String username) async {
    if (_previouslyCheckedNickname != username) {
      _previouslyCheckedNickname = username;

      final isNicknameFreeResponse = await context
          .read<ProfileTextsManager>()
          .checkUsernameIsFree(username);

      if (_isNicknameFree != isNicknameFreeResponse) {
        setState(() {
          // set state really needed here? Dunno
          _isNicknameFree = isNicknameFreeResponse;
        });
        //* this will trigget nickname validator to run again
        widget.triggerValidationOnForm();
        // _formKey.currentState!.validate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CTextField(
      focusNode: widget.focusNode,
      title: 'Username',
      textInputType: TextInputType.text,
      isSecret: false,
      textEditingController: widget.textEditingController,
      validatorFunction: _nicknameValidator,
      fillColor: Colors.transparent,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
