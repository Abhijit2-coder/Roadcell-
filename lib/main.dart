import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roadcell/providers/user_provider.dart';
import 'package:roadcell/screens/get_permission1_screen.dart';
import 'package:roadcell/screens/get_permission2_screen.dart';
import 'package:roadcell/screens/get_permission3_screen.dart';
import 'package:roadcell/screens/get_permission4_screen.dart';
import 'package:roadcell/screens/get_permission5_screen.dart';
import 'package:roadcell/screens/give_permission1_screen.dart';
import 'package:roadcell/screens/give_permission2_screen.dart';
import 'package:roadcell/screens/give_permission3_screen.dart';
import 'package:roadcell/screens/give_permission4_screen.dart';
import 'package:roadcell/screens/give_permission5_screen.dart';
import 'package:roadcell/screens/home_screen.dart';
import 'package:roadcell/screens/login_screen.dart';
import 'package:roadcell/screens/pass_generated_screen.dart';
import 'package:roadcell/screens/passes_screen.dart';
import 'package:roadcell/screens/pdf_screen.dart';
import 'package:roadcell/screens/regester_screen.dart';
import 'package:roadcell/screens/splash_screen.dart';
import 'package:roadcell/screens/document_screen.dart';
import 'package:roadcell/screens/report_screen.dart';
import 'package:roadcell/screens/profile_screen.dart';
import 'package:roadcell/utils/routes.dart';

void main() {
  runApp(RoadCellApp());
}

class RoadCellApp extends StatelessWidget {
  const RoadCellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        title: 'RoadCell',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Roboto", useMaterial3: true),
        initialRoute: MyRoutes.splashRoute,
        routes: {
          //Main
          MyRoutes.splashRoute: (context) => SplashScreen(),
          MyRoutes.loginRoute: (context) => LoginScreen(),
          MyRoutes.registerRoute: (context) => CreateAccountScreen(),
          //semi-main
          MyRoutes.homeRoute: (context) => RoadCellHome(),
          MyRoutes.passesRoute: (context) => MyPassesScreen(),
          MyRoutes.documentsRoute: (context) => const MyDocumentsScreen(),
          MyRoutes.reportRoute: (context) => const ReportViolationScreen(),
          MyRoutes.profileRoute: (context) => const ProfileScreen(),
          //sub-pages
          //home > get permission
          MyRoutes.getPerm1Route: (context) => const GetPermissionScreen(),
          MyRoutes.getPerm2Route: (context) => const RequestSentScreen(),
          MyRoutes.getPerm3Route: (context) => const PermissionRequestScreen(),
          MyRoutes.getPerm4Route: (context) => const YourSelfieScreen(),
          MyRoutes.getPerm5Route: (context) => const PaymentScreen(),
          MyRoutes.generatePassRoute: (context) => const PassGeneratedScreen(),
          //home > give permission
          MyRoutes.givePerm1Route: (context) => const GivePermissionScreen(),
          MyRoutes.givePerm2Route: (context) =>
              const GivePermissionSelfieScreen(),
          MyRoutes.givePerm3Route: (context) => const BorrowerDetailsScreen(),
          MyRoutes.givePerm4Route: (context) =>
              const GivePermissionRequestScreen(),
          MyRoutes.givePerm5Route: (context) =>
              const GivePermissionPaymentScreen(),
          MyRoutes.passPdfPreviewRoute: (context) =>
              const PassPdfPreviewScreen(),
        },
      ),
    );
  }
}
