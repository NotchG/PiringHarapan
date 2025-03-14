import 'package:flutter/material.dart';
import 'package:piring_harapan/common_components/profile_card_builder.dart';
import 'package:piring_harapan/pemerintah/view/main_pemerintah_view.dart';
import 'package:piring_harapan/pemerintah/view/profile_section/general_section/privacy_page_view.dart';
import 'package:piring_harapan/pemerintah/view/profile_section/general_section/termsofservices_view.dart';
import 'package:piring_harapan/pemerintah/view/profile_section/update_profile_section/profile_update_view.dart';
import 'package:piring_harapan/splash_screen.dart';

class ProfileSectionView extends StatefulWidget {
  const ProfileSectionView({super.key});

  @override
  State<ProfileSectionView> createState() => _ProfileSectionViewState();
}

class _ProfileSectionViewState extends State<ProfileSectionView> {

  void navigateBotNav(int index) {
    NavigationBar nBar = PEMERINTAH_KEY.currentWidget as NavigationBar;
    nBar.onDestinationSelected!(index);
  }

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
                      "Prof. Kelompok 2 UREEKA",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    "Menteri Pendidikan Dasar",
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
                        subTitle: "ppid@kemendikbud.go.id",
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
                  sectionTitle: "Monitoring Program",
                  profileCards: [
                    ProfileCardData(
                        title: "Logbook",
                        onClick: () {
                          navigateBotNav(2);
                        }
                    ),
                    ProfileCardData(
                        title: "Analysis Review",
                        onClick: () {
                          NavigationBar nBar = PEMERINTAH_KEY.currentWidget as NavigationBar;
                          nBar.onDestinationSelected!(3);
                        }
                    ),
                    ProfileCardData(
                        title: "Activity report of cooks",
                        onClick: () {

                        }
                    )
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
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => SplashScreen()
                          ));
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
