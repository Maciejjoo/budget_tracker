import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/enums/tracker_record_category.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/utils/ui/app_snackbar.dart';
import 'package:budget_tracker/src/utils/ui/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerAddExpenseDialog extends StatefulWidget {
  const TrackerAddExpenseDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocListener<TrackerCubit, TrackerState>(
        listenWhen: (p, c) {
          return p.isAddingRecord != c.isAddingRecord ||
              p.isAddingRecordSuccess != c.isAddingRecordSuccess;
        },
        listener: (context, state) {
          if (state.isAddingRecordSuccess == true) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            return;
          }
          if (state.isAddingRecordSuccess == false) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            AppSnackbar.instance.showError(
              context,
              message: LocaleKeys.failedToAddRecord.tr(),
            );
          }
        },
        child: const TrackerAddExpenseDialog(),
      ),
    );
  }

  @override
  State<TrackerAddExpenseDialog> createState() =>
      _TrackerAddExpenseDialogState();
}

class _TrackerAddExpenseDialogState extends State<TrackerAddExpenseDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  TrackerRecordCategory? _selectedCategory;

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trackerCubit = context.read<TrackerCubit>();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.veryLargePadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.addExpense.tr(),
                style: theme.textTheme.labelLarge,
              ),
              const SizedBox(height: Dimensions.extraLargePadding),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.amount.tr(),
                  prefixText: '\$ ',
                  border: const OutlineInputBorder(),
                  hintText: LocaleKeys.enterAmount.tr(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.pleaseEnterAmount.tr();
                  }
                  final amount = double.tryParse(value);
                  if (amount == null) {
                    return LocaleKeys.pleaseEnterValidNumber.tr();
                  }
                  if (amount <= 0) {
                    return LocaleKeys.amountMustBeGreaterThanZero.tr();
                  }
                  return null;
                },
                autofocus: true,
              ),
              const SizedBox(height: Dimensions.largePadding),
              DropdownButtonFormField<TrackerRecordCategory>(
                initialValue: _selectedCategory,
                decoration: InputDecoration(
                  labelText: LocaleKeys.category.tr(),
                  border: const OutlineInputBorder(),
                  hintText: LocaleKeys.selectCategory.tr(),
                ),
                items:
                    [
                      TrackerRecordCategory.food,
                      TrackerRecordCategory.transport,
                      TrackerRecordCategory.entertainment,
                      TrackerRecordCategory.utilities,
                      TrackerRecordCategory.other,
                    ].map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.uiName),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return LocaleKeys.selectCategory.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: Dimensions.largePadding),
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.note.tr(),
                  border: const OutlineInputBorder(),
                  hintText: LocaleKeys.enterNote.tr(),
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: Dimensions.extraLargePadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(LocaleKeys.cancel.tr()),
                  ),
                  const SizedBox(width: Dimensions.mediumPadding),
                  BlocBuilder<TrackerCubit, TrackerState>(
                    buildWhen: (p, c) {
                      return p.isAddingRecord != c.isAddingRecord;
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state.isAddingRecord
                            ? null
                            : () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final amount = double.parse(
                                    _amountController.text,
                                  );
                                  final note =
                                      _noteController.text.trim().isEmpty
                                      ? null
                                      : _noteController.text.trim();
                                  trackerCubit.addExpense(
                                    amount: amount,
                                    category: _selectedCategory!.name,
                                    note: note,
                                  );
                                }
                              },
                        child: state.isAddingRecord
                            ? const _Loader()
                            : Text(LocaleKeys.add.tr()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
      width: 10,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
