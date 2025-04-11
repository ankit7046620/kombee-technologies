import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/curate_controller.dart';

class CurateView extends GetView<CurateController> {
  const CurateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CurateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
