import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';

class ContainerRowDetails extends StatefulWidget {
  final Function(int)? onStatusChanged;

  const ContainerRowDetails({super.key, this.onStatusChanged});

  @override
  _ContainerRowDetailsState createState() => _ContainerRowDetailsState();
}

class _ContainerRowDetailsState extends State<ContainerRowDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w, // Adjusted width for two containers
      height: 36.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(2, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onStatusChanged?.call(index);
              },
              child: Container(
                height: 28.h,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index
                          ? ColorsManager.Blue
                          : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0 ? Radius.circular(12) : Radius.zero,
                    bottomLeft: index == 0 ? Radius.circular(12) : Radius.zero,
                    topRight: index == 1 ? Radius.circular(12) : Radius.zero,
                    bottomRight: index == 1 ? Radius.circular(12) : Radius.zero,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  index == 0 ? "Upcoming" : "Completed",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color:
                        selectedIndex == index
                            ? ColorsManager.white
                            : ColorsManager.Black,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
