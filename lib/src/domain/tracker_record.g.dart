// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackerRecordEntity _$TrackerRecordEntityFromJson(Map<String, dynamic> json) =>
    _TrackerRecordEntity(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      type: $enumDecode(_$TrackerRecordTypeEnumMap, json['type']),
      category: $enumDecodeNullable(
        _$TrackerRecordCategoryEnumMap,
        json['category'],
      ),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TrackerRecordEntityToJson(
  _TrackerRecordEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'amount': instance.amount,
  'type': _$TrackerRecordTypeEnumMap[instance.type]!,
  'category': _$TrackerRecordCategoryEnumMap[instance.category],
  'description': instance.description,
};

const _$TrackerRecordTypeEnumMap = {
  TrackerRecordType.income: 'income',
  TrackerRecordType.expense: 'expense',
};

const _$TrackerRecordCategoryEnumMap = {
  TrackerRecordCategory.food: 'food',
  TrackerRecordCategory.transport: 'transport',
  TrackerRecordCategory.entertainment: 'entertainment',
  TrackerRecordCategory.utilities: 'utilities',
  TrackerRecordCategory.other: 'other',
  TrackerRecordCategory.unknown: 'unknown',
};
