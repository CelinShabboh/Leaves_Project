class LeaveListResponse {
  final int? response;
  final String? message;
  final LeaveData? data;

  LeaveListResponse({this.response, this.message, this.data});

  factory LeaveListResponse.fromJson(Map<String, dynamic> json) {
    return LeaveListResponse(
      response: json['response'],
      message: json['message'],
      data: json['data'] != null ? LeaveData.fromJson(json['data']) : null,
    );
  }
}

class LeaveData {
  final int? pageNumber;
  final int? totalPages;
  final int? pageSize;
  final int? totalSize;
  final int? companyId;
  final int? departmentId;
  final int? employeeId;
  final String? fromDate;
  final String? toDate;
  final List<LeaveItem>? leaves;

  LeaveData({
    this.pageNumber,
    this.totalPages,
    this.pageSize,
    this.totalSize,
    this.companyId,
    this.departmentId,
    this.employeeId,
    this.fromDate,
    this.toDate,
    this.leaves,
  });

  factory LeaveData.fromJson(Map<String, dynamic> json) {
    return LeaveData(
      pageNumber: json['pageNumber'],
      totalPages: json['totalPages'],
      pageSize: json['pageSize'],
      totalSize: json['totalSize'],
      companyId: json['companyId'],
      departmentId: json['departmentId'],
      employeeId: json['employeeId'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      leaves: json['leaves'] != null
          ? List<LeaveItem>.from(
              json['leaves'].map((x) => LeaveItem.fromJson(x)))
          : [],
    );
  }
}

class LeaveItem {
  final int? id;
  final int? employeeId;
  final int? typeId;
  final String? absenceFrom;
  final String? absenceTo;
  final String? notes;
  final String? employeeName;
  final int? statusId;
  final String? statusName;
  final String? absenceValue;
  final String? number;

  LeaveItem({
    this.id,
    this.employeeId,
    this.typeId,
    this.absenceFrom,
    this.absenceTo,
    this.notes,
    this.employeeName,
    this.statusId,
    this.statusName,
    this.absenceValue,
    this.number,
  });

  factory LeaveItem.fromJson(Map<String, dynamic> json) {
    return LeaveItem(
      id: json['id'],
      employeeId: json['employeeId'],
      typeId: json['typeId'],
      absenceFrom: json['absenceFrom'],
      absenceTo: json['absenceTo'],
      notes: json['notes'],
      employeeName: json['employeeName'],
      statusId: json['statusId'],
      statusName: json['statusName'],
      absenceValue: json['absenceValue'],
      number: json['number'],
    );
  }
}
