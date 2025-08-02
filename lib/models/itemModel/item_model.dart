// Step 1: Define the ItemModel class with name, image, and price properties.
class ItemModel {
  final String id; // Unique ID for the document
  final String name;
  final String image;
  final double price;

  ItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Factory constructor to create an ItemModel from a Firestore document
  factory ItemModel.fromMap(Map<String, dynamic> data, String id) {
    return ItemModel(
      id: id,
      name: data['name'] as String? ?? 'No Name',
      image: data['image'] as String? ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // Method to convert ItemModel to a map (useful for writing to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
    };
  }
}