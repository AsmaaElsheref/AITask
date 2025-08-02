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

**Used in:**
  - lib/screens/mainScreen/widgets/buildProducts/build_products.dart

**Output:** 

**How it was used :**
The output was used to build the products using GridView.builder.

### Prompt 2:
** Create a Firestore service class that reads products from a items collection. Each item has a name, image, and price. Use a ItemModel and return a list of items.

**Used in:**
  - lib/models/itemModel/item_model.dart
  - lib/data/firebaseService/firebase_service.dart

**Output:**  

**How it was used :**
The output was used to create a model class ItemModel and also create a Firestore service class that reads products from a "items" collection. 

### Prompt 3:
** Generate a method to write a new item to Firestore , that item should include a name , image , price

**Used in:**
  - lib/data/firebaseService/firebase_service.dart
 
**Output:** 

**How it was used : 

The output was used to create a method in FirestoreService class named : addItem to write a new item to Firestore.

<p float="left">
  <img src="assets/screenshot.jpg" width="45%" />
</p>
