import 'package:banking_provider/UI/bank_carts_screen.dart';
import 'package:banking_provider/data/api_service/api_bank_service.dart';
import 'package:banking_provider/data/local_data/local_db.dart';
import 'package:banking_provider/data/repositories/my_repository.dart';
import 'package:banking_provider/view_model/bank_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() {

  MyRepository myRepository =  MyRepository(apiService: ApiService(), localDatabase: LocalDatabase());
  BankViewModel bankViewModel = BankViewModel(myRepository: myRepository);
  runApp(


      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=> bankViewModel)

      ],
          child: MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(423.5294,843.13727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext contex, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BankCartScreen(),
        );
      },
    );
  }
}