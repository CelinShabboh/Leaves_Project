part of 'leaves_cubit.dart';

abstract class LeavesState {}

class LeavesInitial extends LeavesState {}

class LeavesLoading extends LeavesState {}

class LeavesLoaded extends LeavesState {
  final List<LeaveItem> leaves;
  final int totalLeaves;

  LeavesLoaded({required this.leaves, required this.totalLeaves});
}

class LeavesError extends LeavesState {
  final String message;

  LeavesError({required this.message});
}
