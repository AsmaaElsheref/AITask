import 'package:ai_task/core/utils/print/custom_print.dart';
import 'package:ai_task/models/itemModel/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/services/firebaseService/firebase_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final FirestoreService _firestoreService = FirestoreService();

  List<String> categories = [
    "أفضل العروض",
    "مستورد",
    "أجبان قابلة للدهن",
    "أجبان"
  ];

  int? selectedIndex;

  void updateCategoryIndex(int newIndex) {
    selectedIndex = newIndex;
   emit(SelectedCategory());
  }


  /// PRODUCT QUANTITY
  Map<String, int> productQuantities = {};
  // INCREASE QUANTITY
  increaseQuantity(String productId) {
    productQuantities.update(productId, (value) => value + 1, ifAbsent: () => 1);
    emit(ChangeQuantityState());
  }
  // DECREASE QUANTITY
  decreaseQuantity(String productId) {
    if (productQuantities[productId] != null && productQuantities[productId]! >= 1) {
      productQuantities[productId] = productQuantities[productId]! - 1;
      emit(ChangeQuantityState());
    }
  }
  // GET QUANTITY
  int getQuantity(String productId) {
    return productQuantities[productId] ?? 0;
  }


  List<ItemModel> itemModel = [];
  Future<void> getItems() async {
    try {
      emit(GetItemsLoading());
      itemModel = await _firestoreService.getItems();
      emit(GetItemsSuccess());
    } catch (e) {
      emit(GetItemsFailed());
    }
  }

  void seedItems() {
    List<ItemModel> items = [
      ItemModel(
        id: '1',
        name: 'Double Whopper',
        image: 'https://th.bing.com/th/id/R.fc3031efe0b4687f98c3ef64b1ff3f3d?rik=D0iJffHhU26Aug&pid=ImgRaw&r=0',
        price: 29.57,
      ),
      ItemModel(
        id: '2',
        name: 'Steakhouse XL',
        image: 'https://www.burgerking.lt/images/optimized/products/meals-dbl-steakhouse-desktop-33b6e56c00bec346eb7242ce310560a8.png',
        price: 35.65
      ),
      ItemModel(
        id: '3',
        name: 'Chicken Steakhouse',
        image: 'https://tse4.mm.bing.net/th/id/OIP.46ehhgiiND2qZzqHFCGsSAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
        price: 37.39
      ),
      ItemModel(
        id: '4',
        name: 'Steakhouse',
        image: 'https://img.freepik.com/premium-photo/steakhouse-style-porterhouse_1170794-64911.jpg',
        price: 30.43
      ),
      ItemModel(
        id: '5',
        name: 'Quattro Cheese Grill',
        image: 'https://thumbs.dreamstime.com/b/quattro-formaggi-pizza-four-cheeses-cheesy-pizza-slices-dark-background-header-banner-mockup-copy-space-ai-generated-279186057.jpg',
        price: 29.57
      ),
      ItemModel(
        id: '6',
        name: 'Quattro Cheese Chicken',
        image: 'https://th.bing.com/th/id/R.3a4d12b42d644ba5d04de7f7b5ab7235?rik=59TqOpNJZ6Affw&riu=http%3a%2f%2fwww.pxpng.com%2fpublic%2fuploads%2fsmall%2f21629899626omwhdnip6dixzonhy6p5ebvpgs2bituiqefiipevbnexxqxde73cbv3udagvkncepp6uo7viibmuk4vtfcgmmibynnldrfqkomlt.png&ehk=0ZkcV22ZQ7tL5rqn2l%2fV0klc4A6RHgVvv6x%2b4ODbg%2bY%3d&risl=&pid=ImgRaw&r=0',
        price: 29.57
      ),
    ];

    for (var item in items) {
      _firestoreService.addItem(
        id: item.id,
        name: item.name,
        image: item.image,
        price: item.price,
      );
    }
    emit(SeedItems());
  }

  void seedItemsIfEmpty() async {
    await getItems();
    if (itemModel.isEmpty) {
      seedItems();
    }
  }
}