import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TrackerRecordItem extends StatelessWidget {
  final TrackerRecordEntity record;

  const TrackerRecordItem({required this.record, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isIncome = record.type == TrackerRecordType.income;
    final amountColor = isIncome ? Colors.green : theme.colorScheme.error;
    final amountPrefix = isIncome ? '+' : '-';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: colorScheme.surface,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isIncome
              ? Colors.green.withValues(alpha: 0.2)
              : theme.colorScheme.error.withValues(alpha: 0.2),
          child: Icon(
            isIncome ? Icons.arrow_upward : Icons.arrow_downward,
            color: amountColor,
          ),
        ),
        title: Text(
          record.category?.name.toUpperCase() ?? LocaleKeys.unknown.tr(),
          style: theme.textTheme.labelMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (record.description != null)
              Text(record.description!, style: theme.textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMM dd, yyyy HH:mm').format(record.date),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Text(
          '$amountPrefix\$${record.amount.abs().toStringAsFixed(2)}',
          style: theme.textTheme.bodyMedium?.copyWith(color: amountColor),
        ),
      ),
    );
  }
}
