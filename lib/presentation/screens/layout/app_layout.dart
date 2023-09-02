import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import '../../../logic/cubits/navigation_cubit/navigation_cubit.dart';
import '../../widgets/layout/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../home/home_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body:
                state is NavigationSuccess ? state.screen : const HomeScreen(),
            bottomNavigationBar: state is NavigationSuccess
                ? CustomBottomNavigationBar(state: state)
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
          );
        },
      ),
    );
  }
}

