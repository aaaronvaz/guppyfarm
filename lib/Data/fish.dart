class Fish {
  Fish({
    required this.name,
    required this.imgPath,
    required this.type,
    this.fav = false,
  });

  final String name;
  final String imgPath;
  final String type;
  bool fav;
}
