import 'package:dental_project/core/data/models/leave_model.dart';
import 'package:dental_project/core/data/repository/leave_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'leaves_state.dart';

class LeavesCubit extends Cubit<LeavesState> {
  final LeaveRepository repository;

  LeavesCubit(this.repository) : super(LeavesInitial());

Future<void> getLeaves({
  required int companyId,
  required int departmentId,
  required int employeeId,
  required String token,
}) async {
  emit(LeavesLoading());
  try {
    final response = await repository.fetchLeaves(
      companyId: companyId,
      departmentId: departmentId,
      employeeId: employeeId,
      token: token, 
    );

    final leaves = response.data?.leaves ?? [];
    final totalSize = response.data?.totalSize ?? leaves.length;

    emit(LeavesLoaded(leaves: leaves, totalLeaves: totalSize));
  } catch (e) {
    emit(LeavesError(message: e.toString()));
  }
}

}
