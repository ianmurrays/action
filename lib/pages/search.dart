import 'package:action/components/movie_tile.dart';
import 'package:action/components/poster_tile.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

var recentSearches = [
  'tom',
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

const searchResults = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/9TXcHOeCsM8W3ZKKIKjdYUsRSeq.jpg",
      "id": 72879,
      "name": "Tomorrow is Ours",
      "original_language": "fr",
      "original_name": "Demain nous appartient",
      "overview":
          "The story revolves around the people of Sète, France. Their lives are punctuated by family rivalries, romance and scenes from daily life, but also by plots involving police investigations, secrets and betrayals.",
      "poster_path": "/3uU5uJzOX7xe7mn7YKpBM9oiEZO.jpg",
      "media_type": "tv",
      "genre_ids": [80, 18],
      "popularity": 1342.314,
      "first_air_date": "2017-07-17",
      "vote_average": 6.759,
      "vote_count": 29,
      "origin_country": ["FR"]
    },
    {
      "adult": false,
      "backdrop_path": "/nNqDMNqQm2LmTYey1nHRYCfZl71.jpg",
      "id": 892511,
      "title": "Little Man Tom",
      "original_language": "fr",
      "original_title": "Tom",
      "overview":
          "Tom, 11 years old, lives in a trailer home on the edge of the woods with Joss, his young mother. The two of them support each other and show unwavering optimism. While Joss is away working small jobs, Tom keeps himself occu- pied. One day, a young man fresh out of prison breaks into their home and their lives, and disrupts the equilibrium.",
      "poster_path": "/fjwpgYPr5Wurw7H3heNWwiTYC6Q.jpg",
      "media_type": "movie",
      "genre_ids": [18],
      "popularity": 0.979,
      "release_date": "2022-05-11",
      "video": false,
      "vote_average": 5.4,
      "vote_count": 7
    },
    {
      "adult": false,
      "backdrop_path": "/ptNJ19m5UraZNOeJqKKIVKKCAyQ.jpg",
      "id": 96129,
      "title": "The Bad Bunch",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "A white ex-GI goes to a black ghetto to deliver a letter from his buddy, a black soldier who died in Vietnam. When he arrives there he encounters hostility and trouble from all sides.",
      "poster_path": "/zNZ2xf86X6lEgbssTX5EI90yURZ.jpg",
      "media_type": "movie",
      "genre_ids": [18],
      "popularity": 1.501,
      "release_date": "1973-10-01",
      "video": false,
      "vote_average": 6.5,
      "vote_count": 2
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 121063,
      "name": "Tom",
      "original_language": "es",
      "original_name": "Tom",
      "overview": "",
      "poster_path": null,
      "media_type": "tv",
      "genre_ids": [16],
      "popularity": 2.278,
      "first_air_date": "2004-04-28",
      "vote_average": 2,
      "vote_count": 1,
      "origin_country": ["ES"]
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 1019542,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "A small town with secrets is terrorized by a demonic entity. As madness reigns questions are answered.",
      "poster_path": "/8mYfGeHFDXO3dosBhJZtrdtYmip.jpg",
      "media_type": "movie",
      "genre_ids": [27],
      "popularity": 0.916,
      "release_date": "2022-02-02",
      "video": false,
      "vote_average": 3,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 9962,
      "name": "Tom",
      "original_language": "en",
      "original_name": "Tom",
      "overview":
          "Tom is an American sitcom which premiered in mid-season 1994 on CBS. Tom was cancelled after eleven episodes.",
      "poster_path": null,
      "media_type": "tv",
      "genre_ids": [35],
      "popularity": 2.744,
      "first_air_date": "1994-03-02",
      "vote_average": 0,
      "vote_count": 0,
      "origin_country": ["US"]
    },
    {
      "adult": false,
      "id": 2934595,
      "name": "Tom",
      "original_name": "Tom",
      "media_type": "person",
      "popularity": 0.6,
      "gender": 0,
      "known_for_department": "Art",
      "profile_path": null,
      "known_for": [
        {
          "adult": false,
          "backdrop_path": "/j9fRIimor0AMFJR9kjZubXcABzZ.jpg",
          "id": 94664,
          "name": "Mushoku Tensei: Jobless Reincarnation",
          "original_language": "ja",
          "original_name": "無職転生 ～異世界行ったら本気だす～",
          "overview":
              "A 34-year-old hikikomori is kicked out of his home by his family after the death of his parents. After his eviction, he saves a group of teenagers from being killed by a speeding truck, but loses his life in the process. When he comes to, he realizes he has been reborn as Rudeus Greyrat, in a world of swords and sorcery.",
          "poster_path": "/z4rvmhoqQiGMnwuBHY1QcH3OqUo.jpg",
          "media_type": "tv",
          "genre_ids": [16, 10759, 10765],
          "popularity": 458.101,
          "first_air_date": "2021-01-11",
          "vote_average": 8.556,
          "vote_count": 726,
          "origin_country": ["JP"]
        },
        {
          "adult": false,
          "backdrop_path": "/7B4PGxWt9NrcFCEAegLSEuSyAeS.jpg",
          "id": 78102,
          "name": "Steins;Gate 0",
          "original_language": "ja",
          "original_name": "シュタインズ・ゲート ゼロ",
          "overview":
              "The dark untold story of Steins;Gate that leads with the eccentric mad scientist Okabe, struggling to recover from a failed attempt at rescuing Kurisu. He decides to give up and abandons his lively scientist alter ego, in pursuit to forget the past. When all seems to be normal, he is seemingly pulled back into the past by meeting an acquaintance of Kurisu, who tells him that they have begun testing a device that stores the memory of a human and creates a simulation of them with their characteristics and personalities. Okabe begins testing and finds out that the simulation of Kurisu has brought back anguish and some new unexpected tragedies.\n\nZero is a side story that explores events from the Beta Attractor Field's future that contribute in making the end of the original story possible.",
          "poster_path": "/lmx0rW83DCh60ARiZqM6DY2XJhB.jpg",
          "media_type": "tv",
          "genre_ids": [10765, 16],
          "popularity": 77.579,
          "first_air_date": "2018-04-12",
          "vote_average": 8.1,
          "vote_count": 177,
          "origin_country": ["JP"]
        }
      ]
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 148299,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "Portrait of gay filmmaker and Parkinson's sufferer Tom Chomont.",
      "poster_path": null,
      "media_type": "movie",
      "genre_ids": [99],
      "popularity": 0.6,
      "release_date": "2002-05-07",
      "video": false,
      "vote_average": 10,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": "/hdKGOn4lTasuYM6cA4AAOpsc1ER.jpg",
      "id": 221151,
      "name": "A Thousand Tomorrows",
      "original_language": "en",
      "original_name": "A Thousand Tomorrows",
      "overview":
          "\"A Thousand Tomorrows\" tells the story of bull rider Cody Gunner and the great price he would pay for a handful of seasons, a mere thousand tomorrows, with the one he loves more than life.",
      "poster_path": "/AbJXDjWk4YMZ08RS4avjRilsQ1d.jpg",
      "media_type": "tv",
      "genre_ids": [18, 10751, 37],
      "popularity": 4.525,
      "first_air_date": "2023-02-24",
      "vote_average": 5,
      "vote_count": 1,
      "origin_country": ["US"]
    },
    {
      "adult": false,
      "backdrop_path": "/jetHCwCGqNt3e7jYVUwtjgcCyDn.jpg",
      "id": 389538,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "Tom Ballard lives with his father James in a campsite in the Dolomites. Tom's mother, Alison Hargreaves died descending K2 when he was just 6 years old. Despite this, he never wanted to be anywhere other than in the mountains. His whole life is dedicated to climbing and his last goal is to solo the Six North Faces of the Alps in a single winter season. Nobody has achieved this before, and he wants to be the first. In a white van driven by James, Tom will travel through the Alps to make his dream come true.",
      "poster_path": "/ahofH2q9gBjgGA5MRTl8c4AY05A.jpg",
      "media_type": "movie",
      "genre_ids": [12, 99],
      "popularity": 0.6,
      "release_date": "2015-03-25",
      "video": false,
      "vote_average": 10,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 377750,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "An astronaut encounters a major problem upon returning to earth after a long space voyage.",
      "poster_path": null,
      "media_type": "movie",
      "genre_ids": [],
      "popularity": 0.6,
      "release_date": "2016-01-14",
      "video": false,
      "vote_average": 6,
      "vote_count": 1
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 542616,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "Thomas is trapped inside a fabricated reality he can’t be sure is real.",
      "poster_path": "/1B999CvAKUgKFR52QGxmzhfzEzO.jpg",
      "media_type": "movie",
      "genre_ids": [16],
      "popularity": 0.6,
      "release_date": "2019-07-14",
      "video": false,
      "vote_average": 6.2,
      "vote_count": 2
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 1039672,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "Experimental horror film studying a 'Peeping Tom\" as he gathers footage and reviews his findings amidst a storm of psychedelic visuals.",
      "poster_path": "/3Y8qLbJLKslH7v1dLE6UpEHIwuV.jpg",
      "media_type": "movie",
      "genre_ids": [27],
      "popularity": 0.6,
      "release_date": "2017-08-12",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 832779,
      "title": "Tom",
      "original_language": "fr",
      "original_title": "Tom",
      "overview":
          "A young woman (Lola Creton/Bastards), is grieving the death of her brother, challenged by the tribulation of her mind. The tragedy has unmoored her. A recurrent dream will bring her to a new understanding of reality.",
      "poster_path": "/28N4KpCIEh1ZtZn6iyuj2y5ZanP.jpg",
      "media_type": "movie",
      "genre_ids": [],
      "popularity": 0.6,
      "release_date": "",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 831873,
      "title": "Tom",
      "original_language": "en",
      "original_title": "Tom",
      "overview":
          "An astronaut spends his days at the International Space Station waiting for a return.",
      "poster_path": "/6Bmz0jmbXLcve7VCaZa5BjsVIyq.jpg",
      "media_type": "movie",
      "genre_ids": [16],
      "popularity": 0.6,
      "release_date": "2021-07-21",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "backdrop_path": null,
      "id": 331016,
      "title": "Tom",
      "original_language": "el",
      "original_title": "Tom",
      "overview": "A film with a thematic self-awareness .",
      "poster_path": "/nHM3HuxTZAegxn3CzjghLDuod62.jpg",
      "media_type": "movie",
      "genre_ids": [18],
      "popularity": 0.6,
      "release_date": "2014-09-26",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
    {
      "adult": false,
      "id": 2584722,
      "name": "Tom",
      "original_name": "Tom",
      "media_type": "person",
      "popularity": 0.6,
      "gender": 0,
      "known_for_department": "Acting",
      "profile_path": null,
      "known_for": [
        {
          "adult": false,
          "backdrop_path": "/keOnyGyEIxspH40EDxzPP4fxdS1.jpg",
          "id": 47037,
          "title": "Particularly Now, in Spring",
          "original_language": "en",
          "original_title": "Particularly Now, in Spring",
          "overview":
              "It's sports day and a seventeen-year-old boy prepares to compete, as he has many times before.  Only this time it's different, his childhood is behind him, different feelings, emotions and desires engulf him as he watches his classmates.  His life is about to change.",
          "poster_path": "/vkBBRcpGNNkjiO23bjJxQ9spuqT.jpg",
          "media_type": "movie",
          "genre_ids": [],
          "popularity": 1.4,
          "release_date": "1996-03-02",
          "video": false,
          "vote_average": 6,
          "vote_count": 5
        }
      ]
    },
    {
      "adult": false,
      "id": 3197404,
      "name": "Tom",
      "original_name": "Tom",
      "media_type": "person",
      "popularity": 0.6,
      "gender": 0,
      "known_for_department": "Acting",
      "profile_path": null,
      "known_for": [
        {
          "adult": true,
          "backdrop_path": null,
          "id": 861225,
          "title": "Pound Me Harder",
          "original_language": "en",
          "original_title": "Pound Me Harder",
          "overview":
              "Most guys that are into Asian boys dream of traveling to Thailand and experiencing the exotic pleasures its young males have to offer. Well, if you haven't bought your ticket yet, this collection will have you booking the next flight out. Filmed on location, in Thailand, these hardcore bareback scenes give you a good taste of what sex with a Thai boy is like. From anal toys to bondage and everything else in between, these Asian twinks show you how they like to have sex. It's the next best thing to feeling the silky smooth skin of a naked Asian boy pressed up against you in bed.",
          "poster_path": "/b8eUYcowwOM8OAtSIIq2Ny3R9UL.jpg",
          "media_type": "movie",
          "genre_ids": [],
          "popularity": 0.6,
          "release_date": "2019-04-26",
          "video": false,
          "vote_average": 0,
          "vote_count": 0
        }
      ]
    },
    {
      "adult": false,
      "id": 3648260,
      "name": "Tom",
      "original_name": "Tom",
      "media_type": "person",
      "popularity": 0.6,
      "gender": 0,
      "known_for_department": "Acting",
      "profile_path": null,
      "known_for": [
        {
          "adult": false,
          "backdrop_path": null,
          "id": 1007984,
          "title": "Redheaded Vengeance: The Life and Death of Pigtails",
          "original_language": "en",
          "original_title":
              "Redheaded Vengeance: The Life and Death of Pigtails",
          "overview":
              "Redheaded Vengeance: The Life and Death of Pigtails was shot on VHS between Fall 1996 and Summer 1999 (in and around Columbus, Ohio). Final editing was completed in 2022.",
          "poster_path": "/rwWq4bjAfCefhhPSRNJLVWg1rji.jpg",
          "media_type": "movie",
          "genre_ids": [27],
          "popularity": 0.6,
          "release_date": "",
          "video": false,
          "vote_average": 10,
          "vote_count": 1
        }
      ]
    },
    {
      "adult": false,
      "id": 2030028,
      "name": "Tom",
      "original_name": "Tom",
      "media_type": "person",
      "popularity": 0.6,
      "gender": 0,
      "known_for_department": "Acting",
      "profile_path": null,
      "known_for": [
        {
          "adult": false,
          "backdrop_path": null,
          "id": 520706,
          "title": "The Inner Revolution",
          "original_language": "en",
          "original_title": "The Inner Revolution",
          "overview":
              "Documents the intensive Primal Therapy of a thirty-five year old college professor who has spent most of his life taking refuge in the comfortable half-world of neurosis.",
          "poster_path": null,
          "media_type": "movie",
          "genre_ids": [99],
          "popularity": 0.6,
          "release_date": "1971-10-03",
          "video": false,
          "vote_average": 0,
          "vote_count": 0
        }
      ]
    }
  ],
  "total_pages": 500,
  "total_results": 10000
};

