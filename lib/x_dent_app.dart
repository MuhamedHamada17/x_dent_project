import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/routing/app_router.dart';
import 'package:x_dent_project/core/theiming/colors.dart';

class xDentApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const xDentApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "Doc App",
        theme: ThemeData(
          primaryColor: ColorsManager.lighterBLUE,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}