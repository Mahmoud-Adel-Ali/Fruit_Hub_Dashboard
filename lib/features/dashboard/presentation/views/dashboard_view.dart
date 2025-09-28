import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

import '../../../../core/widgets/custom_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName = 'dashboard_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FrutHub DashBoard',
              style: AppTextStyles.bold19.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            CustomButton(text: 'Add Data', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
