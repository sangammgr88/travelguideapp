import 'review.dart';

class Destination {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double latitude;
  final double longitude;
  final String travelTips;
  final List<Review> reviews;
  
  Destination({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.travelTips,
    this.reviews = const [],
  });
  
}
