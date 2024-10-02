import 'package:dio/dio.dart';
import 'package:test20/model/FoodModel.dart';


Future<List<FoodModel>> getDataOfFood() async {
  Dio request = Dio();

  Response response = await request.get(
    "https://66fc61d7c3a184a84d16ed27.mockapi.io/v1/Food",
  );
  List<FoodModel> foods = [];

  for (var i = 0; i < response.data.length; i++) {
    FoodModel food = FoodModel.fromMap(
      response.data[i],
    );
    foods.add(food);
  }
  return foods;
}