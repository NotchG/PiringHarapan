import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProfileCardData {
  final String title;
  final String subTitle;
  final Function() onClick;

  ProfileCardData({required this.title, this.subTitle = "", required this.onClick});
}

class ProfileCardBuilder extends StatefulWidget {
  final String sectionTitle;
  final List<ProfileCardData> profileCards;
  const ProfileCardBuilder({super.key, required this.sectionTitle, required this.profileCards});

  @override
  State<ProfileCardBuilder> createState() => _ProfileCardBuilderState();
}

class _ProfileCardBuilderState extends State<ProfileCardBuilder> {

  Widget card(ProfileCardData profileCard, {double lt = 0, double rt = 0, double lb = 0, double rb = 0}) {
    return InkWell(
      onTap: profileCard.onClick,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xff91C077)),
              right: BorderSide(color: Color(0xff91C077)),
              left: BorderSide(color: Color(0xff91C077)),
              bottom: (lb > 0) ? BorderSide(color: Color(0xff91C077)) : BorderSide.none,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(lt), topRight: Radius.circular(rt), bottomLeft: Radius.circular(lb), bottomRight: Radius.circular(rb))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              profileCard.title,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      profileCard.subTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffA4A4A4),
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff91C077),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardBuilder(int index, int length, ProfileCardData profileCard) {
    double borderRadius = 10;

    if (length == 1) {
      return card(profileCard, lt: borderRadius, rt: borderRadius, lb: borderRadius, rb: borderRadius);
    }

    if (index == length - 1) {
      return card(profileCard, lb: borderRadius, rb: borderRadius);
    }

    if (index == 0) {
      return card(profileCard, lt: borderRadius, rt: borderRadius);
    }

    return card(profileCard);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.sectionTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: widget.profileCards.mapIndexed((i, e) => cardBuilder(i, widget.profileCards.length, e)).toList(),
        )
      ],
    );
  }
}
