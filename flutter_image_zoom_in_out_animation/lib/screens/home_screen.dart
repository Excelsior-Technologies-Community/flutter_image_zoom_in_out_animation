import 'package:flutter/material.dart';
import 'package:flutter_image_zoom_in_out_animation/widgets/image_slider_zoom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/img/travel.jpg',
      'assets/img/boat.jpg',
      'assets/img/adventure.jpg',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Image Slider Zoom'), centerTitle: true),
      body: ImageSliderZoom(images: images),
    );
  }
}
