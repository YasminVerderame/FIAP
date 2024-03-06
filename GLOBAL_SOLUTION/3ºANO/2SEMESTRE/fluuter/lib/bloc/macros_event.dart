part of 'macros_bloc.dart';

sealed class MacrosEvent extends Equatable {
  const MacrosEvent();

  @override
  List<Object> get props => [];
}

class GetMacrosEvent extends MacrosEvent {
  final String? gender;
  final int? age;
  final int? height;
  final int? weight;
  final String? activityLevel;
  final String? goal;

  const GetMacrosEvent({
    this.age,
    this.height,
    this.weight,
    this.activityLevel,
    this.goal,
    this.gender,
  });
}