import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_edge_insets.dart';

class CTextField extends StatelessWidget {
  final String title;
  final TextInputType textInputType;
  final bool isSecret;
  final TextEditingController textEditingController;
  final String? Function(String)? validatorFunction;
  final FocusNode? focusNode;
  final Color fillColor;
  // final Color activeBorderColor;
  // final Color inactiveBorderColor;
  final String? initialValue;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final bool? enableSuggestions;
  final Iterable<String>? autofillHints;
  final bool? autocorrect;
  final bool enabled;
  final bool requiresMargin;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? counter;

  const CTextField({
    Key? key,
    required this.title,
    required this.textInputType,
    required this.isSecret,
    required this.textEditingController,
    this.fillColor = Colors.transparent,
    // required this.activeBorderColor,
    // required this.inactiveBorderColor,
    this.validatorFunction,
    this.focusNode,
    this.initialValue,
    this.maxLines,
    this.hintText,
    this.enableSuggestions,
    this.autofillHints,
    this.maxLength,
    this.autocorrect,
    this.enabled = true,
    this.requiresMargin = true,
    this.inputFormatters,
    this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      focusNode: focusNode,
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          validatorFunction != null ? validatorFunction!(value!) : null,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: title,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: fillColor,
        counter: counter,
      ),
      keyboardType: textInputType,
      obscureText: isSecret,
      maxLines: maxLines,
      minLines: 1,
      enableSuggestions: enableSuggestions ?? true,
      autofillHints: autofillHints,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autocorrect: autocorrect ?? true,
      inputFormatters: inputFormatters,
    );
    return requiresMargin
        ? Container(
            margin: CEdgeInsets.horizontalStandart,
            child: textField,
          )
        : textField;
  }
}
