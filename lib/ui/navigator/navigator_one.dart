import 'package:flutter_demo/util/import_export_util.dart';

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class NavigatorOne extends StatefulWidget {
  const NavigatorOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigatorOneState();
}

class _NavigatorOneState extends State<NavigatorOne> {
  Book? _selectedBook;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (_selectedBook != null) BookDetailsPage(book: _selectedBook!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({
    required this.book,
  }) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = ResponsiveUtil.isMobile(context)
        ? DeviceType.mobile
        : DeviceType.desktop;

    return Scaffold(
      appBar: AppBarComponent.buildAppbar(
        titleWidget: Text(
          StringConstant.btnNavigator.tr,
          style: deviceType == DeviceType.mobile
              ? white100Medium24TextStyle(context)
              : white100Medium10TextStyle(context),
        ),
      ),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (book != null) ...[
                Text(book.title, style: Theme.of(context).textTheme.headline6),
                Text(book.author, style: Theme.of(context).textTheme.subtitle1),
              ],
            ],
          )),
    );
  }
}
