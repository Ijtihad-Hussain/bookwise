import 'package:bookwise/contants.dart';
import 'package:bookwise/downloads_screen.dart';
import 'package:bookwise/favourite_screen.dart';
import 'package:flutter/material.dart';

import 'book.dart';
import 'bookView_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Book> newReleases;
  final List<String> genres;

  HomeScreen({required this.newReleases, required this.genres});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  List<Book> downloadedBooks = [
    Book(
      title: '1984',
      author: 'George Orwell',
      coverImageUrl: 'https://example.com/1984.jpg',
    ),
    Book(
      title: 'Harry Potter and the Sorcerer\'s Stone',
      author: 'J.K. Rowling',
      coverImageUrl: 'https://example.com/harry-potter.jpg',
    ),
  ];

  List<Book> favouriteBooks = [
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      coverImageUrl:
      'https://example.com/to-kill-a-mockingbird.jpg',
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      coverImageUrl: 'https://example.com/the-great-gatsby.jpg',
    ),
    // Add more favourite books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BookSearchDelegate()); // Show search bar
            },
          ),
        ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Releases',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.newReleases.length,
              itemBuilder: (context, index) {
                final book = widget.newReleases[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Genres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: widget.genres.map((genre) {
              return ElevatedButton(
                onPressed: () {
                  // Implement genre selection logic
                },
                style: ElevatedButton.styleFrom(
                  primary: kBlue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(140, 60),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  elevation: 4.0,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text(genre),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class BookSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results page
    return Center(
      child: Text('Search Results: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions
    return ListView(
      children: [
        ListTile(
          title: Text('Search Suggestion 1'),
          onTap: () {
            query = 'Search Suggestion 1';
            showResults(context);
          },
        ),
        ListTile(
          title: Text('Search Suggestion 2'),
          onTap: () {
            query = 'Search Suggestion 2';
            showResults(context);
          },
        ),
      ],
    );
  }
}
