import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGovernmentCardItem extends StatelessWidget {
  const ShimmerGovernmentCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),  
      ),
    );
  }
}