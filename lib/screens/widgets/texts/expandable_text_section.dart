import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/bag/stateful/styles.dart';

class ExpandableTextSection extends StatefulWidget {
  final String text;

  const ExpandableTextSection(this.text, {super.key});

  @override
  _ExpandableTextSectionState createState() => _ExpandableTextSectionState();
}

class _ExpandableTextSectionState extends State<ExpandableTextSection> with TickerProviderStateMixin<ExpandableTextSection> {
  static const int _minPreviewLength = 130;
  late int _previewLength;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _previewLength = widget.text.length < _minPreviewLength ? 0 : min(widget.text.indexOf('.', _minPreviewLength), widget.text.indexOf(',', _minPreviewLength));
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: widget.text.length > _minPreviewLength && !_isExpanded ? '${widget.text.substring(0, _previewLength)}...' : widget.text,
            style: context.styles.bodyText,
          ),
          widget.text.length > _minPreviewLength
              ? WidgetSpan(
                  child: GestureDetector(
                    onTap: () => setState(() => _isExpanded = !_isExpanded),
                    child: RichText(
                      text: TextSpan(
                        text: ' ${_isExpanded ? 'Show less' : 'Show more'}',
                        style: context.styles.bodyText,
                      ),
                    ),
                  ),
                )
              : const TextSpan(),
        ],
      ),
    );
  }
}
