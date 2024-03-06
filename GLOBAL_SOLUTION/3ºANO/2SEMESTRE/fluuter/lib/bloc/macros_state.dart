part of 'macros_bloc.dart';

sealed class MacrosState extends Equatable {
  const MacrosState();

  @override
  List<Object> get props => [];
}

final class MacrosInitial extends MacrosState {}

final class MacrosSuccess extends MacrosState {
  final MacrosModel? data;

  const MacrosSuccess({required this.data});
}

final class MacrosLoading extends MacrosState {}

final class MacrosError extends MacrosState {
  final String? error;

  const MacrosError({required this.error});
}