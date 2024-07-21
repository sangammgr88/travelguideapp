import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/destination_provider.dart';
import '../models/destination.dart';
import '../models/review.dart';

class DetailsScreen extends StatelessWidget {
  final Destination destination;

  DetailsScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DestinationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
        actions: [
          IconButton(
            icon: Icon(
              provider.favorites.contains(destination)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            onPressed: () {
              provider.toggleFavorite(destination);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/${destination.imageUrl}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                destination.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Reviews',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ...destination.reviews.map((review) => ListTile(
                  title: Text(review.comment),
                  subtitle: Text('Rating: ${review.rating}/5'),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddReviewDialog(destinationId: destination.id),
                  );
                },
                child: Text('Add Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddReviewDialog extends StatefulWidget {
  final String destinationId;

  AddReviewDialog({required this.destinationId});

  @override
  _AddReviewDialogState createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  int _rating = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Review'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Comment'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
            ),
            DropdownButtonFormField<int>(
              value: _rating,
              decoration: InputDecoration(labelText: 'Rating'),
              items: List.generate(5, (index) => index + 1)
                  .map((rating) => DropdownMenuItem(
                        value: rating,
                        child: Text(rating.toString()),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _rating = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final review = Review(
                id: DateTime.now().toString(),
                userId: 'u1', // Replace with actual user ID
                comment: _commentController.text,
                rating: _rating,
              );
              Provider.of<DestinationProvider>(context, listen: false)
                  .addReview(widget.destinationId, review);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
