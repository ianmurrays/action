import 'package:action/components/movie_tile.dart';
import 'package:action/search.dart';
import 'package:flutter/material.dart';
import 'package:action/components/blurred_app_bar.dart';
import 'package:action/detail.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const tmdbPopular = {
  "page": 1,
  "results": [
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
    {
      "id": 677179,
      "poster_path": "/cvsXj3I9Q2iyyIo95AecSd1tad7.jpg",
      "release_date": "2023-03-01",
      "title": "Creed III",
      "vote_average": 7.3,
    },
    {
      "id": 713704,
      "poster_path": "/mIBCtPvKZQlxubxKMeViO2UrP3q.jpg",
      "release_date": "2023-04-12",
      "title": "Evil Dead Rise",
      "vote_average": 6.9,
    },
    {
      "id": 638974,
      "poster_path": "/s1VzVhXlqsevi8zeCMG9A16nEUf.jpg",
      "release_date": "2023-03-28",
      "title": "Murder Mystery 2",
      "vote_average": 6.6,
    },
    {
      "id": 315162,
      "poster_path": "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
      "release_date": "2022-12-07",
      "title": "Puss in Boots: The Last Wish",
      "vote_average": 8.3,
    },
    {
      "id": 603692,
      "poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
      "release_date": "2023-03-22",
      "title": "John Wick: Chapter 4",
      "vote_average": 8,
    },
    {
      "id": 1048300,
      "poster_path": "/qVzRt8c2v4gGBYsnaflXVVeQ9Lh.jpg",
      "release_date": "2022-12-15",
      "title": "Adrenaline",
      "vote_average": 4,
    },
    {
      "id": 804150,
      "poster_path": "/gOnmaxHo0412UVr1QM5Nekv1xPi.jpg",
      "release_date": "2023-02-22",
      "title": "Cocaine Bear",
      "vote_average": 6.4,
    },
    {
      "id": 1008005,
      "poster_path": "/sP6AO11a7jWgsmT9T8j9EGIWAaZ.jpg",
      "release_date": "2023-02-10",
      "title": "The Communion Girl",
      "vote_average": 6.3,
    },
    {
      "id": 700391,
      "poster_path": "/rzRb63TldOKdKydCvWJM8B6EkPM.jpg",
      "release_date": "2023-03-02",
      "title": "65",
      "vote_average": 6.3,
    },
    {
      "id": 946310,
      "original_title":
          "De Piraten van Hiernaast II: De Ninja's van de Overkant",
      "poster_path": "/uDsvma9dAwnDPVuCFi99YpWvBk0.jpg",
      "release_date": "2022-04-20",
      "title": "Pirates Down the Street II: The Ninjas from Across",
      "vote_average": 6.2,
    },
    {
      "id": 1104040,
      "poster_path": "/nGwFsB6EXUCr21wzPgtP5juZPSv.jpg",
      "release_date": "2023-04-07",
      "title": "Gangs of Lagos",
      "vote_average": 5.6,
    },
    {
      "id": 758323,
      "poster_path": "/9JBEPLTPSm0d1mbEcLxULjJq9Eh.jpg",
      "release_date": "2023-04-05",
      "title": "The Pope's Exorcist",
      "vote_average": 6.5,
    },
    {
      "id": 842945,
      "poster_path": "/gbGHezV6yrhua0KfAgwrknSOiIY.jpg",
      "release_date": "2023-03-17",
      "title": "Supercell",
      "vote_average": 6.4,
    },
    {
      "id": 849869,
      "poster_path": "/taYgn3RRpCGlTGdaGQvnSIOzXFy.jpg",
      "release_date": "2023-02-17",
      "title": "Kill Boksoon",
      "vote_average": 6.8,
    },
    {
      "id": 1033219,
      "poster_path": "/qNz4l8UgTkD8rlqiKZ556pCJ9iO.jpg",
      "release_date": "2022-09-30",
      "title": "Attack on Titan",
      "vote_average": 6.1,
    }
  ],
  "total_pages": 38020,
  "total_results": 760385
};

class _HomeState extends State<Home> {
  List<Widget> buildSection(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text("Trending Movies",
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      SizedBox(
        height: 295,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          itemCount: (tmdbPopular['results'] as List).length,
          itemBuilder: (context, index) {
            var results = tmdbPopular['results'] as List;
            var posterPath = results[index]['poster_path'];
            var title = results[index]['title'];
            var year = DateTime.parse(results[index]['release_date']).year;

            return MovieTile(
                posterPath: posterPath,
                title: title,
                year: year.toString(),
                voteAverage: results[index]['vote_average'] as double,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ),
                  );
                });
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
          icon: const Icon(Icons.search),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
        child: const Icon(Icons.search),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100, top: 110),
        children: [
          ...buildSection(context),
          ...buildSection(context),
          ...buildSection(context),
          ...buildSection(context),
        ],
      ),
    );
  }
}