const noSearchResults = {
  "page": 1,
  "results": [],
};

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBarFocusNode = FocusNode();
  final _searchBarTextController = TextEditingController();
  var _searching = false;

  Map<String, dynamic>? _searchResults;

  @override
  void initState() {
    super.initState();
    _searchBarFocusNode.requestFocus();
  }

  void _clearSearch() {
    setState(() {
      _searchBarTextController.clear();
      _searchResults = null;
      _searchBarFocusNode.requestFocus();
    });
  }

  void _search() {
    debugPrint(_searchBarTextController.text);

    setState(() {
      _searching = true;

      // _searchResults = null;
    });

    // Fake a delay in results
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _searching = false;
        _searchResults = searchResults;
      });
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
                      _clearSearch();
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
          if (_searchResults == null) latestSearches(),
          if (_searchResults == null) latestTappedResults(),
          if (_searchResults != null) searchResultsList(),
        ],
      ),
    );
  }

  Widget searchResultsList() {
    if (_searchResults!['results'].isEmpty) {
      return SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                (['😢', '😓', '🤷', '🫠', '🙃']..shuffle()).first,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'No results found',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2 / 4.1,
        ),
        itemCount: _searchResults!['results'].length,
        itemBuilder: (context, index) {
          // If it's a person we use the PosterTile, if it's a movie or a show we use the MovieTile
          if (_searchResults!['results'][index]['media_type'] == 'person') {
            return PosterTile(
              imagePath:
                  _searchResults!['results'][index]['profile_path'] as String?,
              title: _searchResults!['results'][index]['name'] as String,
              width: MediaQuery.of(context).size.width / 3 - 2 * 4,
              height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
              onTap: () {
                AutoRouter.of(context).push(const DetailRoute());
              },
            );
          } else {
            String year;
            String name;

            // if it's a movie the year is in release_date, if it's a show it's in first_air_date
            if (_searchResults!['results'][index]['release_date'] != null) {
              try {
                year = DateTime.parse(_searchResults!['results'][index]
                        ['release_date'] as String)
                    .year
                    .toString();
              } catch (e) {
                year = 'Unknown';
              }

              name = _searchResults!['results'][index]['title'] as String;
            } else {
              try {
                year = DateTime.parse(_searchResults!['results'][index]
                        ['release_date'] as String)
                    .year
                    .toString();
              } catch (e) {
                year = 'Unknown';
              }

              name = _searchResults!['results'][index]['name'] as String;
            }

            return MovieTile(
              posterPath:
                  _searchResults!['results'][index]['poster_path'] as String?,
              title: name,
              year: year,
              voteAverage:
                  _searchResults!['results'][index]['vote_average'].toDouble(),
              width: MediaQuery.of(context).size.width / 3 - 2 * 4,
              height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
              onTap: () {
                AutoRouter.of(context).push(const DetailRoute());
              },
            );
          }
        },
      ),
    );
  }

  SliverPadding latestTappedResults() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2 / 4.1,
        ),
        itemBuilder: (context, index) {
          var posterPath = recentResultsTapped[index]['poster_path'] as String;
          var title = recentResultsTapped[index]['title'] as String;
          var year = DateTime.parse(
                  recentResultsTapped[index]['release_date'] as String)
              .year;

          return MovieTile(
            posterPath: posterPath,
            title: title,
            year: year.toString(),
            voteAverage: recentResultsTapped[index]['vote_average'] as double,
            width:
                MediaQuery.of(context).size.width / 3 - 2 * 4, // see delegate
            height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
            onTap: () {
              AutoRouter.of(context).push(const DetailRoute());
            },
          );
        },
        itemCount: recentResultsTapped.length,
      ),
    );
  }

  SliverPadding latestSearches() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10),
      sliver: SliverList.builder(
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
    );
  }
}
