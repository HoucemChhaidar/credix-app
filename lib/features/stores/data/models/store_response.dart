// file: lib/features/stores/data/models/store_response.dart
class StoreResponse {
  StoreResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.tags,
    required this.type,
    required this.phone,
    required this.rating,
    required this.distance,
  });

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return StoreResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
      type: json['type'] as String,
      phone: json['phone'] as String,
      rating: (json['rating'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
    );
  }

  final String id;
  final String name;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final List<String> tags;
  final String type;
  final String phone;
  final double rating;
  final double distance;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
      'tags': tags,
      'type': type,
      'phone': phone,
      'rating': rating,
      'distance': distance,
    };
  }
}
