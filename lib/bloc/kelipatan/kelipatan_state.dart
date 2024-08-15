part of 'kelipatan_bloc.dart';

sealed class KelipatanState extends Equatable {
  const KelipatanState();

  @override
  List<Object> get props => [];
}

final class KelipatanInitial extends KelipatanState {}

final class KelipataFailure extends KelipatanState {}

final class KelipatanSuccess extends KelipatanState {
  final List<dynamic> numbers;

  const KelipatanSuccess({
    required this.numbers,
  });

  @override
  List<Object> get props => [numbers];
}
