// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// class CameraScreen extends StatefulWidget {
//   final CameraDescription camera;

//   CameraScreen({required this.camera});

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium, // Puedes ajustar la resolución según tus necesidades
//     );
//     _controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return Container(); // Puedes mostrar un indicador de carga aquí
//     }
//     return AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: CameraPreview(_controller),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
