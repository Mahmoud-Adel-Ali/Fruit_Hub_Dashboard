import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
