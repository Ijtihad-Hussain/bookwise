import 'package:bookwise/contants.dart';
import 'package:bookwise/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'book.dart'; // Replace 'book.dart' with the file that defines your book model

class BookViewScreen extends StatelessWidget {
  final Book book;

  BookViewScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        // title: Text('Book Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            book.coverImageUrl,
            fit: BoxFit.cover,
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  book.author,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleIconButton(
                      icon: Icons.favorite_border,
                      onPressed: () {
                        showConfirmationDialog(context, Icons.favorite, 'Added to favourites', 'Go to favourites');
                      },
                    ),
                    CircleIconButton(
                      icon: Icons.download,
                      onPressed: () {
                        showConfirmationDialog(context, Icons.favorite, 'Added to downloads', 'Go to downloads');
                      },
                    ),
                    CircleIconButton(
                      icon: Icons.share,
                      onPressed: () {
                        showShareDialog(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(kBlue), // Set the background color
                    ),
                    onPressed: () {
                      // Start reading functionality
                    },
                    child: Text('Start Reading'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: kBlue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}

void showConfirmationDialog(BuildContext context, IconData iconData, String text, String btnText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          color: Colors.blueAccent,
          width: 300, // Adjust the width as desired
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(iconData, size: 48),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouritesScreen(favouriteBooks:
                          [
                            Book(
                              title: 'Milk and Honey',
                              author: 'George Orwell',
                              coverImageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
                            ),
                            Book(
                              title: 'How Innovation Works',
                              author: 'Jane Austen',
                              coverImageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
                            ),
                          ]
                          ), // Replace FavoritesScreen with the actual screen you want to navigate to
                        ),
                      );
                    },
                    child: Text(btnText, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Okay'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showShareDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          color: Colors.blueAccent,
          width: 300, // Adjust the width as desired
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Share book',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 36,
                  ),
                  Icon(
                    Icons.insert_chart,
                    size: 36,
                  ),
                  Icon(
                    Icons.twelve_mp,
                    size: 36,
                  ),
                  Icon(
                    Icons.line_style,
                    size: 36,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.mail,
                    size: 36,
                  ),
                  Icon(
                    Icons.drive_file_move,
                    size: 36,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

