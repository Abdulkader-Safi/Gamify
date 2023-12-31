import 'package:flutter/material.dart';
import 'package:movie_viewer/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  const ScrollableGamesWidget(
    this._height,
    this._width,
    this._showTitle,
    this._gamesData, {
    super.key,
  });

  final double _height;
  final double _width;
  final bool _showTitle;

  final List<Game> _gamesData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: _gamesData.map((game) {
          return Container(
            height: _height,
            width: _width * 0.3,
            padding: EdgeInsets.only(right: _width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _height * 0.8,
                  width: _width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(game.coverImage.url),
                    ),
                  ),
                ),
                if (_showTitle)
                  Text(
                    game.title,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _height * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
