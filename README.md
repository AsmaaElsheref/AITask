## Setup Instructions -->

1. Clone the repository :
   - git clone https://github.com/AsmaaElsheref/AITask.git
2. Install dependencies :
   - flutter pub get
3. Run the app :
   - flutter run

## Populating Demo Data -->

** Run this function :
FirestoreService().addItem(id: itemId, name: itemName, image: itemImageUrl, price: itemPrice);

## ProxyAI Prompts

### Prompt 1:
** Generate a GridView.builder that builds a list of product cards

** Used in:
  - lib/screens/mainScreen/widgets/buildProducts/build_products.dart

**Output:**  
import 'package:flutter/material.dart';
import 'package:ai_task/widgets/product_card.dart'; // Assuming ProductCard is in this path

class ProductGridView extends StatelessWidget {
// Step 1: Define a sample list of product data to populate the GridView.
final List<Map<String, String>> products = const [
{
'imageUrl': 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Product+1',
'productName': 'Delicious Cheese Block',
'productDescription': 'Aged to perfection, rich and creamy.',
'price': 'EGP 120.50',
},
{
'imageUrl': 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Product+2',
'productName': 'Imported Olive Oil Extra Virgin',
'productDescription': 'First cold press, perfect for salads.',
'price': 'EGP 85.00',
},
{
'imageUrl': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Product+3',
'productName': 'Freshly Baked Bread',
'productDescription': 'Crispy crust, soft inside, daily baked.',
'price': 'EGP 15.75',
},
{
'imageUrl': 'https://via.placeholder.com/150/FFFF00/000000?text=Product+4',
'productName': 'Organic Honey Jar',
'productDescription': 'Pure and natural, from local farms.',
'price': 'EGP 60.25',
},
{
'imageUrl': 'https://via.placeholder.com/150/FF00FF/FFFFFF?text=Product+5',
'productName': 'Gourmet Coffee Beans',
'productDescription': 'Medium roast, rich aroma, 250g.',
'price': 'EGP 99.99',
},
{
'imageUrl': 'https://via.placeholder.com/150/00FFFF/000000?text=Product+6',
'productName': 'Artisan Chocolate Bar',
'productDescription': 'Dark chocolate with sea salt, 100g.',
'price': 'EGP 45.99',
},
];

const ProductGridView({super.key});

@override
Widget build(BuildContext context) {
// Step 2 & 3: Create a GridView.builder widget and configure gridDelegate.
return GridView.builder(
padding: const EdgeInsets.all(16.0),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2, // Number of columns
crossAxisSpacing: 16.0, // Spacing between columns
mainAxisSpacing: 16.0, // Spacing between rows
childAspectRatio: 0.7, // Adjust as needed to fit content (width/height)
),
itemCount: products.length,
// Step 4: Use the itemBuilder to construct each ProductCard.
itemBuilder: (context, index) {
final product = products[index];
return ProductCard(
imageUrl: product['imageUrl']!,
productName: product['productName']!,
productDescription: product['productDescription']!,
price: product['price']!,
);
},
);
}
}


### Prompt 2:
** Create a Firestore service class that reads products from a items collection. Each item has a name, image, and price. Use a ItemModel and return a list of items.

** Used in: 
  - lib/models/itemModel/item_model.dart
  - lib/data/firebaseService/firebase_service.dart

**Output:**  
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

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/itemModel/item_model.dart'; // Assuming ItemModel is in this path

// Step 2: Create a FirestoreService class.
class FirestoreService {
final FirebaseFirestore _db = FirebaseFirestore.instance;

// Step 3: Implement a method getItems within FirestoreService that queries the "items" collection,
// converts each document into an ItemModel, and returns a Future<List<ItemModel>>.
Future<List<ItemModel>> getItems() async {
try {
QuerySnapshot snapshot = await _db.collection('items').get();
return snapshot.docs.map((doc) {
return ItemModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
}).toList();
} catch (e) {
// Handle errors, e.g., print to console or throw a custom exception
print('Error getting items: $e');
return []; // Return an empty list on error
}
}

// You might also want a stream for real-time updates
Stream<List<ItemModel>> streamItems() {
return _db.collection('items').snapshots().map((snapshot) {
return snapshot.docs.map((doc) {
return ItemModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
}).toList();
});
}
}

### Prompt 3:
** Generate a methode to write a new item to Firestore , that item should include a name , image , price

** Used in:
  - lib/data/firebaseService/firebase_service.dart
 
**Output:** 

// Step 1, 2, 3, 4: Generate a method to write a new item to Firestore.
Future<void> addItem(String name, String image, double price) async {
try {
await _db.collection('items').add({
'name': name,
'image': image,
'price': price,
'timestamp': FieldValue.serverTimestamp(), // Optional: add a timestamp
});
print('Item added successfully!');
} catch (e) {
print('Error adding item: $e');
rethrow; // Re-throw the error for the calling function to handle
}
}