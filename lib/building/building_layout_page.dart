import 'package:flutter/material.dart';

class BuildingLayoutPage extends StatelessWidget {
  const BuildingLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Image.network(
                'https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(42.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: const Text(
                            'Oeschinen Lake Campground',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  const FavoriteWidget(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.blue,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              'call',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.near_me,
                            color: Colors.blue,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Route',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.blue,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              'SHARE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
