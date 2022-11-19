import 'package:flutter/material.dart';
import 'package:submissionffun/ui/detail_page.dart';
import 'package:submissionffun/data/localres.dart';
import 'package:submissionffun/ui/styles.dart';

class RestoPage extends StatelessWidget {
  static const routeName = '/resto_list';
  const RestoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resto',
            style: TextStyle(color: thirdColor),
          ),
          centerTitle: true,
          toolbarHeight: 48,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        body: _buildList(context));
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return Row(
    children: [
      Expanded(
        flex: 4,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: restaurant.pictureId,
            child: Image.network(
              restaurant.pictureId,
              width: 100,
            ),
          ),
          textColor: const Color.fromARGB(255, 246, 13, 13),
          title: Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(restaurant.city,
              style: Theme.of(context).textTheme.bodyText2),
          onTap: () {
            Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                arguments: restaurant);
          },
        ),
      ),
      Expanded(
          flex: 1,
          child: Column(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 24,
              ),
              Text(restaurant.rating.toString()),
            ],
          ))
    ],
  );
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
    future: DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json'),
    builder: (context, snapshot) {
      final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
      return ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return _buildRestaurantItem(context, restaurants[index]);
        },
      );
    },
  );
}
