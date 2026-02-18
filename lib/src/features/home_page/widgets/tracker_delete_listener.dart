import 'package:budget_tracker/generated/locale_keys.g.dart';
import 'package:budget_tracker/src/features/home_page/cubits/tracker_cubit/tracker_cubit.dart';
import 'package:budget_tracker/src/utils/ui/app_snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackerDeleteListener extends StatelessWidget {
  final Widget child;
  const TrackerDeleteListener({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackerCubit, TrackerState>(
      listenWhen: (p, c) {
        return p.isRemovingRecordSuccess != c.isRemovingRecordSuccess;
      },
      listener: (context, state) {
        if (state.isRemovingRecordSuccess == true) {
          AppSnackbar.instance.showSuccess(
            context,
            message: LocaleKeys.recordDeletedSuccessfully.tr(),
          );
        } else if (state.isRemovingRecordSuccess == false) {
          AppSnackbar.instance.showError(
            context,
            message: LocaleKeys.failedToDeleteRecord.tr(),
          );
        }
      },
      child: child,
    );
  }
}
