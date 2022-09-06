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
    ];

    return GesbukUserScaffold(
      appBarTitle: 'My Event',
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sidePadding, vertical: AppSizes.baseSize),
          child: Column(
            children: <Widget>[
              const Text('HEADER'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildEventCard(context);
                },
                itemCount: itemList.length,
              ),
            ],
          ),
        ),
      ),
      bottomMenuIndex: 1,
    );
  }

  Widget _buildEventCard(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1511285560929-80b456fea0bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80';

    return Container(
      height: AppSizes.baseSize * 32,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.baseSize),
      padding: const EdgeInsets.all(AppSizes.baseSize),
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
      child: _buildEventInfoCard(context),
    );
  }

  Opacity _buildEventInfoCard(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        height: AppSizes.baseSize * 14,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(AppSizes.sidePadding),
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
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.darkGray,
              blurRadius: 0.0,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildEventInfo(context),
            ),
            Container(
              height: double.infinity,
              width: 2.0,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(width: 16.0),
            _buildEventDate(context)
          ],
        ),
      ),
    );
  }

  Column _buildEventDate(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nov',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text('11', style: Theme.of(context).textTheme.headline6),
        Text('2022', style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }

  Column _buildEventInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Event Name',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w700)),
        Row(
          children: [
            const Icon(
              Icons.pin_drop_rounded,
              size: 16.0,
            ),
            const SizedBox(width: AppSizes.baseSize),
            Text('Location', style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.people_rounded,
              size: 16.0,
            ),
            const SizedBox(width: AppSizes.baseSize),
            Text(
              'Guest Count',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
