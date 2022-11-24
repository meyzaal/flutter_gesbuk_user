import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/extensions/date.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';
import 'package:flutter_gesbuk_user/data/models/event_model.dart';

class EventCard extends StatelessWidget {
  final List<EventModel>? data;
  final int index;
  final bool withBorderRadius;

  const EventCard(
      {super.key,
      this.data,
      required this.index,
      required this.withBorderRadius});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        // 'https://images.unsplash.com/photo-1553915632-175f60dd8e36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1562967005-a3c85514d3e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1544531585-f14f463149ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
        // 'https://images.unsplash.com/photo-1565035010268-a3816f98589a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80';
        'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80';

    return Container(
      height: AppSizes.baseSize * 32,
      padding: const EdgeInsets.all(AppSizes.baseSize),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: NetworkImage(data?[index].imageUrl ?? imageUrl),
            fit: BoxFit.cover),
        borderRadius: withBorderRadius
            ? BorderRadius.circular(AppSizes.widgetSidePadding)
            : null,
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 3.0,
            offset: Offset(1, 3),
          )
        ],
      ),
      child: _buildEventInfoCard(context, index, data),
    );
  }
}

Opacity _buildEventInfoCard(
    BuildContext context, int index, List<EventModel>? data) {
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
        borderRadius: BorderRadius.circular(AppSizes.widgetBorderRadius / 2),
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
            child: _buildEventInfo(context, index, data),
          ),
          Container(
            height: double.infinity,
            width: 2.0,
            color: AppColors.secondaryColor,
          ),
          const SizedBox(width: 16.0),
          _buildEventDate(context, index, data)
        ],
      ),
    ),
  );
}

Column _buildEventDate(
    BuildContext context, int index, List<EventModel>? data) {
  final date = data?[index].startDate;
  String? dateDay;
  String? dateMonth;
  String? dateYear;

  if (date != null) {
    dateDay = ParseDate.returnDay(date);
    dateMonth = ParseDate.returnMonth(date).substring(0, 3);
    dateYear = ParseDate.returnYear(date);
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        dateMonth ?? '',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      Text(dateDay ?? '', style: Theme.of(context).textTheme.headline6),
      Text(dateYear ?? '', style: Theme.of(context).textTheme.subtitle1),
    ],
  );
}

Column _buildEventInfo(
    BuildContext context, int index, List<EventModel>? data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(data?[index].name ?? '',
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
          Text(data?[index].location ?? '',
              style: Theme.of(context).textTheme.bodyText2),
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
            '${data?[index].guestList?.length} Guest',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ],
  );
}
