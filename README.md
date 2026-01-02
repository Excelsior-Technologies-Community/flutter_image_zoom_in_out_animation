# ImageSliderZoomAnimation

A simple and smooth **Image Slider with Zoom In / Zoom Out** feature built using Flutter.
This project demonstrates a **professional gallery-like experience** with pinch zoom, double tap zoom,
page sliding, and indicator dots.

---
## ✨ Features

✔ Horizontal image slider (PageView)  
✔ Pinch to **Zoom In & Zoom Out**  
✔ Unlimited-feel smooth zoom  
✔ Double tap to zoom / reset  
✔ Page swipe disabled while zoomed  
✔ Zoom reset on page change  
✔ Indicator dots (active image highlight)  
✔ Clean & reusable widget structure  

---
## ✨ Preview
![screen-20260102-154047~2](https://github.com/user-attachments/assets/645e3bec-f038-420d-8c2f-a46d328c8cc3)


---
## 📸 Preview Behavior

- **Pinch open** → Image zooms in  
- **Pinch close** → Image zooms out  
- **Double tap** → Quick zoom / reset  
- **Swipe left/right** → Change image  
- **Zoomed image** → Page swipe locked  

---
## Visual Features
- Animated page indicators
- Current zoom level display
- Gesture instructions overlay
- Smooth zoom animations
- Customizable colors and styling
---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_image_zoom_in_out_animation:
    path: ../flutter_image_zoom_in_out_animation  # For local development
```
from git:
```
dependencies:
  flutter_image_zoom_in_out_animation:
    git:
      url: https://github.com/yourusername/flutter_image_zoom_in_out_animation.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---
## 🏗️ Project Structure
```
lib/
├── main.dart
├── widgets/
│   └── image_sliding_zoom.dart
└── screens/
    └── example_screen.dart

assets/
└── images/
    ├── image1.jpg
    ├── image2.jpg
    └── image3.jpg

```
---
## 🎯 Quick Start
##### 1. Basic Usage
```
import 'package:flutter/material.dart';
import 'widgets/image_sliding_zoom.dart';

class MyHomePage extends StatelessWidget {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body: ImageSliderZoom(
        images: images,
        height: 400,
      ),
    );
  }
}
```
##### 2. Advanced Usage
```
ImageSliderZoom(
  images: imageList,
  height: 500,
  width: double.infinity,
  fit: BoxFit.contain,
  minScale: 0.05,      // Zoom out to 5% of original
  maxScale: 20.0,      // Zoom in to 2000% of original
  enableZoomControls: true,
  enableAutoSlide: true,
  autoSlideInterval: Duration(seconds: 5),
  showIndicators: true,
  indicatorActiveColor: Colors.blue,
  indicatorInactiveColor: Colors.grey,
  onImageTap: () {
    print('Image tapped!');
  },
  onZoomStart: () {
    print('Zoom started');
  },
  onZoomEnd: () {
    print('Zoom ended');
  },
)
```
## 📖 Complete Example
```
import 'package:flutter/material.dart';
import 'widgets/image_sliding_zoom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Slider Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FullDemoScreen(),
    );
  }
}

class FullDemoScreen extends StatelessWidget {
  final List<String> localImages = [
    'assets/images/photo1.jpg',
    'assets/images/photo2.jpg',
    'assets/images/photo3.jpg',
  ];

  final List<String> networkImages = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider Zoom Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Gesture Guide'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildGuideItem('Pinch', 'Zoom in/out freely'),
                      _buildGuideItem('Double Tap', 'Toggle 2.5x zoom/reset'),
                      _buildGuideItem('Long Press', 'Quick 3x zoom'),
                      _buildGuideItem('Swipe', 'Change image (when not zoomed)'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Example 1: Basic Slider
          _buildExampleSection(
            title: 'Basic Image Slider',
            description: 'Simple implementation with auto-slide',
            child: ImageSliderZoom(
              images: localImages,
              height: 300,
            ),
          ),
          
          // Example 2: Network Images
          _buildExampleSection(
            title: 'Network Images',
            description: 'Loading images from URLs',
            child: ImageSliderZoom(
              images: networkImages,
              height: 350,
              enableZoomControls: true,
            ),
          ),
          
          // Example 3: Custom Configuration
          _buildExampleSection(
            title: 'Custom Configuration',
            description: 'Extended zoom range with custom styling',
            child: ImageSliderZoom(
              images: localImages,
              height: 400,
              minScale: 0.02,
              maxScale: 15.0,
              indicatorActiveColor: Colors.red,
              autoSlideInterval: Duration(seconds: 3),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildExampleSection({required String title, required String description, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(description, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 12),
          child,
          SizedBox(height: 24),
        ],
      ),
    );
  }
  
  Widget _buildGuideItem(String gesture, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(gesture, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(width: 12),
          Text(action),
        ],
      ),
    );
  }
}
```
---
## 🎨 Theming
#### Custom Colors
```
ImageSliderZoom(
  images: images,
  height: 300,
  indicatorActiveColor: Colors.redAccent,
  indicatorInactiveColor: Colors.grey[300]!,
)
```
#### Custom Zoom Range
```
ImageSliderZoom(
  images: images,
  height: 300,
  minScale: 0.02,   // Can zoom out to 2% of original size
  maxScale: 25.0,   // Can zoom in to 2500% of original size
)
```
## 🔧 Advanced Features
#### 1. Handling Network Images

The widget automatically handles both local and network images:
```
ImageSliderZoom(
  images: [
    'assets/local_image.jpg',           // Local asset
    'https://example.com/network.jpg',  // Network image
  ],
  height: 300,
)
```
---
## 2. Pausing Auto-Slide
Auto-slide automatically pauses when:

- User zooms into an image
- User interacts with the slider
- User manually changes pages

## 3. Zoom State Management
The widget manages zoom state automatically:

- Zoom resets when changing images
- Prevents sliding while zoomed
- Maintains zoom position during interactions

---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
