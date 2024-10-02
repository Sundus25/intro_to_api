class FoodModel {
  String name;
  String description;
  String image;
  String price;
  FoodModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  static fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'],
      description: map['description'],
      image: map['image'],
      price: map['price'],

    );
  }

  toMap() {
    return {"name": name, "description": description, "image": image,"price":price};
  }
}