import 'package:hive/hive.dart';
import 'package:walleto/shared/theme.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int color;
  @HiveField(2)
  final String icon;

  Category({
    required this.name,
    required this.color,
    required this.icon,
  });

  static Category get electronic {
    return Category(
      name: "Elektronik",
      color: kBlueColor.value,
      icon: "assets/ic_electronic.svg",
    );
  }

  static Category get clothes {
    return Category(
      name: "Pakaian",
      color: kBlueColor.value,
      icon: "assets/ic_clothes.svg",
    );
  }

  static Category get food {
    return Category(
      name: "Makanan",
      color: kBlueColor.value,
      icon: "assets/ic_food.svg",
    );
  }

  static Category get gift {
    return Category(
      name: "Hadiah",
      color: kBlueColor.value,
      icon: "assets/ic_gift.svg",
    );
  }

  static Category get health {
    return Category(
      name: "Kesehatan",
      color: kBlueColor.value,
      icon: "assets/ic_heatlh.svg",
    );
  }

  static Category get building {
    return Category(
      name: "Bangunan",
      color: kBlueColor.value,
      icon: "assets/ic_home.svg",
    );
  }

  static Category get pets {
    return Category(
      name: "Peliharaan",
      color: kBlueColor.value,
      icon: "assets/ic_pets.svg",
    );
  }

  static Category get education {
    return Category(
      name: "Pendidikan",
      color: kBlueColor.value,
      icon: "assets/ic_school.svg",
    );
  }

  static Category get vehicle {
    return Category(
      name: "Kendaraan",
      color: kBlueColor.value,
      icon: "assets/ic_vehicle.svg",
    );
  }

  static Category get vocation {
    return Category(
      name: "Liburan",
      color: kBlueColor.value,
      icon: "assets/ic_vocation.svg",
    );
  }

  static Category get other {
    return Category(
      name: "Lainnya",
      color: kBlueColor.value,
      icon: "assets/ic_other.svg",
    );
  }
}
