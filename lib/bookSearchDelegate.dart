// import 'package:flutter/material.dart';
//
// class BookSearchDelegate extends SearchDelegate<Book> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // Implement the search results view based on the query
//     // This is where you display the books that match the search query
//     Implementing the search results view depends on how you have your book
//     data structured and where you are fetching it from.Assuming you have a
//     list of
//     `Book` objects, you can filter the list based on the search query and display the matching results.
//
//     Here's an example implementation of the `buildResults` method in the `BookSearchDelegate`:
//
//     ```dart
//     @override
//     Widget buildResults(BuildContext context) {
//     final List<Book> searchResults = newReleases.where((book) {
//     final titleLower = book.title.toLowerCase();
//     final authorLower = book.author.toLowerCase();
//     final queryLower = query.toLowerCase();
//     return titleLower.contains(queryLower) || authorLower.contains(queryLower);
//     }).toList();
//
//     return ListView.builder(
//     itemCount: searchResults.length,
//     itemBuilder: (context, index) {
//     final book = searchResults[index];
//     return ListTile(
//     leading: Image.network(book.coverImageUrl),
//     title: Text(book.title),
//     subtitle: Text(book.author),
//     onTap: () {
//     Navigator.push(
//     context,
//     MaterialPageRoute(
//     builder: (context) => BookViewScreen(book: book),
//     ),
//     );
//     },
//     );
//     },
//     );
//     }
//   }
// }
