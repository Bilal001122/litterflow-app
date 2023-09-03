import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/strings.dart';
import 'package:litterflow_app/constants/themes.dart';
import 'package:litterflow_app/logic/blocs/camera_bloc/camera_bloc.dart';
import 'package:litterflow_app/presentation/app_router/app_router.dart';
import 'package:litterflow_app/presentation/screens/splash/splash_screen.dart';
import 'logic/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubits/navigation_cubit/navigation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  AppRouter appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<CameraBloc>(
          create: (context) => CameraBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppGlobalStrings.appTitle,
        theme: Themes.kLightTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
