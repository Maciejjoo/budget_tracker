import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/enums/tracker_record_type.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/utils/ui/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerItemTypeFilter extends StatelessWidget {
  const TrackerItemTypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerCubit, TrackerState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.largePadding,
          ),
          child: Row(
            children: [
              _FilterPill(
                label: LocaleKeys.filterAll.tr(),
                isSelected: state.selectedType == null,
                onTap: () {
                  context.read<TrackerCubit>().selectFilterType(null);
                },
              ),
              const SizedBox(width: Dimensions.mediumPadding),
              _FilterPill(
                label: LocaleKeys.filterIncome.tr(),
                isSelected: state.selectedType == TrackerRecordType.income,
                onTap: () {
                  context.read<TrackerCubit>().selectFilterType(
                    TrackerRecordType.income,
                  );
                },
              ),
              const SizedBox(width: Dimensions.mediumPadding),
              _FilterPill(
                label: LocaleKeys.filterExpense.tr(),
                isSelected: state.selectedType == TrackerRecordType.expense,
                onTap: () {
                  context.read<TrackerCubit>().selectFilterType(
                    TrackerRecordType.expense,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: isSelected
          ? theme.colorScheme.primary
          : theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.largePadding,
            vertical: Dimensions.mediumPadding,
          ),
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
