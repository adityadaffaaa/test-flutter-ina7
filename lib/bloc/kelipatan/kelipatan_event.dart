part of 'kelipatan_bloc.dart';

sealed class KelipatanEvent extends Equatable {
  const KelipatanEvent();

  @override
  List<Object> get props => [];
}

class KelipatanButtonPressed extends KelipatanEvent {
  const KelipatanButtonPressed({
    required this.btnNumber,
    required this.inputN,
  });
  final int btnNumber;
  final int inputN;

  @override
  List<Object> get props => [btnNumber, inputN];

  @override
  String toString() => 'KelipatanButtonPressed => $btnNumber - $inputN';
}
