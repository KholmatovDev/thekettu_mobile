import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thekettu/core/theme/app_colors.dart';
import 'package:thekettu/core/util/extensions.dart';
import 'package:thekettu/presentation/widget/appbar/global_appbar.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const GlobalAppBar(
            title: "Profile",
        centerTitle: true,
        leading: null,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            maxRadius: 50,
            foregroundImage: CachedNetworkImageProvider("https://i.pinimg.com/236x/68/31/12/68311248ba2f6e0ba94ff6da62eac9f6.jpg"),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: AppColors.primaryBlue)),
              fillColor: AppColors.flashWhite,
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h)
            ),
          ),
        ],
      ),
    );
  }
}
