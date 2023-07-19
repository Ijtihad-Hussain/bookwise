import 'package:bookwise/bookView_screen.dart';
import 'package:bookwise/contants.dart';
import 'package:bookwise/favourite_screen.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class DownloadsScreen extends StatelessWidget {
  final List<Book> downloadedBooks;

  DownloadsScreen({required this.downloadedBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        title: Center(child: Text('My Downloads')),
      ),
      drawer: Drawer(
        backgroundColor: kBlue,
        child: ListView(
          children: [
            SizedBox(height: 60,),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books, color: Colors.white),
              title: Text(
                'Readings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Implement navigation to Readings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.white),
              title: Text(
                'Favorites',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
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
            ),
            ListTile(
              leading: Icon(Icons.download, color: Colors.white),
              title: Text(
                'Downloads',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DownloadsScreen(downloadedBooks:
                    [
                      Book(
                        title: 'The psychology of money',
                        author: 'Morgan Housel',
                        coverImageUrl:
                        'https://images.unsplash.com/photo-1592496431122-2349e0fbc666?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
                      ),
                      Book(
                        title: 'Milk and Honey',
                        author: 'George Orwell',
                        coverImageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ym9vayUyMGNvdmVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60',
                      ),
                    ]
                    ), // Replace FavoritesScreen with the actual screen you want to navigate to
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: downloadedBooks.length,
        itemBuilder: (context, index) {
          final book = downloadedBooks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookViewScreen(book: book),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    book.coverImageUrl,
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 4),
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
