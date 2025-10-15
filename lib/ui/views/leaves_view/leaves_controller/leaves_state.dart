part of 'leaves_cubit.dart';

abstract class LeavesState {}

class LeavesInitial extends LeavesState {}

class LeavesLoading extends LeavesState {}

class LeavesLoaded extends LeavesState {
  final List<LeaveItem> leaves;
  final int totalLeaves;
  final Map<String, dynamic>? leaveCount;

  LeavesLoaded({
    required this.leaves,
    required this.totalLeaves,
    this.leaveCount,
  });

  LeavesLoaded copyWith({
    List<LeaveItem>? leaves,
    int? totalLeaves,
    Map<String, dynamic>? leaveCount,
  }) {
    return LeavesLoaded(
      leaves: leaves ?? this.leaves,
      totalLeaves: totalLeaves ?? this.totalLeaves,
      leaveCount: leaveCount ?? this.leaveCount,
    );
  }
}

class LeavesError extends LeavesState {
  final String message;
  LeavesError({required this.message});
}
