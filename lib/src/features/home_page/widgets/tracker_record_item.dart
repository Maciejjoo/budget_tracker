import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/domain/tracker_record.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:budget_tracker/src/utils/ui/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TrackerRecordItem extends StatelessWidget {
  final TrackerRecordEntity record;
  final VoidCallback? onDelete;

  const TrackerRecordItem({required this.record, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isIncome = record.type == TrackerRecordType.income;
    final amountColor = isIncome ? Colors.green : theme.colorScheme.error;
    final amountPrefix = isIncome ? '+' : '-';

    return Dismissible(
      key: Key('tracker_record_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Dimensions.largePadding),
        margin: const EdgeInsets.symmetric(
          horizontal: Dimensions.largePadding,
          vertical: Dimensions.mediumPadding,
        ),
        decoration: BoxDecoration(
          color: colorScheme.error,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        onDelete?.call();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: Dimensions.largePadding,
          vertical: Dimensions.mediumPadding,
        ),
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
              const SizedBox(height: Dimensions.smallPadding),
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
      ),
    );
  }
}
