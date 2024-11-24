import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: Icon(Icons.apartment_outlined),
            title: Text(
              'Create Company',
              style: bodyLTextStyle,
            ),
          ),
          Divider(
            color: Colors.white60,
          ),
          ListTile(
            leading: Icon(Icons.key_outlined),
            title: Text(
              'Change Password',
              style: bodyLTextStyle,
            ),
          ),
          Divider(
            color: Colors.white60,
          ),
          ListTile(
            onTap: () {
              context.pop();
              context.pushReplacement(AppRoutes.onBoarding);
            },
            leading: Icon(
              Icons.logout,
              color: redColor,
            ),
            title: Text(
              'Logout',
              style: bodyLTextStyle.copyWith(color: redColor),
            ),
          ),
          Divider(
            color: redColor,
          ),
          SizedBox(
            height: 40,
          )
        ],
      );
    },
  );
}
