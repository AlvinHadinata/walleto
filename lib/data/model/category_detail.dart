class CategoryDetail{
  final String name;
  // final String title;
  // final String description;
  // final double nominal;
  // final DateTime jangka;

  CategoryDetail({required this.name});

  var categories = [
    CategoryDetail(
        name: 'Makanan',
    ),
    CategoryDetail(
        name: 'Elektronik',
    ),
    CategoryDetail(
        name: 'Kesehatan',
    ),
    CategoryDetail(
        name: 'Kendaraan',
    ),
    CategoryDetail(
        name: 'Lainnya',
    ),
  ];
}