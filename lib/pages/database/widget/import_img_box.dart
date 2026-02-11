import 'package:aic_planner/shared/model/facility_model.dart';
import 'package:flutter/material.dart';

class ImportImgBox extends StatelessWidget {
  final VoidCallback onTapCallback;
  final String lable;
  final FacilityDefinition facility;

  const ImportImgBox({
    super.key,
    required this.onTapCallback,
    required this.lable,
    required this.facility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTapCallback,
          child: Container(
            height: 23,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white24),
            ),
            child: const Icon(
              Icons.file_upload_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(lable, style: TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }
}
