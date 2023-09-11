import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/constants/images.dart';
import 'package:litterflow_app/logic/cubits/layout/navigation_cubit/navigation_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/flash_cubit/flash_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/zoom_cubit/zoom_cubit.dart';
import 'package:litterflow_app/presentation/screens/home/home_screen.dart';
import 'package:litterflow_app/presentation/widgets/scan/flash_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../logic/blocs/scan/camera_bloc/camera_bloc.dart';
import '../../widgets/scan/scan_button.dart';
import '../../widgets/scan/zoom_button.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.removeRoute(context, ModalRoute.of(context)!);
        BlocProvider.of<NavigationCubit>(context)
            .emit(NavigationSuccess(screen: const HomeScreen()));
        return true;
      },
      child: BlocConsumer<CameraBloc, CameraState>(
        listener: (context, state) {
          if (state is CameraSuccessState) {
            BlocProvider.of<ZoomCubit>(context).changeZoom(1, state.controller);
            BlocProvider.of<FlashCubit>(context).changeFlash(
              isFlashOn: false,
              controller: state.controller,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.kDarkColor,
              body: state is CameraSuccessState
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Stack(
                            children: [
                              Center(
                                child: CameraPreview(
                                  state.controller,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppColors.kWhiteColor,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    ScanImages.logoWhite,
                                  ),
                                  FlashButton(
                                    cameraSuccessState: state,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const ScanButton(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ZoomButton(
                                    zoom: 1,
                                    text: '1x',
                                    controller: state.controller,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ZoomButton(
                                    zoom: 2,
                                    text: '2x',
                                    controller: state.controller,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ZoomButton(
                                    zoom: 3,
                                    text: '3x',
                                    controller: state.controller,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.kPrimaryColor,
                        size: 30,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
