import 'package:guppy_farm/Data/fish.dart';

class DummyData {
  List<Fish> fishData = [
    Fish(
      name: 'White Tuxedo',
      imgPath: 'Assets/Fishes/wtm.png',
      type: 'M',
      price: 150,
    ),
    Fish(
      name: 'White Tuxedo',
      imgPath: 'Assets/Fishes/wtf.png',
      type: 'F',
      price: 150,
    ),
    Fish(
      name: 'HB Blue',
      imgPath: 'Assets/Fishes/hbm.png',
      type: 'M',
      price: 150,
    ),
    Fish(
      name: 'Yello Lace',
      imgPath: 'Assets/Fishes/ylf.png',
      type: 'F',
      price: 150,
    ),
    Fish(
      name: 'Albino Red',
      imgPath: 'Assets/Fishes/arm.png',
      type: 'M',

      price: 150,
    ),
  ];

  List<Fish> get fishList => fishData;
  //List<Fish> get fishList => List.from(list);

  List<Fish> get wishList => fishData.where((fish) => !fish.fav).toList();

  List<Fish> filteredList(String type) {
    return fishData.where((fish) => fish.type == type).toList();
  }

  void toggleFavorite(Fish fish) {
    int index = fishData.indexWhere(
      (f) => f.name == fish.name && f.type == fish.type,
    );
    if (index != -1) {
      fishData[index].fav = !fishData[index].fav;
    }
  }
}
