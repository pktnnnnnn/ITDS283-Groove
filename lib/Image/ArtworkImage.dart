import 'package:flutter/material.dart';

class ArtworkImage extends StatelessWidget {
  final String image;
  const ArtworkImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}
