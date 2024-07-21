import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/destination_provider.dart';
import 'details_screen.dart';
import 'profile_screen.dart'; // Import the ProfileScreen here
import '../widget/search_bar.dart' as custom;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DestinationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore new places'),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              // Navigate to Map Screen (to be implemented)
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          custom.SearchBar(),
          Expanded(
            child: ListView(
              children: [
                // Top Destinations Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Top Destinations',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Container(
                  height: 400,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: provider.recommendedDestinations.length,
                    itemBuilder: (context, index) {
                      final destination =
                          provider.recommendedDestinations[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                _getImageForDestination(destination.name),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                destination.name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // All Destinations Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Destinations',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.destinations.length,
                  itemBuilder: (context, index) {
                    final destination = provider.destinations[index];
                    return ListTile(
                      leading: Image.asset(
                        'assets/images/all.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(destination.name),
                      subtitle: Text(destination.description),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(destination: destination),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getImageForDestination(String destinationName) {
    // Print the destination name for debugging
    print('Fetching image for: $destinationName');

    // Return a unique image based on the destination name
    switch (destinationName) {
      case 'Paris':
        return 'assets/images/paris.jpg';
      case 'New York':
        return 'assets/images/newyork.jpg';
      case 'Nepal':
        return 'assets/images/nepal.jpg';
      default:
        return 'assets/images/default.jpg';
    }
  }
}
