import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelScreen extends StatefulWidget {
  final String maleModel;
  final String femaleModel;
  final String name;

  const ModelScreen({
    super.key,
    required this.maleModel,
    required this.name,
    required this.femaleModel,
  });

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D Product"),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.only(bottom: 10),
            tabs: const [
              Text('Male'),
              Text('Female'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ModelViewer(
                  backgroundColor: Colors.blueGrey.shade50,
                  src: widget.maleModel,
                  loading: Loading.auto,
                  alt: widget.name.capitalizeFirst,
                  autoPlay: true,
                  ar: true,
                  arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                  autoRotate: true,
                  cameraControls: true,
                  iosSrc: widget.maleModel,
                ),
                ModelViewer(
                  backgroundColor: Colors.blueGrey.shade50,
                  src: widget.femaleModel,
                  loading: Loading.auto,
                  alt: widget.name.capitalizeFirst,
                  autoPlay: true,
                  ar: true,
                  arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                  autoRotate: true,
                  cameraControls: true,
                  iosSrc: widget.maleModel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
