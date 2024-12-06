import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Auth/domain/usecase/logout_usecase.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/company_create_modal.dart';
import 'package:quirckly/app/injection_container.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
            ),
            ListTile(
              onTap: () {
                context.pop();
                showDialog(
                  context: context,
                  builder: (context) => CompanyCreateModal(),
                );
              },
              leading: Icon(
                Icons.apartment_outlined,
                color: Colors.black87,
              ),
              title: Text(
                'Create Company',
                style: bodyLTextStyle.copyWith(color: Colors.black87),
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(
                Icons.key_outlined,
                color: Colors.black87,
              ),
              title: Text(
                'Change Password',
                style: bodyLTextStyle.copyWith(color: Colors.black87),
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
            ListTile(
              onTap: () async {
                await sl<LogoutUsecase>().call();
                context.go(AppRoutes.onBoarding);
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
        ),
      );
    },
  );
}
