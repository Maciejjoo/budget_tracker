import 'package:budget_tracker/src/application/local_storage/local_storage_service.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracker_record.freezed.dart';
part 'tracker_record.g.dart';

@freezed
sealed class TrackerRecordEntity with _$TrackerRecordEntity {
  const factory TrackerRecordEntity({
    required int id,
    required DateTime date,
    required double amount,
    required TrackerRecordType type,

    TrackerRecordCategory? category,
    String? description,
  }) = _TrackerRecordEntity;

  factory TrackerRecordEntity.fromTrackerRecord(TrackerRecord record) {
    return TrackerRecordEntity(
      id: record.id,
      date: record.date,
      amount: record.amount / 100, // Convert cents back to dollars
      type: record.amount >= 0
          ? TrackerRecordType.income
          : TrackerRecordType.expense,
      category: record.category != null
          ? TrackerRecordCategory.values.firstWhere(
              (e) => e.name == record.category,
              orElse: () => TrackerRecordCategory.unknown,
            )
          : null,
      description: record.description,
    );
  }

  factory TrackerRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$TrackerRecordEntityFromJson(json);
}
