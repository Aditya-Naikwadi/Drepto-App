
class ProductModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final List<String> images; // Multiple images for slider
  final List<String> features;
  final bool inStock;
  final double rating;
  final int reviewCount;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.images,
    required this.features,
    this.inStock = true,
    this.rating = 4.5,
    this.reviewCount = 0,
  });

  // Sample products
  static List<ProductModel> getSampleProducts() {
    return [
      ProductModel(
        id: '1',
        name: 'Drepto Biodevices Menstro Herb Sheet',
        category: 'Menstrual Care',
        description: 'Natural herbal solution for menstrual comfort and wellness. Made with organic ingredients for gentle and effective relief.',
        price: 299.00,
        images: [
          'assets/images/menstro_1.jpg',
          'assets/images/menstro_2.jpg',
          'assets/images/menstro_3.jpg',
        ],
        features: [
          'Natural herbal ingredients',
          'Provides comfort during menstruation',
          'Safe and gentle formula',
          'Easy to use',
          'Clinically tested',
        ],
        inStock: true,
        rating: 4.7,
        reviewCount: 156,
      ),
      ProductModel(
        id: '2',
        name: 'Drepto Shanti Pain Patch',
        category: 'Pain Relief',
        description: 'Ayurvedic pain relief patch for quick and effective relief from muscle and joint pain. Natural ingredients for lasting comfort.',
        price: 199.00,
        images: [
          'assets/images/shanti_1.jpg',
          'assets/images/shanti_2.jpg',
          'assets/images/shanti_3.jpg',
        ],
        features: [
          'Ayurvedic formulation',
          'Fast-acting pain relief',
          'Long-lasting effect',
          'Easy application',
          'No side effects',
        ],
        inStock: true,
        rating: 4.6,
        reviewCount: 203,
      ),
      ProductModel(
        id: '3',
        name: 'Drepto Suraveda Relief',
        category: 'Anti-inflammatory',
        description: 'Flurbiprofen-based relief for inflammation and pain. Effective solution for various inflammatory conditions.',
        price: 249.00,
        images: [
          'assets/images/suraveda_1.jpg',
          'assets/images/suraveda_2.jpg',
          'assets/images/suraveda_3.jpg',
        ],
        features: [
          'Contains Flurbiprofen',
          'Reduces inflammation',
          'Quick pain relief',
          'Suitable for various conditions',
          'Doctor recommended',
        ],
        inStock: true,
        rating: 4.8,
        reviewCount: 189,
      ),
    ];
  }
}
