import 'package:banking_provider/utils/my_icons.dart';
import 'package:banking_provider/view_model/bank_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BankCartScreen extends StatelessWidget {
  const BankCartScreen({Key? key}) : super(key: key);

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Consumer<BankViewModel>(
                builder: (context, bankViewModel, child) {
                  return Center(
                    child: bankViewModel.isLoading
                        ? const CircularProgressIndicator()
                        : (bankViewModel.bankCart == null
                            ? const Text("Hozircha data no")
                            : Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.958,
                                    child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                            bankViewModel.bankCart!.length,
                                        itemBuilder: (context, index) {
                                          return CardItems(
                                              bankViewModel, index);
                                        }),
                                  )
                                ],
                              )),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BankViewModel>().fetchBankInfo();
        },
        child: const Icon(Icons.download),
      ),
    );

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    // )
  }

  Column CardItems(BankViewModel bankViewModel, int index) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: 200.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Color(hexColor(bankViewModel
                            .bankCart![index].colors!.colorA
                            .toString()) ??
                        ""),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(hexColor(bankViewModel
                                    .bankCart![index].colors!.colorA
                                    .toString()) ??
                                "")
                            .withOpacity(0.5),
                        blurRadius: 2,
                        offset: Offset(3, 6), // Shadow position
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  MyIcon.cardbg,
                  color: Color(hexColor(bankViewModel
                          .bankCart![index].colors!.colorB
                          .toString()) ??
                      ""),
                ),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 15, left: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                MyIcon.getIcon(bankViewModel
                                    .bankCart![index].cardType
                                    .toString()),
                                width: 50,
                              )
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              MyIcon.card,
                              width: 50,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  bankViewModel.bankCart![index].cardNumber
                                      .toString(),
                                  style: GoogleFonts.concertOne().copyWith(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w100),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bankViewModel.bankCart![index].expireDate
                                      .toString()
                                      .substring(2, 7)
                                      .replaceAll("-", " / "),
                                  style:
                                      GoogleFonts.alatsi(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Current Ballance",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "UZS ${bankViewModel.bankCart![index].moneyAmount}",
                              style: GoogleFonts.rajdhani().copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
