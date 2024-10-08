import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/cubits/image_show/type_cubit/type_cubit.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String dropDownValue = 'Plastiques';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TypeCubit>(context).typeClicked('Plastiques');
  }

  final List<String> items = [
    'Plastiques',
    'Déchets organiques',
    'Métaux',
    'Verre',
    'Papier/carton',
    'Produits chimiques/toxiques',
    'Débris de pêche',
    'Textiles',
    'Caoutchouc',
    'Verreries',
    'Déchets médicaux',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TypeCubit, TypeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is TypeClicked
            ? Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kFourthColor,
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kSecondaryColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(5.0),
                    isExpanded: true,
                    dropdownColor: AppColors.kFourthColor,
                    value: state.type,
                    items: items
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.kSecondaryColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      BlocProvider.of<TypeCubit>(context)
                          .typeClicked(value.toString());
                    },
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
