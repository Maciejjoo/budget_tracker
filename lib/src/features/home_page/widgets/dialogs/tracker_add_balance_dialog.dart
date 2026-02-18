import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerAddBalanceDialog extends StatefulWidget {
  const TrackerAddBalanceDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BlocListener<TrackerCubit, TrackerState>(
        listenWhen: (p, c) {
          return p.isAddingRecord != c.isAddingRecord ||
              p.isAddingRecordSuccess != c.isAddingRecordSuccess;
        },
        listener: (context, state) {
          if (state.isAddingRecordSuccess == true) {
            Navigator.of(context).pop();
            return;
          }
          if (state.isAddingRecordSuccess == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(LocaleKeys.failedToAddRecord.tr())),
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

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trackerCubit = context.read<TrackerCubit>();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
              const SizedBox(height: 24),
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
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(LocaleKeys.cancel.tr()),
                  ),
                  const SizedBox(width: 8),
                  BlocBuilder<TrackerCubit, TrackerState>(
                    buildWhen: (p, c) {
                      return p.isAddingRecord != c.isAddingRecord;
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final amount = double.parse(_amountController.text);
                            trackerCubit.addIncome(amount: amount);
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
