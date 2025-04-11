// lib/core/widgets/no_internet_widget.dart

import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.wifi_off, size: 80, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("Please check your connection and try again."),
        ],
      ),
    );
  }
}
