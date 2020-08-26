import 'package:cinema_films/src/models/film.dart';
import 'package:flutter/material.dart';

class DetailFilm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Film film = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(//Como si fuera un list view
      slivers: [
        _createAppBar( film ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 10),
              _titlePoster( film, context ),
              _description( film, context )
            ]
          ),
        )
      ],
      )
    );
  }

  Widget _createAppBar(Film film) {

    return SliverAppBar(
      elevation: 2,
      backgroundColor: Colors.indigo,
      floating: false,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(film.title),
        centerTitle: true,
        titlePadding: EdgeInsets.all(10),
        background: FadeInImage(
          image: NetworkImage(film.getBackgroundPosterURL()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  Widget _titlePoster(Film film, BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(film.getPosterURL()),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( film. title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
                Text( film.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(film.voteAverage.toString() + '/10', style: Theme.of(context).textTheme.subtitle1)
                ],)
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _description(Film film, BuildContext context) {

      return Container(        
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              width: double.infinity,
              child: Text('Summary', textAlign: TextAlign.start, style: Theme.of(context).textTheme.headline5),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child:Text(film.overview, textAlign: TextAlign.justify)
            )
          ],
        ),
      );


    // return Container(
    //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    //   child: Column(
    //     children: [
    //       Text('Summary', textAlign: TextAlign.right),
    //       Text(film.overview, textAlign: TextAlign.justify)
    //     ],

    //   )
    // );
  }
}