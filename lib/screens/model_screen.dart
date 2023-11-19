import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelScreen extends StatelessWidget {
  final String model;
  final String name;

  const ModelScreen({super.key, required this.model, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D Product"),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ModelViewer(
        backgroundColor: Colors.blueGrey.shade50,
        src: model,
        loading: Loading.auto,
        alt: name.capitalizeFirst,
        autoPlay: true,
        ar: true,
        arModes: const ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        iosSrc: model,
      ),
    );
  }
}
