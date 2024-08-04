import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KanbanShimmer extends StatefulWidget {
  const KanbanShimmer({super.key});

  @override
  State<KanbanShimmer> createState() => _KanbanShimmerState();
}

class _KanbanShimmerState extends State<KanbanShimmer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              width: 250,
              height: 600,
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                children: List.generate(3, (_) => _buildCard()),
              )),
          const SizedBox(
            width: 20,
          ),
          Container(
              width: 250,
              height: 600,
              color: Colors.grey.withOpacity(0.4),
              child: Column(
                children: List.generate(3, (_) => _buildCard()),
              )),
        ],
      ),
    );
  }
}

Widget _buildCard() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 230.0,
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
