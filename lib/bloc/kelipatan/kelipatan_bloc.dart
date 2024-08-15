import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kelipatan_event.dart';
part 'kelipatan_state.dart';

class KelipatanBloc extends Bloc<KelipatanEvent, KelipatanState> {
  KelipatanBloc() : super(KelipatanInitial()) {
    on<KelipatanButtonPressed>(onKelipatanButtonPressed);
  }

  void onKelipatanButtonPressed(
      KelipatanButtonPressed event, Emitter<KelipatanState> emit) {
    // print(event.btnNumber);
    // print(event.inputN);

    try {
      List<dynamic> numbers = [];
      switch (event.btnNumber) {
        case 1:
          print(event.inputN);
          for (int i = 0; i < event.inputN; i++) {
            numbers.add(i + 1);
          }
          print(numbers);

          emit(KelipatanSuccess(numbers: numbers));
          break;
        case 2:
          List<int> reverseNum = [];
          for (int i = 0; i < event.inputN; i++) {
            numbers.add(i + 1);
            reverseNum.add(i);
          }

          numbers.addAll(reverseNum.reversed.take(event.inputN - 1));

          print(numbers);
          emit(KelipatanSuccess(numbers: numbers));
          break;
        case 3:
          for (int i = 1; i <= event.inputN; i++) {
            numbers.add([i, i - 1]);
          }
          print(numbers);
          emit(KelipatanSuccess(numbers: numbers));
          break;

        case 4:
          for (int i = 0; i < event.inputN; i++) {
            if ((i + 1) % 5 == 0) {
              numbers.add('LIMA');
            } else if ((i + 1) % 7 == 0) {
              numbers.add('TUJUH');
            } else {
              numbers.add(i + 1);
            }
          }
          print(numbers);
          emit(KelipatanSuccess(numbers: numbers));
          break;
      }
    } catch (e) {
      print(e);
      emit(KelipataFailure());
    }
  }
}
