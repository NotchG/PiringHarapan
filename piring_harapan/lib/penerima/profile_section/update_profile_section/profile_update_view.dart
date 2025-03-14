import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/header_navigation.dart';

import 'package:piring_harapan/common_components/profile_textbar_builder.dart';

class ProfileUpdateView extends StatefulWidget {
  const ProfileUpdateView({super.key});

  @override
  State<ProfileUpdateView> createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends State<ProfileUpdateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              HeaderNavigation(
                text: "Edit Profile",
              ),
              CircleAvatar(
                backgroundImage: NetworkImage("http://dummyimage.com/200x200.png/ff4444/ffffff"),
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
              ProfileTextbarBuilder(
                  sectionTitle: "Tentang Saya",
                  profileCards: [
                    ProfileCardData(
                        defaultValue: "Gilang Amarah",
                        hintText: "Nama",
                        onChanged: (s) {

                        }
                    ),
                    ProfileCardData(
                        defaultValue: "Jl. Mawar No.45, Kota Bandung, Jawa Barat",
                        hintText: "Lokasi",
                        onChanged: (s) {

                        }
                    ),
                    ProfileCardData(
                        defaultValue: "+62812814350921",
                        hintText: "Nomor Telepon",
                        onChanged: (s) {

                        }
                    ),
                    ProfileCardData(
                        defaultValue: "gilang.amarah@gmail.com",
                        hintText: "Email",
                        onChanged: (s) {

                        }
                    )
                  ]
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff91C077),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        "Save profile",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
