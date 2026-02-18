import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/application/theme/theme_cubit.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/features/home_page/widgets/dialogs/tracker_add_balance_dialog.dart';
import 'package:budget_tracker/src/features/home_page/widgets/dialogs/tracker_add_expense_dialog.dart';
import 'package:budget_tracker/src/features/home_page/widgets/tracker_record_item.dart';
import 'package:budget_tracker/src/utils/ui/custom_scroll_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        shadowColor: colorScheme.shadow,
        leading: BlocSelector<ThemeCubit, ThemeMode, ThemeMode>(
          selector: (state) => state,
          builder: (context, themeMode) {
            final isDark =
                themeMode == ThemeMode.dark ||
                (themeMode == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.dark);

            return IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              tooltip: LocaleKeys.toggleTheme.tr(),
            );
          },
        ),
        actions: [
          BlocSelector<TrackerCubit, TrackerState, double>(
            selector: (state) => state.balance,
            builder: (context, balance) {
              final balanceColor = balance >= 0
                  ? Colors.green
                  : theme.colorScheme.error;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: balanceColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedFlipCounter(
                          value: balance,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                          fractionDigits: 2,
                          prefix: '\$',
                          textStyle: theme.textTheme.bodyLarge?.copyWith(
                            color: balanceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox.square(
                        child: IconButton(
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            TrackerAddBalanceDialog.show(context);
                          },
                          tooltip: LocaleKeys.addBalance.tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TrackerCubit, TrackerState>(
        buildWhen: (p, c) {
          return p.records != c.records ||
              p.isLoadingRecords != c.isLoadingRecords;
        },
        builder: (context, state) {
          if (state.records.isEmpty && state.isLoadingRecords) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }

          if (state.records.isEmpty) {
            return Center(
              child: Text(
                LocaleKeys.noRecords.tr(),
                style: TextStyle(color: colorScheme.onSurface),
              ),
            );
          }

          return CustomScrollPage(
            onLoadMore: () {
              if (state.hasMoreRecords && !state.isLoadingRecords) {
                context.read<TrackerCubit>().loadRecords(loadMore: true);
              }
            },
            builder: (scrollController) {
              return ListView.builder(
                controller: scrollController,
                itemCount:
                    state.records.length + (state.isLoadingRecords ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.records.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colorScheme.primary,
                        ),
                      ),
                    );
                  }

                  final isFirst = index == 0;
                  final record = state.records[index];
                  return Padding(
                    padding: EdgeInsets.only(top: isFirst ? 16 : 0),
                    child: TrackerRecordItem(record: record),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TrackerAddExpenseDialog.show(context);
        },
        tooltip: LocaleKeys.addExpense.tr(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
