import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../bag/spaces.dart';

extension PaddingsExtension on EdgeInsets {
  static EdgeInsets get horizontalStandart {
    return const EdgeInsets.symmetric(horizontal: ConstSpaces.unit3);
  }
}

extension EnumParser on String {
  T? toEnum<T>(List<T> values) {
    final result = values.firstWhereOrNull(
      (e) => e.toString().toLowerCase().split(".").last == toLowerCase(),
    );
    return result;
  }
}

extension ListWithSeparators<DATAELEMENT> on List<DATAELEMENT> {
  Iterable<Widget> mapSeparated(
    Widget Function(DATAELEMENT e) widgetBuilder, {
    required Widget separator,
  }) {
    return asMap().entries.map((e) {
      if (e.key == length - 1) {
        final widget = widgetBuilder(e.value);
        return widget;
      } else {
        final widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetBuilder(e.value),
            separator,
          ],
        );
        return widget;
      }
    });
  }
}

extension ListOfWidgetsWithSeparators on List<Widget> {
  Iterable<Widget> mapWidgetsSeparated({
    required Widget separator,
  }) {
    return asMap().entries.map((e) {
      if (e.key == length - 1) {
        final widget = e.value;
        return widget;
      } else {
        final widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            e.value,
            separator,
          ],
        );
        return widget;
      }
    });
  }
}

//create extension function on DateTime to convert it to string with format dd.MM.yyyy
extension DateTimeExtension on DateTime {
  String toDateString() {
    return "${this.day}.${this.month}.${this.year}";
  }
}
