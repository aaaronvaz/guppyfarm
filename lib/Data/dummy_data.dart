import 'package:guppy_farm/Data/fish.dart';

class DummyData {
  List<Fish> list = [
    Fish(name: 'White Tuxedo', imgPath: 'Assets/Fishes/wtm.png', type: 'M'),
    Fish(name: 'White Tuxedo', imgPath: 'Assets/Fishes/wtf.png', type: 'F'),
    Fish(name: 'HB Blue', imgPath: 'Assets/Fishes/hbm.png', type: 'M'),
    Fish(name: 'Yello Lace', imgPath: 'Assets/Fishes/ylf.png', type: 'F'),
    Fish(name: 'Albino Red', imgPath: 'Assets/Fishes/arm.png', type: 'M'),
  ];

  get originalList => list;

  List<Fish> get wishList => list.where((fish) => !fish.fav).toList();

  List<Fish> filteredList(String type) {
    return list.where((fish) => fish.type == type).toList();
  }
}
