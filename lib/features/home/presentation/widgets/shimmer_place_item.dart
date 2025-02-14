import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceItem extends StatelessWidget {
  const ShimmerPlaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: screenWidth * 0.6,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}