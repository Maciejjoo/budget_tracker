import 'package:budget_tracker/src/utils/data_state/data_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export '../failure/failure.dart';

part 'data_state.freezed.dart';

@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.success({required T data}) = DataStateSuccess<T>;

  const factory DataState.failure(Failure failure) = DataStateFailure<T>;
}

extension DataStateX<T> on DataState<T> {
  bool get isSuccess => this is DataStateSuccess<T>;

  void handle({
    required void Function(T data) success,
    required void Function(Failure failure) failure,
  }) {
    return switch (this) {
      DataStateSuccess<T>(:final data) => success(data),
      DataStateFailure<T>(failure: final failure0) => failure(failure0),
    };
  }

  void asyncHandle({
    required Future<void> Function(T data) success,
    required Future<void> Function(Failure failure) failure,
  }) async {
    return switch (this) {
      DataStateSuccess<T>(:final data) => await success(data),
      DataStateFailure<T>(failure: final failure0) => await failure(failure0),
    };
  }
}
