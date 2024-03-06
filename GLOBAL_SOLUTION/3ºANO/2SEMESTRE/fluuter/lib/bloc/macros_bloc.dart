import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macros_amounts/models/macros_model.dart';
import 'package:macros_amounts/service/calculator_service.dart';

part 'macros_event.dart';
part 'macros_state.dart';

class MacrosBloc extends Bloc<MacrosEvent, MacrosState> {
  MacrosBloc() : super(MacrosInitial()) {
    on<GetMacrosEvent>(_onGetMacrosEvent);
  }

  void _onGetMacrosEvent(
    GetMacrosEvent event,
    Emitter emit,
  ) async {
    try {
      emit(MacrosLoading());

      final response = await getMacros(
        gender: event.gender,
        age: event.age,
        height: event.height,
        weight: event.weight,
        activityLevel: event.activityLevel,
        goal: event.goal,
      );

      emit(MacrosSuccess(data: response));
    } catch (error) {
      emit(MacrosError(error: error.toString()));
    }
  }
}
