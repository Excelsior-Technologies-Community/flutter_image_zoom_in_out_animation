import 'package:flutter/material.dart';

class ImageSliderZoom extends StatefulWidget {
  final List<String> images;

  const ImageSliderZoom({super.key, required this.images});

  @override
  State<ImageSliderZoom> createState() => _ImageSliderZoomState();
}

class _ImageSliderZoomState extends State<ImageSliderZoom> {
  final PageController pageController = PageController();
  final TransformationController zoomController = TransformationController();

  int currentIndex = 0;
  bool isZoomed = false;

  @override
  void dispose() {
    pageController.dispose();
    zoomController.dispose();
    super.dispose();
  }

  void resetZoom() {
    zoomController.value = Matrix4.identity();
    setState(() => isZoomed = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            physics: isZoomed
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                resetZoom();
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: InteractiveViewer(
                  transformationController: zoomController,
                  panEnabled: true,
                  scaleEnabled: true,
                  constrained: false,
                  boundaryMargin: const EdgeInsets.all(300),
                  minScale: 0.1,
                  maxScale: 10.0,
                  onInteractionEnd: (_) {
                    final scale = zoomController.value.getMaxScaleOnAxis();
                    setState(() {
                      isZoomed = scale > 1.0;
                    });
                  },
                  child: GestureDetector(
                    onDoubleTap: () {
                      final scale = zoomController.value.getMaxScaleOnAxis();
                      if (scale > 1.0) {
                        resetZoom();
                      } else {
                        zoomController.value = Matrix4.identity()..scale(2.5);
                        setState(() => isZoomed = true);
                      }
                    },
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 14 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.blue
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
