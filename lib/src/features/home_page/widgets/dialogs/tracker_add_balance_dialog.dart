import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/utils/ui/app_snackbar.dart';
import 'package:budget_tracker/src/utils/ui/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerAddBalanceDialog extends StatefulWidget {
  const TrackerAddBalanceDialog({super.key});

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
        child: const TrackerAddBalanceDialog(),
      ),
    );
  }

  @override
  State<TrackerAddBalanceDialog> createState() =>
      _TrackerAddBalanceDialogState();
}

class _TrackerAddBalanceDialogState extends State<TrackerAddBalanceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

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
                LocaleKeys.addIncome.tr(),
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
                  FilteringTextInputFormatter.allow(r'^\d*\.?\d{0,2}'),
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
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final amount = double.parse(_amountController.text);
                            final note = _noteController.text.trim().isEmpty
                                ? null
                                : _noteController.text.trim();
                            trackerCubit.addIncome(amount: amount, note: note);
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
