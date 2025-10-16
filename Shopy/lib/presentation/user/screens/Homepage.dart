import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopy/auth/loginpage.dart';
import 'package:shopy/core/app_constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Logout function
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Loginpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Men',
        'icon':
        'https://www.creativefabrica.com/wp-content/uploads/2024/02/10/Multiple-Batch-TShirt-Mockup-Graphics-90699259-1-1-580x387.jpg'
      },
      {'title': 'Women', 'icon': Icons.female},
      {'title': 'Kids', 'icon': Icons.child_care},
      {'title': 'Beauty', 'icon': Icons.brush},
      {'title': 'Fashion', 'icon': Icons.shopping_bag},
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopy",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search any Product..",
                  hintStyle: TextStyle(color: AppColors.background),
                  prefixIcon: Icon(Icons.search, color: AppColors.background),
                  suffixIcon: Icon(Icons.mic, color: AppColors.background),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(height: 12.h),

              // Featured Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Featured",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.filter_list)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 12.h),

              // Horizontal Categories Row
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final icon = category['icon'];

                    return Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: icon is IconData
                                ? Icon(icon,
                                color: Colors.blueAccent, size: 28.sp)
                                : icon is String
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius.circular(30.r),
                              child: Image.network(icon,
                                  fit: BoxFit.cover),
                            )
                                : const SizedBox(),
                          ),
                          SizedBox(height: 8.h),
                          Text(category['title'] as String,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),

              // Logout Button
              Center(
                child: ElevatedButton(
                  onPressed: () => logOut(context),
                  child: const Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
