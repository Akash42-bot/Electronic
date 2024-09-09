class ListModel {
  String image;
  String image1;
  String image2;
 String quantity;
  String name;
  String price;
  String originalprice;
  String off;
  String id;

  ListModel({
    required this.image,
    required this.image1,
    required this.image2,
    required this.name,
    required this.price,
    required this.originalprice,
    required this.off,
    required this.id,
    required this.quantity

  });

  /// Convert model to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'image1': image1,
      'image2': image2,
      'name': name,
      'price': price,
      'originalprice': originalprice,
      'off': off,
      'quantity':quantity,
    };
  }

  /// Convert map to model
  factory ListModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ListModel(
      id: documentId,
      image: map['image'] ?? '',
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      originalprice: map['originalprice'] ?? '',
      off: map['off'] ?? '',
      quantity: map['quantity']??'',
    );
  }
}
