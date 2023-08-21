import 'package:action/components/movie_tile.dart';
import 'package:action/components/poster.dart';
import 'package:action/components/poster_tile.dart';
import 'package:action/detail.dart';
import 'package:flutter/material.dart';

var recentSearches = [
  'orange is the new black',
  'mr robot',
  'breaking bad',
];

const recentResultsTapped = [
  {
    "id": 640146,
    "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
    "release_date": "2023-02-15",
    "title": "Ant-Man and the Wasp: Quantumania",
    "vote_average": 6.5,
  },
  {
    "id": 502356,
    "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
    "release_date": "2023-04-05",
    "title": "The Super Mario Bros. Movie",
    "vote_average": 7.5,
  },
  {
    "id": 594767,
    "poster_path": "/2VK4d3mqqTc7LVZLnLPeRiPaJ71.jpg",
    "release_date": "2023-03-15",
    "title": "Shazam! Fury of the Gods",
    "vote_average": 6.8,
  },
  {
    "id": 76600,
    "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
    "release_date": "2022-12-14",
    "title": "Avatar: The Way of Water",
    "vote_average": 7.7,
  },
  {
    "id": 948713,
    "poster_path": "/7yyFEsuaLGTPul5UkHc5BhXnQ0k.jpg",
    "release_date": "2023-04-14",
    "title": "The Last Kingdom: Seven Kings Must Die",
    "vote_average": 7.4,
  },
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBarFocusNode = FocusNode();
  final _searchBarTextController = TextEditingController();
  var _searching = false;

  @override
  void initState() {
    super.initState();
    _searchBarFocusNode.requestFocus();
  }

  void _clearSearchBar() {
    _searchBarTextController.clear();
  }

  void _search() {
    debugPrint(_searchBarTextController.text);

    setState(() {
      _searching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            clipBehavior: Clip.none,
            title: SearchBar(
              focusNode: _searchBarFocusNode,
              controller: _searchBarTextController,
              onSubmitted: (value) {
                _search();
              },
              hintText: 'Search',
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.chevron_left)),
              trailing: [
                if (!_searching)
                  IconButton(
                    onPressed: () {
                      _clearSearchBar();
                    },
                    icon: const Icon(Icons.close),
                  ),
                if (_searching)
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator.adaptive(),
                  )
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          SliverList.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    recentSearches.removeAt(index);
                  });
                },
                key: ValueKey(recentSearches[index]),
                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // align the child to the right
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.delete),
                ),
                child: ListTile(
                  dense: true,
                  title: Text(recentSearches[index]),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        recentSearches.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                  onTap: () {
                    _searchBarTextController.text = recentSearches[index];
                    _search();
                  },
                ),
              );
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 2 / 4,
              ),
              itemBuilder: (context, index) {
                var posterPath =
                    recentResultsTapped[index]['poster_path'] as String;
                var title = recentResultsTapped[index]['title'] as String;
                var year = DateTime.parse(
                        recentResultsTapped[index]['release_date'] as String)
                    .year;

                return MovieTile(
                  posterPath: posterPath,
                  title: title,
                  year: year.toString(),
                  voteAverage:
                      recentResultsTapped[index]['vote_average'].toString(),
                  width: MediaQuery.of(context).size.width / 3 -
                      2 * 4, // see delegate
                  height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                );
              },
              itemCount: recentResultsTapped.length,
            ),
          ),
        ],
      ),
    );
  }
}
