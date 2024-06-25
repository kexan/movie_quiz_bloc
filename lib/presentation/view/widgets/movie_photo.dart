import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePhoto extends StatelessWidget {
  final VoidCallback onTap;
  final String urlPreview;
  final double height;

  const MoviePhoto({
    super.key,
    required this.urlPreview,
    required this.onTap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: urlPreview,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
