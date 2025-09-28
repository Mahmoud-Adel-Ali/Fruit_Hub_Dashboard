import 'package:flutter/material.dart';

import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
