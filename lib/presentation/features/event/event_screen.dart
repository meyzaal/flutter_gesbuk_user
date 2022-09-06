import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const itemList = [
      'tes1',
      'tes1',
      'tes1',
      'tes1',
      'tes1',
    ];

    return GesbukUserScaffold(
      appBarTitle: 'My Event',
      body: Column(
          children: [const Text('Event Screen'), _buildEventCard(context)]),
      bottomMenuIndex: 1,
    );
  }

  Widget _buildEventCard(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1511285560929-80b456fea0bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80';

    return Container(
      height: 320.0,
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.sidePadding),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(
            image: NetworkImage(imageUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 3.0,
            offset: Offset(1, 3),
          )
        ],
      ),
      child: Opacity(
        opacity: 0.9,
        child: Container(
          height: 112.0,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(AppSizes.widgetSidePadding),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.white70,
                Colors.white,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.darkGray,
                blurRadius: 0.0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Event Name',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  Text('Location',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text(
                    'Guest Count',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Text('Date')
            ],
          ),
        ),
      ),
    );
  }
}
