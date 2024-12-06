import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/get_all_team_bloc/get_all_team_bloc.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/card_team.dart';

class ListTeamView extends StatelessWidget {
  const ListTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
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
                    "Your Team",
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
              height: 24,
            ),
            BlocBuilder<GetAllTeamBloc, GetAllTeamState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => Container(),
                  loading: () => CircularProgressIndicator(),
                  error: (failure) => Text(
                    "${failure.message}",
                    style: regularTextStyle.copyWith(color: Colors.white),
                  ),
                  done: (response) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: response.data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => context.pushNamed(
                              AppRoutes.detailTeamNamed,
                              extra: response.data![index].teams),
                          child: CardTeam(
                            team: response.data![index].teams!,
                          )),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 14,
                      ),
                    );
                  },
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
