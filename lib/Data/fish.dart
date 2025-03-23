class Fish {
  Fish({
    required this.name,
    required this.imgPath,
    required this.type,
    required this.price,
    this.fav = false,
  });

  final String name;
  final String imgPath;
  final String type;
  final double price;
  bool fav;
}
