import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../models/review.dart';

class DestinationProvider with ChangeNotifier {
  List<Destination> _destinations = [
    Destination(
      id: '1',
      name: 'Paris',
      imageUrl: 'paris.jpg',
      description: 'The city of lights.',
      latitude: 48.8566,
      longitude: 2.3522,
      travelTips: 'Best visited in spring.',
      reviews: [
        Review(id: 'r1', userId: 'u1', comment: 'Amazing!', rating: 5),
        Review(id: 'r2', userId: 'u2', comment: 'Lovely place.', rating: 4),
      ],
    ),
    Destination(
      id: '2',
      name: 'New York',
      imageUrl: 'newyork.jpg',
      description: 'The Big Apple.',
      latitude: 40.7128,
      longitude: -74.0060,
      travelTips: 'Enjoy the skyline at night.',
      reviews: [
        Review(id: 'r3', userId: 'u3', comment: 'So vibrant!', rating: 5),
      ],
    ),
    Destination(
      id: '3',
      name: 'Nepal',
      imageUrl: 'nepal.jpg',
      description: 'The Big mountains.',
      latitude: 40.7128,
      longitude: -74.0060,
      travelTips: 'Enjoy the mountains at night.',
      reviews: [
        Review(id: 'r3', userId: 'u3', comment: 'So vibrant!', rating: 5),
      ],
    ),

    //   // ... add other destinations here
  ];

  List<Destination> get destinations => _destinations;

  List<Destination> get recommendedDestinations =>
      _destinations.take(5).toList();

  List<Destination> _favorites = [];
  List<Destination> get favorites => _favorites;

  void toggleFavorite(Destination destination) {
    if (_favorites.contains(destination)) {
      _favorites.remove(destination);
    } else {
      _favorites.add(destination);
    }
    notifyListeners();
  }

  void addReview(String destinationId, Review review) {
    final destination = _destinations.firstWhere((d) => d.id == destinationId);
    destination.reviews.add(review);
    notifyListeners();
  }
}
