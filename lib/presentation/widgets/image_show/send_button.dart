import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/data/firebase/firebase_service.dart';
import 'package:litterflow_app/logic/cubits/image_show/loading_cubit/loading_cubit.dart';
import 'package:litterflow_app/logic/cubits/image_show/note_cubit/note_cubit.dart';
import 'package:litterflow_app/logic/cubits/image_show/type_cubit/type_cubit.dart';
import 'package:litterflow_app/logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';
import 'package:litterflow_app/presentation/widgets/image_show/build_show_dialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/strings.dart';
import '../../../data/location_service.dart';
import '../../../logic/cubits/image_show/quantity_cubit/quantity_cubit.dart';

class SendButton extends StatefulWidget {
  const SendButton({
    super.key,
  });

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    String type = 'Plastiques';
    String quantity = '0 à 10';
    String note = '';

    return BlocListener<TypeCubit, TypeState>(
      listener: (context, state) {
        if (state is TypeClicked) {
          type = state.type;
        }
      },
      child: BlocListener<QuantityCubit, QuantityState>(
        listener: (context, state) {
          if (state is QuantityClicked) {
            quantity = state.quantity;
          }
        },
        child: BlocListener<NoteCubit, NoteState>(
          listener: (context, state) {
            if (state is NoteTapping) {
              note = state.controller.text;
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kPrimaryColor.withOpacity(0.4),
                      blurRadius: 20.0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: BlocConsumer<TakePictureCubit, TakePictureState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        // todo: add internet connection check
                        BlocProvider.of<LoadingCubit>(context).loading();
                        List<double> coordinates =
                            await LocationService.getCurrentLocation();
                        DocumentReference document =
                            await FirebaseDataBase.sendData(
                          type: type,
                          quantity: quantity,
                          note: note,
                          latitude: coordinates[0],
                          longitude: coordinates[1],
                        );
                        if (state is CameraTakePictureSuccessState) {
                          await FirebaseDataBase.uploadImageToFirebase(
                            imageFile: state.image,
                            documentId: document.id,
                          );
                          if (!mounted) return;
                          BlocProvider.of<LoadingCubit>(context).loaded();
                          buildShowDialog(context);
                        }
                      },
                      child: BlocConsumer<LoadingCubit, LoadingState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return state is LoadingInProgress
                              ? Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                          color: AppColors.kWhiteColor,
                                          size: 30),
                                )
                              : const Text(
                                  ScanStrings.sendButton,
                                  style: TextStyle(
                                    fontFamily: 'MontserratAlternates',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kWhiteColor,
                                  ),
                                );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
