import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';
import '../../screens/image_show/image_show_screen.dart';
import 'custom_bottom_sheet.dart';

class FooterRow extends StatefulWidget {
  final Function(List<DrawnRectangle>) clearRectangles;
  final Function(List<DrawnRectangle>) deleteLastRectangle;
  final List<DrawnRectangle> drawnRectangles;
  final GlobalKey repaintKey;
  final Function(GlobalKey) saveImageWithRectangles;

  const FooterRow({
    super.key,
    required this.clearRectangles,
    required this.drawnRectangles,
    required this.repaintKey,
    required this.saveImageWithRectangles, required this.deleteLastRectangle,
  });

  @override
  State<FooterRow> createState() => _FooterRowState();
}

class _FooterRowState extends State<FooterRow> {
  XFile convert8ListToXFile(Uint8List uint8List) {
    final tempDir = Directory.systemTemp;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final tempFile = File('${tempDir.path}/edited_image_$timestamp.png');
    tempFile.writeAsBytesSync(uint8List);
    return XFile(tempFile.path);
  }

  Future<void> saveImageWithRectangles(GlobalKey repaintKey) async {
    RenderRepaintBoundary boundary =
        repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 2.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List? uint8List = byteData?.buffer.asUint8List();
    if (uint8List != null) {
      XFile editedImage = convert8ListToXFile(uint8List);
      if (!mounted) return;
      BlocProvider.of<TakePictureCubit>(context)
          .takePicture(image: editedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.undo_outlined,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  widget.deleteLastRectangle(widget.drawnRectangles);
                },
              ),
              const Text(
                ScanStrings.backButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.cancel_outlined,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  widget.clearRectangles(widget.drawnRectangles);
                },
              ),
              const Text(
                ScanStrings.cancelButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.save_outlined,
                  size: 35,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  widget.saveImageWithRectangles(widget.repaintKey);
                },
              ),
              const Text(
                ScanStrings.saveButton,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryColor.withOpacity(0.4),
                  blurRadius: 20.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextButton(
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
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => const CustomBottomSheet(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                );
              },
              child: const Text(
                ScanStrings.continueButton,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
