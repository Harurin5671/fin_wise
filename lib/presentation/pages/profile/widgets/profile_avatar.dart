import 'package:flutter/material.dart';

import 'package:fin_wise/config/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String fallbackAsset;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.fallbackAsset,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return child;
            } else {
              return _buildLoadingContainer();
            }
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildLoadingContainer();
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(fallbackAsset, fit: BoxFit.cover);
          },
        ),
      ),
    );
  }

  Widget _buildLoadingContainer() {
    return Container(
      color: Colors.grey.shade200,
      width: size,
      height: size,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.oceanBlue),
        ),
      ),
    );
  }
}
