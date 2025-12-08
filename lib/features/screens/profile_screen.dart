import 'package:flutter/material.dart';
import 'package:meetify/utils/colors.dart';
import '../../utils/custom_toast.dart';
import '../auth/auth_method.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColor(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: .infinity,
          child: Stack(
            children: [
              // Profile Image
              SizedBox(
                height: size.height * 0.5,
                width: .infinity,
                child: Image.network(
                  "https://img.freepik.com/free-photo/funny-image-with-senior-man_23-2151179409.jpg?semt=ais_hybrid&w=740&q=80",
                  fit: .cover,
                ),
              ),

              /// Bottom white container
              Positioned(
                top: size.height * 0.45,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.profileContainer,
                    borderRadius: const .only(
                      topLeft: .circular(30),
                      topRight: .circular(30),
                    ),
                    border: Border(
                      top: BorderSide(color: colors.border, width: 6),
                    ),
                  ),
                  child: const Padding(
                    padding: .only(top: 60),
                    child: Column(
                      children: [
                        Text(
                          "Profile Details",
                          style: TextStyle(fontSize: 20, fontWeight: .w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Floating Brand Logo
              Positioned(
                top: size.height * 0.45 - (size.width * 0.125),
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: colors.profileContainer,
                      border: .all(color: colors.border, width: 6),
                      image: const DecorationImage(
                        image: AssetImage("images/meetify.png"),
                        fit: .cover,
                      ),
                    ),
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

// child: IconButton.outlined(
// onPressed: () {
// GoogleSignInService.signOut();
// showAppSnackBar(
// context: context,
// type: .success,
// description: "See you soon! You’re now logged out.",
// );
// },
// icon: Icon(Icons.logout, color: colors.containerColor, size: 50), // need to customize
// style: ButtonStyle(
// padding: .all(const .all(20)),
// side: .all( BorderSide(color: colors.border, width: 2)), // need to customize
// shape: .all(RoundedRectangleBorder(borderRadius: .circular(16))),
// ),
// ),
// ),
