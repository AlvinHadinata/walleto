// import 'package:flutter/material.dart';
//
// class DatabaseProvider extends ChangeNotifier {
//   final DatabaseHelper databaseHelper;
//
//   DatabaseProvider({required this.databaseHelper});
//
//   ResultState _state = ResultState.NoData;
//
//   ResultState get state => _state;
//
//   String _message = 'No Favorite Restaurant :(';
//
//   String get message => _message;
//
//   List<RestaurantList> _favorites = [];
//
//   List<RestaurantList> get favorites => _favorites;
//
//   void _getFavorites() async {
//     _favorites = await databaseHelper.getFavorites();
//     if (_favorites.isNotEmpty) {
//       _state = ResultState.HasData;
//     } else {
//       _state = ResultState.NoData;
//       _message = 'No Favorite Restaurant :(';
//     }
//     notifyListeners();
//   }
//
//   void addFavorite(RestaurantList restaurant) async {
//     try {
//       await databaseHelper.insertFavorite(restaurant);
//       _getFavorites();
//     } catch (e) {
//       _state = ResultState.Error;
//       _message = 'Failed to add favorite';
//       notifyListeners();
//     }
//   }
//
//   void removeFavorite(String id) async {
//     try {
//       await databaseHelper.removeFavorite(id);
//       _getFavorites();
//     } catch (e) {
//       _state = ResultState.Error;
//       _message = 'Failed to remove favorite';
//       notifyListeners();
//     }
//   }
//
//   Future<bool> isFavorited(String id) async {
//     final favoritedRestaurant = await databaseHelper.getFavoriteById(id);
//     return favoritedRestaurant.isNotEmpty;
//   }
// }