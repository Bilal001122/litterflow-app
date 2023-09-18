import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:litterflow_app/constants/strings.dart';
import 'package:litterflow_app/constants/themes.dart';
import 'package:litterflow_app/data/cache_helper/cache_helper.dart';
import 'package:litterflow_app/firebase_options.dart';
import 'package:litterflow_app/logic/cubits/image_show/loading_cubit/loading_cubit.dart';
import 'package:litterflow_app/logic/cubits/image_show/note_cubit/note_cubit.dart';
import 'package:litterflow_app/logic/cubits/image_show/quantity_cubit/quantity_cubit.dart';
import 'package:litterflow_app/logic/cubits/image_show/type_cubit/type_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/flash_cubit/flash_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/zoom_cubit/zoom_cubit.dart';
import 'package:litterflow_app/presentation/app_router/app_router.dart';
import 'package:litterflow_app/presentation/screens/splash/splash_screen.dart';
import 'logic/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/blocs/scan/camera_bloc/camera_bloc.dart';
import 'logic/cubits/layout/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/services.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  AppRouter appRouter = AppRouter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(appRouter: appRouter),),);
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
        BlocProvider<ZoomCubit>(
          create: (context) => ZoomCubit(),
        ),
        BlocProvider<FlashCubit>(
          create: (context) => FlashCubit(),
        ),
        BlocProvider<TakePictureCubit>(
          create: (context) => TakePictureCubit(),
        ),
        BlocProvider<TypeCubit>(
          create: (context) => TypeCubit(),
        ),
        BlocProvider<QuantityCubit>(
          create: (context) => QuantityCubit(),
        ),
        BlocProvider<NoteCubit>(
          create: (context) => NoteCubit(),
        ),
        BlocProvider<LoadingCubit>(
          create: (context) => LoadingCubit(),
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
