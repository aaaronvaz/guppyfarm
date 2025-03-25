import 'package:guppy_farm/Data/fish.dart';

class DData {
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
    Fish(
      name: 'Platinum Red Tail Dumbo Ear',
      imgPath: 'Assets/Fishes/platinum-red-tail-dumbo-ear-f.png',
      type: 'F',
      price: 150,
    ),
    Fish(
      name: 'Platinum Red Tail Dumbo Ear',
      imgPath: 'Assets/Fishes/platinum-red-tail-dumbo-ear-m.png',
      type: 'M',
      fav: true,
      price: 150,
    ),
    Fish(
      name: 'Platinum Mosaic Dumbo Ear',
      imgPath: 'Assets/Fishes/platinum-mosaic-dumbo-ear-m.png',
      type: 'M',
      fav: true,
      price: 150,
    ),
    Fish(
      name: 'Tuxedo Koi High Fin',
      imgPath: 'Assets/Fishes/tuxedo-koi-high-fin.png',
      type: 'M',
      fav: true,
      price: 150,
    ),
    Fish(
      name: 'Santa Claus',
      imgPath: 'Assets/Fishes/santa-claus-m.png',
      type: 'M',
      fav: true,
      price: 150,
    ),
  ];
  List<Fish> get fishList => fishData;
  //List<Fish> get fishList => List.from(list);

  List<Fish> get wishList => fishData.where((fish) => fish.fav).toList();

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
