import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProfileCardData {
  final String hintText;
  final String defaultValue;
  final Function(String) onChanged;

  ProfileCardData({required this.hintText, this.defaultValue = "", required this.onChanged});
}

class ProfileTextbarBuilder extends StatefulWidget {
  final String sectionTitle;
  final List<ProfileCardData> profileCards;
  const ProfileTextbarBuilder({super.key, required this.sectionTitle, required this.profileCards});

  @override
  State<ProfileTextbarBuilder> createState() => _ProfileTextbarBuilderState();
}

class _ProfileTextbarBuilderState extends State<ProfileTextbarBuilder> {

  Widget card(ProfileCardData profileCard, {double lt = 0, double rt = 0, double lb = 0, double rb = 0}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xff91C077)),
            right: BorderSide(color: Color(0xff91C077)),
            left: BorderSide(color: Color(0xff91C077)),
            bottom: (lb > 0) ? BorderSide(color: Color(0xff91C077)) : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(lt), topRight: Radius.circular(rt), bottomLeft: Radius.circular(lb), bottomRight: Radius.circular(rb))
      ),
      child: TextFormField(
        initialValue: profileCard.defaultValue,
        onChanged: profileCard.onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: profileCard.hintText,
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal
            ),
        ),
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal
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
