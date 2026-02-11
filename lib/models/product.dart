import '../images/app_images.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String image;
  final String categoryId;
  final String unit;
  final double rating;
  final int reviewCount;
  final bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.categoryId,
    required this.unit,
    this.rating = 4.5,
    this.reviewCount = 100,
    this.isAvailable = true,
  });

  double get discount {
    if (originalPrice != null && originalPrice! > price) {
      return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
    }
    return 0;
  }
}

// Mock Products Data with local images
final List<Product> mockProducts = [
  // Grocery Items
  Product(
    id: 'p1',
    name: 'Basmati Rice',
    description:
        'Premium quality long grain basmati rice. Perfect for biryani and pulao.',
    price: 150,
    originalPrice: 180,
    image: AppImages.productRice,
    categoryId: '1',
    unit: '1 kg',
    rating: 4.5,
    reviewCount: 234,
  ),
  Product(
    id: 'p2',
    name: 'Toor Dal',
    description: 'High quality unpolished toor dal. Rich in protein and fiber.',
    price: 120,
    originalPrice: 140,
    image: AppImages.productDal,
    categoryId: '1',
    unit: '1 kg',
    rating: 4.3,
    reviewCount: 156,
  ),
  Product(
    id: 'p3',
    name: 'Whole Wheat Flour',
    description: 'Fresh stone ground whole wheat flour for soft rotis.',
    price: 55,
    image: AppImages.productFlour,
    categoryId: '1',
    unit: '1 kg',
    rating: 4.6,
    reviewCount: 312,
  ),
  Product(
    id: 'p4',
    name: 'Sunflower Oil',
    description: 'Refined sunflower oil. Low cholesterol and heart healthy.',
    price: 180,
    originalPrice: 210,
    image: AppImages.productOil,
    categoryId: '1',
    unit: '1 L',
    rating: 4.4,
    reviewCount: 189,
  ),

  // Vegetables
  Product(
    id: 'v1',
    name: 'Fresh Tomatoes',
    description: 'Farm fresh red tomatoes. Perfect for curries and salads.',
    price: 40,
    image: AppImages.productTomatoes,
    categoryId: '2',
    unit: '500 g',
    rating: 4.2,
    reviewCount: 567,
  ),
  Product(
    id: 'v2',
    name: 'Onions',
    description: 'Fresh Indian onions. Essential for every kitchen.',
    price: 35,
    image: AppImages.productOnions,
    categoryId: '2',
    unit: '1 kg',
    rating: 4.0,
    reviewCount: 890,
  ),
];

List<Product> getProductsByCategory(String categoryId) {
  return mockProducts.where((p) => p.categoryId == categoryId).toList();
}
