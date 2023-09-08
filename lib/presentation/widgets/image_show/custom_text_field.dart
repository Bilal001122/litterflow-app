import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/cubits/image_show/note_cubit/note_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).onTap(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is NoteTapping
              ? TextField(
                  onChanged: (value) {
                    BlocProvider.of<NoteCubit>(context).onTap(_controller);
                  },
                  controller: state.controller,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kSecondaryColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    fillColor: AppColors.kFourthColor,
                    filled: true,
                    hintText: 'Ajouter une note',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kSecondaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: AppColors.kFourthColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  maxLength: 500,
                  maxLines: 5,
                )
              : Container();
        },
      ),
    );
  }
}
