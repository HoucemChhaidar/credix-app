class StoreResponse {
  StoreResponse({
    this.id,
    this.name,
    this.type,
    this.merchantName,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.imageUrl,
  });

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return StoreResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
    );
  }

  int? id;
  String? name;
  String? type;
  String? merchantName;
  String? description;
  String? address;
  double? latitude;
  double? longitude;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['storeType'] = type;
    data['merchantName'] = merchantName;
    data['description'] = description;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
