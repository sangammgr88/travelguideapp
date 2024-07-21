// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        color: Colors.pink[200], // Background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1630349607648-1813b1ccd581?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with your profile picture URL
                ),
              ),
              SizedBox(height: 16),
              // User Name
              Text(
                'Sangam Magar', // Replace with dynamic user name
                style: TextStyle(
                  fontSize: 24, // Size for user name
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // User Bio
              Text(
                'Travel enthusiast and explorer. Love discovering new places and cultures.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16, // Size for user bio
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 16),
              // Additional Profile Info
              ListTile(
                leading: Icon(Icons.email),
                title: Text('shot.hai@example.com'), // Replace with dynamic email
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('+977 9722992222'), // Replace with dynamic phone number
              ),
            ],
          ),
        ),
      ),
    );
  }
}
