import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';
import 'package:litterflow_app/presentation/widgets/image_show/custom_app_bar.dart';
import 'package:litterflow_app/presentation/widgets/image_show/footer_row.dart';


class ImageShowScreen extends StatefulWidget {
  const ImageShowScreen({super.key});

  @override
  State<ImageShowScreen> createState() => _ImageShowScreenState();
}

class _ImageShowScreenState extends State<ImageShowScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kWhiteColor,
        body: BlocConsumer<TakePictureCubit, TakePictureState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is CameraTakePictureSuccessState
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomAppBar(),
                      Expanded(
                        child: Image.file(
                          File(state.image.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const FooterRow(),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
