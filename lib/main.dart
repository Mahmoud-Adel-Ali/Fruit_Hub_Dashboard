import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/helper_function/on_generate_routes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/services/supabase_storage_service.dart';
import 'features/dashboard/presentation/views/dashboard_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Supabase initialization
  await SupabaseStorageService.initialize();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();

  Bloc.observer = CustomBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fruit Hub Dashboard',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
