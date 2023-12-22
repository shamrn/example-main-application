import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_application/features/profile/provider/profile_provider.dart';
import 'package:main_application/features/profile/provider/profile_state.dart';
import 'package:main_library/common/extensions/localization_extension.dart';
import 'package:main_library/common/ui/app_colors.dart';
import 'package:main_library/common/utils/consumer_state_with_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends ConsumerStateWithProvider<ProfileProvider,
    ProfileState, ProfilePage> {

  Widget _buildTitle() {
    return Text(
      context.locale.profileTitle,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }


  Widget _buildCharacterImage(String? image) {
    return image != null
        ? ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            child: Image.network(
              image,
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildCharacterName(String name) {
    return Center(child: Text(name));
  }

  Widget _buildCharacter() {
    final state = ref.watch(provider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.transparent,
          border: Border.all(color: AppColors.accent),
        ),
        child: Column(
          children: [
            _buildCharacterImage(state.character?.image),
            SizedBox(height: 50.h),
            _buildCharacterName(state.character?.name ?? ''),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              _buildTitle(),
              SizedBox(height: 40.h),
              Center(child: _buildCharacter()),
            ],
          ),
        ),
      ),
    );
  }
}
