import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/utils/ui/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerCategoryChart extends StatefulWidget {
  const TrackerCategoryChart({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (_) => const TrackerCategoryChart());
  }

  @override
  State<TrackerCategoryChart> createState() => _TrackerCategoryChartState();
}

class _TrackerCategoryChartState extends State<TrackerCategoryChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.veryLargePadding),
        child: SizedBox(
          width: 500,
          height: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.spendingByCategory.tr(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.extraLargePadding),
              Expanded(
                child: BlocProvider.value(
                  value: context.read<TrackerCubit>()..getChartData(),
                  child: BlocBuilder<TrackerCubit, TrackerState>(
                    buildWhen: (p, c) {
                      return p.categoriesWithTotalAmount !=
                              c.categoriesWithTotalAmount ||
                          p.isLoadingChartData != c.isLoadingChartData;
                    },

                    builder: (context, state) {
                      if (state.isLoadingChartData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final expenseData = state.categoriesWithTotalAmount
                          .where((item) => item.$2 < 0)
                          .toList();

                      if (expenseData.isEmpty) {
                        return Center(
                          child: Text(
                            LocaleKeys.noExpenseDataAvailable.tr(),
                            style: theme.textTheme.bodyMedium,
                          ),
                        );
                      }

                      final total = expenseData.fold<int>(
                        0,
                        (sum, item) => sum + item.$2.abs(),
                      );

                      return Column(
                        children: [
                          Expanded(
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                        setState(() {
                                          if (!event
                                                  .isInterestedForInteractions ||
                                              pieTouchResponse == null ||
                                              pieTouchResponse.touchedSection ==
                                                  null) {
                                            touchedIndex = -1;
                                            return;
                                          }
                                          touchedIndex = pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                        });
                                      },
                                ),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 2,
                                centerSpaceRadius: 40,
                                sections: expenseData.asMap().entries.map((
                                  entry,
                                ) {
                                  final index = entry.key;
                                  final data = entry.value;
                                  final category = data.$1;
                                  final amount = data.$2.abs();
                                  final isTouched = index == touchedIndex;
                                  final radius = isTouched ? 110.0 : 100.0;
                                  final percentage = (amount / total * 100);

                                  return PieChartSectionData(
                                    color: category.color,
                                    value: amount.toDouble(),
                                    title: isTouched
                                        ? '${percentage.toStringAsFixed(1)}%'
                                        : '',
                                    radius: radius,
                                    titleStyle: TextStyle(
                                      fontSize: isTouched ? 16 : 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimensions.largePadding),
                          Wrap(
                            spacing: 16,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: expenseData.map((data) {
                              final category = data.$1;
                              // Convert cents to dollars
                              final amount = data.$2.abs() / 100;

                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: category.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${category.uiName}: \$${amount.toStringAsFixed(2)}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
