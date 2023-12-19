import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/region_model.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/home/widgets/body_section.dart';
import 'package:hank_talker_mobile/features/home/widgets/header_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  Future<void> asyncInit() async {
    if (mounted) {
      await context.read<ProfileProvider>().getProfile();
      // ignore: use_build_context_synchronously
      await context.read<ProfileProvider>().getRegion();
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = context.watch<ProfileProvider>().userProfileModel.firstName;
    // ignore: use_colored_box
    return Container(
      color: const Color(0XFF3AA590),
      child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: HeaderSection(
                name: name,
                region: context.watch<ProfileProvider>().selectedRegion,
              )),
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: BodySection(
                    userProfileModel:
                        context.watch<ProfileProvider>().userProfileModel,
                  ))
            ],
          )),
    );
  }
}
