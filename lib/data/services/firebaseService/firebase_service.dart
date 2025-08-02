import 'package:ai_task/core/utils/print/custom_print.dart';
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
      customPrint('Error getting items: $e');
      return []; // Return an empty list on error
    }
  }


  // Step 1, 2, 3, 4: Generate a method to write a new item to Firestore.
  Future<void> addItem({required String id,required String name,required String image,required double price}) async {
    try {
      await _db.collection('items').add({
        'id': id,
        'name': name,
        'image': image,
        'price': price,
      });
      customPrint('Item added successfully!');
    } catch (e) {
      customPrint('Error adding item: $e');
      rethrow; // Re-throw the error for the calling function to handle
    }
  }
}