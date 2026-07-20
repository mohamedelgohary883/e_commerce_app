class ProductModel {
  String? id;
  String? productCode;
  String? name;
  String? description;
  String? coverPictureUrl;

  double? price;

  ProductModel({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.coverPictureUrl,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as String?,
    productCode: json['productCode'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    coverPictureUrl: json['coverPictureUrl'] as String?,
    price: json['price'] as double?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'productCode': productCode,
    'name': name,
    'description': description,
    'coverPictureUrl': coverPictureUrl,
    'price': price,
  };
}
