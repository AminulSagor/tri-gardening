import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF0E4B36),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Tri Gardening',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34.sp,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -60.h),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70.r,
                      backgroundColor: Colors.white,
                      backgroundImage: const AssetImage('assets/png/sagor.png'),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sagor',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    Text('Gazipur, Dhaka', style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    SizedBox(height: 16.h),
                    buildInfoItem(label: 'Name', value: 'Sagor'),
                    buildInfoItem(label: 'Phone Number', value: '+8801712345678'),
                    buildInfoItem(label: 'Email', value: 'sagor@example.com'),
                    Row(
                      children: [
                        Expanded(child: buildInfoItem(label: 'Division', value: 'Dhaka')),
                        Expanded(child: buildInfoItem(label: 'District', value: 'Gazipur')),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                              ),
                              child: Text('My Orders', style: TextStyle(fontSize: 16.sp)),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                              ),
                              child: Text('Edit Profile', style: TextStyle(fontSize: 16.sp)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: OutlinedButton(
                        onPressed: () {
                          // Add logout logic here
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          minimumSize: Size.fromHeight(48.h),
                        ),
                        child: Text('Log Out', style: TextStyle(fontSize: 16.sp)),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  Widget buildInfoItem({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
          SizedBox(height: 2.h),
          Text(value, style: TextStyle(fontSize: 16.sp)),
          const Divider(),
        ],
      ),
    );
  }
}
