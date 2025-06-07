import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class TreatmentPlanRow extends StatelessWidget {
  final bool isActive;
  final String sessionName;
  final String date;
  final int planId;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool showDateInsteadOfDelete;

  const TreatmentPlanRow({
    super.key,
    required this.isActive,
    required this.sessionName,
    required this.date,
    required this.planId,
    required this.onEdit,
    required this.onDelete,
    this.showDateInsteadOfDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: isActive ? Colors.green : Colors.grey,
                  ),
                ),
                child: Icon(
                  isActive ? Icons.check : Icons.close,
                  color: isActive ? Colors.green : Colors.grey,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                      Text(sessionName, style: TextStyles.font20BlackRegular),
                ),
              ),
              GestureDetector(
                onTap: isActive ? onEdit : onDelete,
                child: Text(
                  isActive
                      ? (showDateInsteadOfDelete ? date : 'Edit')
                      : (showDateInsteadOfDelete ? date : 'Delete'),
                  style: TextStyle(
                    fontSize: 20,
                    color: isActive
                        ? ColorsManager.Blue
                        : (showDateInsteadOfDelete
                            ? ColorsManager.Blue
                            : Colors.red),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Divider(height: 1, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
