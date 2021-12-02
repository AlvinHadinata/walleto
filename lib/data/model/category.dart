class Category{
  final String name;
  final String img;

  Category({required this.name, required this.img});

  static List<Category> categories = [
    Category(
        name: 'Makanan',
        img: 'images/food.jpeg'
    ),
    Category(
        name: 'Elektronik',
        img: 'images/electronic.jpg'
    ),
    Category(
        name: 'Kesehatan',
        img: 'images/medic.png'
    ),
    Category(
        name: 'Kendaraan',
        img: 'images/cars.jpg'
    ),
    Category(
        name: 'Lainnya',
        img: 'images/food.jpeg'
    ),
  ];
}
