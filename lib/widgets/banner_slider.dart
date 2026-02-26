import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../images/app_images.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<BannerItem> banners = [
    BannerItem(
      title: 'Fresh Groceries',
      subtitle: 'Get 20% off on first order',
      image: AppImages.bannerGrocery,
      gradient: LinearGradient(
        colors: [Colors.black.withValues(alpha: 0.6), Colors.black.withValues(alpha: 0.3)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    BannerItem(
      title: 'Home Services',
      subtitle: 'Expert professionals at your doorstep',
      image: AppImages.bannerServices,
      gradient: LinearGradient(
        colors: [Colors.black.withValues(alpha: 0.6), Colors.black.withValues(alpha: 0.3)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    BannerItem(
      title: 'Fresh Vegetables',
      subtitle: 'Farm fresh veggies delivered daily',
      image: AppImages.bannerVegetables,
      gradient: LinearGradient(
        colors: [Colors.black.withValues(alpha: 0.6), Colors.black.withValues(alpha: 0.3)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        int nextPage = (_currentPage + 1) % banners.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return _buildBannerCard(banners[index]);
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary
                    : AppColors.textLight,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBannerCard(BannerItem banner) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(banner.image, fit: BoxFit.cover),
            // Gradient Overlay
            Container(decoration: BoxDecoration(gradient: banner.gradient)),
            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    banner.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    banner.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerItem {
  final String title;
  final String subtitle;
  final String image;
  final LinearGradient gradient;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.gradient,
  });
}
