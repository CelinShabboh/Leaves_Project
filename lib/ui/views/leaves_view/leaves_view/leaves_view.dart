import 'dart:async';
import 'package:dental_project/app/my_app.dart';
import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/LoginView/login_view/login_view.dart';
import 'package:dental_project/ui/views/leaves_view/leaves_controller/leaves_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeavesView extends StatefulWidget {
  final String employeeName;
  final int companyId;
  final int departmentId;
  final int employeeId;
  final String token;

  const LeavesView({
    super.key,
    required this.employeeName,
    required this.companyId,
    required this.departmentId,
    required this.employeeId,
    required this.token,
  });

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  String selectedMonth = "October";
  String selectedYear = "2025";

  final ScrollController _scrollController = ScrollController();
  bool _isBottomLoading = false;
  bool _showErrorMessage = false;
  Timer? _tokenTimer;

  bool _isMonthDropdownOpen = false;
  bool _isYearDropdownOpen = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final isValid = SharedPrefrenceRepository().isTokenValid();
      if (!isValid) {
        Get.offAll(const LoginView());
        return;
      }

      context.read<LeavesCubit>().getLeaves(
            companyId: widget.companyId,
            departmentId: widget.departmentId,
            employeeId: widget.employeeId,
            token: widget.token,
          );
    });

    _tokenTimer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      final isValid = SharedPrefrenceRepository().isTokenValid();
      if (!isValid) {
        timer.cancel();
        Get.offAll(const LoginView());
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !_isBottomLoading &&
          !_showErrorMessage) {
        _simulateBottomLoading();
      }
    });
  }

  @override
  void dispose() {
    _tokenTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _simulateBottomLoading() async {
    setState(() {
      _isBottomLoading = true;
      _showErrorMessage = false;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isBottomLoading = false;
      _showErrorMessage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 2,
          leading: const Icon(Icons.menu, color: AppColors.blackColor),
          title: Text(
            'My Leaves',
            style: GoogleFonts.cairo(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            const Icon(Icons.notifications_none, color: AppColors.blackColor),
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.containetBorderColor,
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.mainColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      body: BlocBuilder<LeavesCubit, LeavesState>(
        builder: (context, state) {
          if (state is LeavesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LeavesError) {
            return Center(child: Text(state.message));
          } else if (state is LeavesLoaded) {
            final leaves = state.leaves;
            final total = state.totalLeaves;
            final shown = leaves.length;
            final progress = total == 0 ? 0.0 : (shown / total).clamp(0.0, 1.0);

            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.scale(
                          scale: 1.8,
                          child: Image.asset(
                            'assets/images/pngs/blob2.png',
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth(8),
                        bottom: screenHeight(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.employeeName,
                              style: GoogleFonts.cairo(
                                color: AppColors.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 300,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.progressColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: progress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.filledProgressColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  "$shown Leaves",
                                  style: GoogleFonts.cairo(
                                    color: AppColors.whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 185),
                                Text(
                                  "$total Leaves",
                                  style: GoogleFonts.cairo(
                                    color: AppColors.whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Leaves",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.MyLeavesColor,
                          ),
                        ),
                        Row(
                          children: [
                            _buildDropdown(
                              selectedMonth,
                              [
                                "January",
                                "February",
                                "March",
                                "April",
                                "May",
                                "June",
                                "July",
                                "August",
                                "September",
                                "October",
                                "November",
                                "December"
                              ],
                              (value) => setState(() => selectedMonth = value!),
                              isMonth: true,
                            ),
                            const SizedBox(width: 10),
                            _buildDropdown(
                              selectedYear,
                              ["2023", "2024", "2025"],
                              (value) => setState(() => selectedYear = value!),
                              isMonth: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: leaves.length,
                    itemBuilder: (context, index) {
                      final leave = leaves[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.containetBorderColor,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  _buildInfoRow(
                                    imagePath: "assets/images/pngs/date.png",
                                    title: "Applied Duration",
                                    value:
                                        "${leave.absenceFrom?.split('T').first ?? ''} to ${leave.absenceTo?.split('T').first ?? ''}",
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow(
                                    imagePath: "assets/images/pngs/reason.png",
                                    title: "Reason",
                                    value: leave.notes ?? "No reason",
                                  ),
                                  const SizedBox(height: 10),
                                  _buildInfoRow(
                                    imagePath: "assets/images/pngs/type.png",
                                    title: "Type of Leave",
                                    value: leave.statusName ?? "Unknown",
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: AppColors.editColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  if (_isBottomLoading)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: ShaderMask(
                            shaderCallback: (bounds) => const SweepGradient(
                              colors: [
                                Colors.purple,
                                Colors.blue,
                                Colors.cyan,
                                Colors.teal,
                                Colors.purple,
                              ],
                              startAngle: 0.0,
                              endAngle: 6.283,
                            ).createShader(bounds),
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              strokeCap: StrokeCap.round,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (_showErrorMessage)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showErrorMessage = false;
                              _isBottomLoading = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Error, click to try again",
                                style: GoogleFonts.cairo(
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.refresh,
                                color: AppColors.blackColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  // ✅ مكونات مساعدة
  Widget _buildDropdown(
    String value,
    List<String> items,
    Function(String?) onChange, {
    bool isMonth = false,
  }) {
    bool isOpen = isMonth ? _isMonthDropdownOpen : _isYearDropdownOpen;

    return StatefulBuilder(
      builder: (context, setInnerState) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  isOpen ? AppColors.mainColor : AppColors.containetBorderColor,
              width: 1.5,
            ),
          ),
          child: DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: isOpen ? AppColors.mainColor : AppColors.greyColor,
            ),
            items: items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                onChange(val);
              });
              setInnerState(() {
                if (isMonth) {
                  _isMonthDropdownOpen = false;
                } else {
                  _isYearDropdownOpen = false;
                }
              });
            },
            onTap: () {
              setInnerState(() {
                if (isMonth) {
                  _isMonthDropdownOpen = !_isMonthDropdownOpen;
                } else {
                  _isYearDropdownOpen = !_isYearDropdownOpen;
                }
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required String imagePath,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 30, height: 30),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    GoogleFonts.cairo(color: AppColors.greyColor, fontSize: 14),
              ),
              Text(
                value,
                style: GoogleFonts.cairo(
                    color: AppColors.blackColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
