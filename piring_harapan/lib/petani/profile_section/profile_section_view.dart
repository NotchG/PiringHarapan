import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/profile_card_builder.dart';
import 'package:piring_harapan/petani/profile_section/general_section/privacy_page_view.dart';
import 'package:piring_harapan/petani/profile_section/general_section/termsofservices_view.dart';
import 'package:piring_harapan/petani/profile_section/update_profile_section/profile_update_view.dart';

class ProfileSectionView extends StatefulWidget {
  const ProfileSectionView({super.key});

  @override
  State<ProfileSectionView> createState() => _ProfileSectionViewState();
}

class _ProfileSectionViewState extends State<ProfileSectionView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("http://dummyimage.com/200x200.png/ff4444/ffffff"),
                    radius: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Dedeng's Store",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    "Jl. Kemanggisan Raya No.22",
                    style: TextStyle(
                        fontSize: 12
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCardBuilder(
                  sectionTitle: "Tentang Saya",
                  profileCards: [
                    ProfileCardData(
                        title: "No Telepon",
                        subTitle: "+6287851327818",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProfileUpdateView()
                          ));
                        }
                    ),
                    ProfileCardData(
                        title: "Email",
                        subTitle: "dedeng.store@gmail.com",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ProfileUpdateView()
                          ));
                        }
                    )
                  ]
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCardBuilder(
                  sectionTitle: "Land and Activity",
                  profileCards: [
                    ProfileCardData(
                        title: "Land data",
                        onClick: () {

                        }
                    ),
                    ProfileCardData(
                        title: "Sales history of ingredients to the cooks",
                        onClick: () {

                        }
                    ),
                    ProfileCardData(
                        title: "Delivery status",
                        onClick: () {

                        }
                    )
                  ]
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCardBuilder(
                  sectionTitle: "Feedback from Cooks",
                  profileCards: [
                    ProfileCardData(
                        title: "Rating and reviews about ingredients quality",
                        onClick: () {

                        }
                    ),
                    ProfileCardData(
                        title: "Average rating",
                        onClick: () {

                        }
                    ),
                  ]
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCardBuilder(
                  sectionTitle: "General",
                  profileCards: [
                    ProfileCardData(
                        title: "Privacy Policy",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => PrivacyPolicyView()
                          ));
                        }
                    ),
                    ProfileCardData(
                        title: "Terms of Services",
                        onClick: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TermsofservicesView()
                          ));
                        }
                    ),
                    ProfileCardData(
                        title: "Log out",
                        onClick: () {
                          Navigator.pushReplacementNamed(context, '/');
                        }
                    )
                  ]
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
