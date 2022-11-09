import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/theme/theme.dart';

enum GuestCardType { listTile, expansionalTile }

class GuestCard extends StatelessWidget {
  const GuestCard({
    Key? key,
    required this.guestName,
    required this.address,
    required this.category,
    required this.checkInTime,
    this.onGuestCheckIn,
    this.guestCardType = GuestCardType.listTile,
    this.isLoading = false,
    this.onExpansionChanged,
    required this.avatarBackgroundColor,
    required this.parsedTime,
    required this.parsedDate,
  }) : super(key: key);

  final String guestName;
  final String address;
  final String category;
  final String parsedTime;
  final String parsedDate;
  final Color avatarBackgroundColor;
  final DateTime? checkInTime;
  final GuestCardType guestCardType;
  final bool isLoading;
  final void Function(bool)? onExpansionChanged;
  final void Function()? onGuestCheckIn;

  @override
  Widget build(BuildContext context) {
    return guestCardType == GuestCardType.listTile
        ? ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 22.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: avatarBackgroundColor,
                      child: const Icon(
                        Icons.person_rounded,
                        color: AppColors.backgroundLight,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: checkInTime != null
                          ? Container(
                              decoration: const ShapeDecoration(
                                  color: Colors.white, shape: CircleBorder()),
                              child: const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                                size: 14.0,
                              ),
                            )
                          : null)
                ],
              ),
            ),
            title: Text(
              guestName,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  category.toUpperCase(),
                  style: Theme.of(context).textTheme.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: checkInTime != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Check-in',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: AppColors.black),
                      ),
                      Text(
                        '$parsedTime | $parsedDate',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )
                : null,
          )
        : Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(primary: AppColors.mainColor),
              primaryColor: AppColors.mainColor,
              textTheme:
                  Theme.of(context).textTheme.apply(fontFamily: 'Nunito'),
            ),
            child: ExpansionTile(
              onExpansionChanged: onExpansionChanged,
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 22.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: avatarBackgroundColor,
                        child: const Icon(
                          Icons.person_rounded,
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: checkInTime != null
                            ? Container(
                                decoration: const ShapeDecoration(
                                    color: Colors.white, shape: CircleBorder()),
                                child: const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.green,
                                  size: 14.0,
                                ),
                              )
                            : null)
                  ],
                ),
              ),
              title: Text(
                guestName,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    category.toUpperCase(),
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.mainColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text('Edit')),
                      const SizedBox(width: 8.0),
                      checkInTime != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Check-in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(color: AppColors.black),
                                ),
                                Text(
                                  '$parsedTime | $parsedDate',
                                  style: Theme.of(context).textTheme.caption,
                                )
                              ],
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              onPressed: onGuestCheckIn,
                              child: const Text('Check-in'),
                            ),
                    ],
                  ),
                )
              ],
            ));
  }
}
