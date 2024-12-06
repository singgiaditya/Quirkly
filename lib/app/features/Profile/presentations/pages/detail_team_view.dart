import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/domain/entities/TeamEntity.dart';

class DetailTeamView extends StatelessWidget {
  final TeamEntity team;
  const DetailTeamView({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: yellowColor,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Team",
                    style: titleSTextStyle.copyWith(color: yellowColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(
              thickness: 1,
              color: Color(0xFF3F3849),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${team.name}",
                        style: bodyBaseTextStyle.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Company: ${team.company!.name}",
                        style: regularTextStyle.copyWith(color: Colors.white60),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "8",
                    style: bodyBaseTextStyle.copyWith(color: yellowColor),
                  ),
                  Icon(
                    Icons.group_outlined,
                    color: yellowColor,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Projects",
                style: titleMTextStyle.copyWith(color: pinkColor),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildCard();
                }),
          ],
        )),
      ),
    );
  }
}

class _buildCard extends StatelessWidget {
  const _buildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Restful Api",
                    style: bodyBaseTextStyle.copyWith(color: pinkColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Color(0xFFC9A009),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "In Progress",
                      style: regularTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Team: Team Amazon Server",
                    style: bodyMTextStyle.copyWith(
                        color: Colors.white.withOpacity(0.8)),
                  ),
                  Text(
                    "23 Tasks",
                    style: regularTextStyle.copyWith(
                        color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Start date: 12-10-2024",
                    style: bodyMTextStyle.copyWith(color: Colors.white60),
                  ),
                  Text(
                    "Deadline: 14-12-2024",
                    style: regularTextStyle.copyWith(color: Colors.white60),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Divider(
          thickness: 2,
          color: Colors.pink,
        ),
      ],
    );
  }
}
