import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quirckly/app/core/router/app_routes.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/company_bloc/company_bloc.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/get_all_team_bloc/get_all_team_bloc.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/card_company.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/card_team.dart';
import 'package:quirckly/app/features/Profile/presentations/widgets/show_custom_bottom_sheet.dart';

class ProfileView extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentKey;
  const ProfileView({super.key, required this.parentKey});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Account",
            style: titleMTextStyle.copyWith(color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () =>
                  showCustomBottomSheet(widget.parentKey.currentContext!),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://api.dicebear.com/9.x/big-smile/png?seed=Ramadhan&backgroundColor=b6e3f4,c0aede,d1d4f9"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<CompanyBloc>()..add(CompanyEvent.getAllCompany());
            context.read<GetAllTeamBloc>()..add(GetAllTeamEvent.getAllTeam());
          },
          child: SingleChildScrollView(
            child: Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Company",
                        style: titleSTextStyle.copyWith(color: greenColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.listCompanyNamed);
                        },
                        child: Text(
                          "See All",
                          style: bodyLTextStyle.copyWith(color: greenColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<CompanyBloc, CompanyState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => Container(),
                          loading: () => CircularProgressIndicator(),
                          error: (failure) => Text(
                                "${failure.message}",
                                style: regularTextStyle.copyWith(
                                    color: Colors.white),
                              ),
                          done: (response) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: response.data!.length,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () => context.pushNamed(
                                      AppRoutes.detailCompanyNamed,
                                      extra: response.data![index].company),
                                  child: CardCompany(
                                    company: response.data![index].company!,
                                  )),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 14,
                              ),
                            );
                          });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Team",
                        style: titleSTextStyle.copyWith(color: yellowColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.listTeamNamed);
                        },
                        child: Text(
                          "See All",
                          style: bodyLTextStyle.copyWith(color: yellowColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
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
              ),
            ),
          ),
        ));
  }
}
