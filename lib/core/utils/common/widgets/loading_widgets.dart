import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
