import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum TrackerRecordCategory {
  food,
  transport,
  entertainment,
  utilities,
  other,
  income,
  unknown,
}

extension TrackerRecordCategoryExtension on TrackerRecordCategory {
  String get uiName {
    return switch (this) {
      TrackerRecordCategory.food => LocaleKeys.categoryFood.tr(),
      TrackerRecordCategory.transport => LocaleKeys.categoryTransport.tr(),
      TrackerRecordCategory.entertainment =>
        LocaleKeys.categoryEntertainment.tr(),
      TrackerRecordCategory.utilities => LocaleKeys.categoryUtilities.tr(),
      TrackerRecordCategory.other => LocaleKeys.categoryOther.tr(),
      TrackerRecordCategory.income => LocaleKeys.categoryIncome.tr(),
      TrackerRecordCategory.unknown => LocaleKeys.categoryUnknown.tr(),
    };
  }

  Color get color {
    return switch (this) {
      TrackerRecordCategory.food => Colors.orange,
      TrackerRecordCategory.transport => Colors.blue,
      TrackerRecordCategory.entertainment => Colors.purple,
      TrackerRecordCategory.utilities => Colors.green,
      TrackerRecordCategory.other => Colors.grey,
      TrackerRecordCategory.income => Colors.teal,
      TrackerRecordCategory.unknown => Colors.blueGrey,
    };
  }
}
