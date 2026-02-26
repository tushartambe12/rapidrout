import 'package:flutter/material.dart';
import '../images/app_images.dart';

class Category {
  final String id;
  final String name;
  final String icon;
  final String image;
  final Color color;
  final String type; // 'product' or 'service'

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.image,
    required this.color,
    required this.type,
  });
}

// Mock Categories Data with Local Images
final List<Category> mockCategories = [
  Category(
    id: '1',
    name: 'Grocery',
    icon: '🛒',
    image: AppImages.categoryGrocery,
    color: const Color(0xFF66BB6A),
    type: 'product',
  ),
  Category(
    id: '2',
    name: 'Vegetables',
    icon: '🥬',
    image: AppImages.categoryVegetables,
    color: const Color(0xFF43A047),
    type: 'product',
  ),
  Category(
    id: '3',
    name: 'Fruits',
    icon: '🍎',
    image: AppImages.categoryFruits,
    color: const Color(0xFFFFB74D),
    type: 'product',
  ),
  Category(
    id: '5',
    name: 'Electrician',
    icon: '⚡',
    image: AppImages.categoryElectrician,
    color: const Color(0xFFFFCA28),
    type: 'service',
  ),
  Category(
    id: '6',
    name: 'Plumber',
    icon: '🔧',
    image: AppImages.categoryPlumber,
    color: const Color(0xFF29B6F6),
    type: 'service',
  ),
  Category(
    id: '7',
    name: 'Carpenter',
    icon: '🪚',
    image: AppImages.categoryCarpenter,
    color: const Color(0xFF8D6E63),
    type: 'service',
  ),
  Category(
    id: '8',
    name: 'Cleaning',
    icon: '🧹',
    image: AppImages.categoryCleaning,
    color: const Color(0xFF26C6DA),
    type: 'service',
  ),
];

List<Category> get productCategories =>
    mockCategories.where((c) => c.type == 'product').toList();

List<Category> get serviceCategories =>
    mockCategories.where((c) => c.type == 'service').toList();
