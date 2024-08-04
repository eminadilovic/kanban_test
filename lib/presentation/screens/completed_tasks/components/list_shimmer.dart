import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatefulWidget {
  const ListShimmer({super.key});

  @override
  State<ListShimmer> createState() => _ListShimmerState();
}

class _ListShimmerState extends State<ListShimmer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(children: List.generate(4, (_) => _buildCard())),
    );
  }
}

Widget _buildCard() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: SizedBox(
      width: 250.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.black45,
        child: Container(
          width: 150.0,
          height: 100.0,
          color: Colors.white,
        ),
      ),
    ),
  );
}
