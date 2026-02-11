import '../images/app_images.dart';

class ServiceProvider {
  final String id;
  final String name;
  final String profession;
  final String categoryId;
  final String image;
  final double rating;
  final int reviewCount;
  final int experience; // years
  final double pricePerHour;
  final bool isAvailable;
  final List<String> skills;
  final String location;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.profession,
    required this.categoryId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.experience,
    required this.pricePerHour,
    this.isAvailable = true,
    required this.skills,
    required this.location,
  });
}

// Mock Service Providers Data with Local Images
final List<ServiceProvider> mockServiceProviders = [
  // Electricians
  ServiceProvider(
    id: 's1',
    name: 'Rajesh Kumar',
    profession: 'Electrician',
    categoryId: '5',
    image: AppImages.providerRajeshKumar,
    rating: 4.8,
    reviewCount: 156,
    experience: 8,
    pricePerHour: 300,
    skills: ['Wiring', 'AC Repair', 'Fan Installation', 'Switchboard Repair'],
    location: 'Andheri',
  ),
  ServiceProvider(
    id: 's2',
    name: 'Suresh Sharma',
    profession: 'Electrician',
    categoryId: '5',
    image: AppImages.providerSureshSharma,
    rating: 4.5,
    reviewCount: 89,
    experience: 5,
    pricePerHour: 250,
    skills: ['Wiring', 'Light Installation', 'MCB Repair'],
    location: 'Indiranagar',
  ),
  ServiceProvider(
    id: 's3',
    name: 'Amit Verma',
    profession: 'Electrician',
    categoryId: '5',
    image: AppImages.providerAmitVerma,
    rating: 4.7,
    reviewCount: 234,
    experience: 10,
    pricePerHour: 350,
    skills: ['Complete House Wiring', 'AC Repair', 'Inverter Installation'],
    location: 'HSR Layout',
  ),

  // Plumbers
  ServiceProvider(
    id: 's4',
    name: 'Mohammad Ali',
    profession: 'Plumber',
    categoryId: '6',
    image: AppImages.providerMohammadAli,
    rating: 4.6,
    reviewCount: 178,
    experience: 12,
    pricePerHour: 280,
    skills: ['Pipe Fitting', 'Leak Repair', 'Bathroom Fitting', 'Water Tank'],
    location: 'Whitefield',
  ),
  ServiceProvider(
    id: 's5',
    name: 'Ravi Teja',
    profession: 'Plumber',
    categoryId: '6',
    image: AppImages.providerRaviTeja,
    rating: 4.4,
    reviewCount: 67,
    experience: 4,
    pricePerHour: 220,
    skills: ['Tap Repair', 'Pipe Fitting', 'Drain Cleaning'],
    location: 'Electronic City',
  ),

  // Carpenters
  ServiceProvider(
    id: 's6',
    name: 'Venkatesh Rao',
    profession: 'Carpenter',
    categoryId: '7',
    image: AppImages.providerVenkateshRao,
    rating: 4.9,
    reviewCount: 312,
    experience: 15,
    pricePerHour: 400,
    skills: ['Furniture Making', 'Wardrobe', 'Kitchen Cabinet', 'Door Repair'],
    location: 'Jayanagar',
  ),
  ServiceProvider(
    id: 's7',
    name: 'Krishna Murthy',
    profession: 'Carpenter',
    categoryId: '7',
    image: AppImages.providerKrishnaMurthy,
    rating: 4.5,
    reviewCount: 145,
    experience: 7,
    pricePerHour: 320,
    skills: ['Furniture Repair', 'Bed Making', 'Table & Chair'],
    location: 'BTM Layout',
  ),

  // Cleaning
  ServiceProvider(
    id: 's8',
    name: 'Lakshmi Devi',
    profession: 'Cleaning Expert',
    categoryId: '8',
    image: AppImages.providerLakshmiDevi,
    rating: 4.7,
    reviewCount: 456,
    experience: 6,
    pricePerHour: 200,
    skills: [
      'Deep Cleaning',
      'Kitchen Cleaning',
      'Bathroom Cleaning',
      'Sofa Cleaning',
    ],
    location: 'Marathahalli',
  ),
  ServiceProvider(
    id: 's9',
    name: 'Sunita Kumari',
    profession: 'Cleaning Expert',
    categoryId: '8',
    image: AppImages.providerSunitaKumari,
    rating: 4.8,
    reviewCount: 289,
    experience: 8,
    pricePerHour: 250,
    skills: [
      'Full House Cleaning',
      'Office Cleaning',
      'Post-Construction Cleaning',
    ],
    location: 'Bellandur',
  ),
];

List<ServiceProvider> getProvidersByCategory(String categoryId) {
  return mockServiceProviders.where((s) => s.categoryId == categoryId).toList();
}
