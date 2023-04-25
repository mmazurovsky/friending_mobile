import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_fields.dart';
import '../../state/profile_texts_manager.dart';

class UsernameTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function() triggerValidationOnForm;
  const UsernameTextField({
    required this.focusNode,
    required this.textEditingController,
    required this.triggerValidationOnForm,
    Key? key,
  }) : super(key: key);

  @override
  _UsernameTextFieldState createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  bool _isUsernameFree = true;
  String? _previouslyCheckedUsername;
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
  String? _usernameValidator(
    String username,
  ) {
    if (_initialValue == username) return null;
    final usernameErrorMessage = _basicCheckUsername(username);
    if (usernameErrorMessage != null) return usernameErrorMessage;
    _checkUsernameIsFreeThenWaitForResponseThenTriggerValidationAgain(username);
    if (!_isUsernameFree) {
      return 'This username is taken';
    } else {
      return null;
    }
  }

  String? _basicCheckUsername(String username) {
    if (_previouslyCheckedUsername != username) {
      if (username.length < 4 || username.length > 15) {
        return 'Username can be 4 to 15 symbols long';
      }
      if (!RegExp(r"^[a-z0-9]*$").hasMatch(username)) {
        return 'Username can only contain lowercase letters and numbers';
      }
    }
    return null;
  }

  void _checkUsernameIsFreeThenWaitForResponseThenTriggerValidationAgain(
      String username) async {
    if (_previouslyCheckedUsername != username) {
      _previouslyCheckedUsername = username;

      final isUsernameFreeResponse = await context
          .read<ProfileTextsManager>()
          .checkUsernameIsFree(username);

      if (_isUsernameFree != isUsernameFreeResponse) {
        setState(() {
          // set state really needed here? Dunno
          _isUsernameFree = isUsernameFreeResponse;
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
      validatorFunction: _usernameValidator,
      fillColor: Colors.transparent,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
