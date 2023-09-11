import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litterflow_app/constants/colors.dart';
import 'package:litterflow_app/logic/cubits/scan/take_picture_cubit/take_picture_cubit.dart';
import 'package:litterflow_app/presentation/widgets/image_show/custom_app_bar.dart';
import 'package:litterflow_app/presentation/widgets/image_show/footer_row.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DrawnRectangle {
  final Rect rect;
  final Color color;

  DrawnRectangle(this.rect, this.color);
}

class ImageShowScreen extends StatefulWidget {
  const ImageShowScreen({super.key});

  @override
  State<ImageShowScreen> createState() => _ImageShowScreenState();
}

class _ImageShowScreenState extends State<ImageShowScreen> {
  List<DrawnRectangle> drawnRectangles = [];
  Rect? currentRectangle;
  Offset? startPoint;
  final GlobalKey repaintKey = GlobalKey();

  void _clearRectangles(List<DrawnRectangle> drawnRectangles) {
    setState(() {
      drawnRectangles.clear();
    });
  }

  XFile convertUint8ListToXFile(Uint8List uint8List) {
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
      XFile editedImage = convertUint8ListToXFile(uint8List);
      if (!mounted) return;
      BlocProvider.of<TakePictureCubit>(context).emit(
        CameraTakePictureSuccessState(image: editedImage),
      );
    }
  }

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
                        child: ClipRect(
                          child: RepaintBoundary(
                            key: repaintKey,
                            child: GestureDetector(
                              onPanDown: (details) {
                                startPoint = details.localPosition;
                              },
                              onPanUpdate: (details) {
                                setState(() {
                                  final endPoint = details.localPosition;
                                  currentRectangle =
                                      Rect.fromPoints(startPoint!, endPoint);
                                  if (drawnRectangles.isNotEmpty) {
                                    drawnRectangles.removeLast();
                                  }
                                  drawnRectangles.add(
                                    DrawnRectangle(
                                      currentRectangle!,
                                      Colors.red,
                                    ),
                                  );
                                });
                              },
                              onPanEnd: (_) {
                                if (currentRectangle != null) {
                                  setState(() {
                                    drawnRectangles.add(
                                      DrawnRectangle(
                                        currentRectangle!,
                                        Colors.red,
                                      ),
                                    );
                                    currentRectangle = null;
                                  });
                                }
                              },
                              child: CustomPaint(
                                foregroundPainter:
                                    RectanglePainter(drawnRectangles),
                                child: Image.file(
                                  File(
                                    state.image.path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FooterRow(
                        clearRectangles: _clearRectangles,
                        drawnRectangles: drawnRectangles,
                        repaintKey: repaintKey,
                        saveImageWithRectangles: saveImageWithRectangles,
                      ),
                    ],
                  )
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.kPrimaryColor,
                      size: 30,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final List<DrawnRectangle> rectangles;

  RectanglePainter(this.rectangles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (var rectangle in rectangles) {
      paint.color = rectangle.color;
      canvas.drawRect(rectangle.rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
