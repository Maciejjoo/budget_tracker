import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.notFound() = FailureNotFound;
  const factory Failure.badResponse() = FailureBadResponse;
}

extension FailureX on Failure {
  void handle({
    VoidCallback? notFound,
    VoidCallback? badResponse,
    VoidCallback? orElse,
  }) {
    switch (this) {
      case FailureNotFound():
        notFound?.call();
        break;
      case FailureBadResponse():
        badResponse?.call();
        break;
    }

    orElse?.call();
  }
}
