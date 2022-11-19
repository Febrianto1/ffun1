import 'package:flutter/material.dart';
import 'package:submissionffun/data/localres.dart';
import 'styles.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                title: Text(restaurant.name),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text(' ${restaurant.rating.toString()}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 16,
                        ),
                        Text(' ${restaurant.city}'),
                      ],
                    ),
                    const Divider(color: Colors.grey)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.description,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.justify,
                    ),
                    const Divider(color: Colors.grey),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Text(
                            'Foods: ',
                            textAlign: TextAlign.end,
                          ))
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 72,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: restaurant.menus.foods.map((no) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const Icon(Icons.food_bank),
                            Container(
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  no,
                                  style: const TextStyle(color: thirdColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Text(
                            'Drinks: ',
                            textAlign: TextAlign.end,
                          ))
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 72,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: restaurant.menus.drinks.map((no) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const Icon(Icons.emoji_food_beverage),
                            Container(
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  no,
                                  style: const TextStyle(color: thirdColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
