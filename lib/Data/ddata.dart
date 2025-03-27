import 'package:guppy_farm/Data/fish.dart';

class DData {
  List<Fish> fishData = [
    Fish(
      name: 'White Tuxedo',
      imgPath:
          'https://i.ytimg.com/vi/jhyHB0L8VFQ/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLBfw929k46EfyhyJkeWtpFkprho1A',
      type: 'M',
      price: 150,
    ),
    Fish(
      name: 'White Tuxedo',
      imgPath:
          'https://i.ytimg.com/vi/zblnVGJxxa8/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLANu2xB9f78m5zTmy0vfIC3kK_MhA',
      type: 'F',
      price: 150,
    ),
    Fish(
      name: 'HB Blue',
      imgPath:
          'https://i.ytimg.com/vi/BTTQPEWWYkQ/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLAGacujcjfMeH4HyQKs4Uf_biiUpw',
      type: 'M',
      price: 150,
    ),
    Fish(
      name: 'Yello Lace',
      imgPath:
          'https://i.ytimg.com/vi/v6fkc1UdvZ4/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLAMWtHWvEgCuaRkk_s-G_Pkc8waVw',
      type: 'F',
      price: 150,
    ),
    Fish(
      name: 'Albino Red',
      imgPath:
          'https://i.ytimg.com/vi/XKwediSWuIE/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCU2CjEYc5iaRAe5GnrHm0LZVbNjQ',
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
      imgPath:
          'https://i.ytimg.com/vi/qXoST2G75xI/hqdefault.jpg?sqp=-oaymwEnCNACELwBSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLD5zawnfcMuiFhw0hv2wsrSuJBT0A',
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
