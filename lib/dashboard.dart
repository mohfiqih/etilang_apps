import 'package:flutter/material.dart';
import 'package:etilang_apps/component/appBarActionItems.dart';
// import 'package:etilang_apps/component/barChart.dart';
import 'package:etilang_apps/component/header.dart';
import 'package:etilang_apps/component/historyTable.dart';
import 'package:etilang_apps/component/infoCard.dart';
import 'package:etilang_apps/component/paymentDetailList.dart';
import 'package:etilang_apps/component/sideMenu.dart';
import 'package:etilang_apps/config/responsive.dart';
import 'package:etilang_apps/config/size_config.dart';
import 'package:etilang_apps/style/colors.dart';
import 'package:etilang_apps/style/style.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InfoCard(
                                icon: 'assets/document.svg',
                                label: 'History \nTilang',
                                amount: '\ 10',
                              ),
                              InfoCard(
                                  icon: 'assets/clipboard.svg',
                                  label: 'History \nUser',
                                  amount: '\ 5'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'Transafer \nSesama Bank',
                                  amount: '\  '),
                              InfoCard(
                                  icon: 'assets/pie-chart.svg',
                                  label: 'Transafer to \nOvo',
                                  amount: '\ '),
                              InfoCard(
                                  icon: 'assets/salary.svg',
                                  label: 'Transafer to \nOvo',
                                  amount: '\ '),
                              InfoCard(
                                  icon: 'assets/drop.svg',
                                  label: 'Transafer to \nOvo',
                                  amount: '\ '),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         PrimaryText(
                        //           text: 'Grafik',
                        //           size: 16,
                        //           fontWeight: FontWeight.w400,
                        //           color: AppColors.secondary,
                        //         ),
                        //         PrimaryText(
                        //             text: '\Pelanggaran',
                        //             size: 30,
                        //             fontWeight: FontWeight.w800),
                        //       ],
                        //     ),
                        //     PrimaryText(
                        //       text: 'Selama 1 tahun',
                        //       size: 16,
                        //       fontWeight: FontWeight.w400,
                        //       color: AppColors.secondary,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical * 3,
                        // ),
                        // Container(
                        //   height: 180,
                        //   child: BarChartCopmponent(),
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical * 5,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     PrimaryText(
                        //         text: 'Riwayat',
                        //         size: 30,
                        //         fontWeight: FontWeight.w800),
                        //     PrimaryText(
                        //       text: 'Jenis Pelanggaran & Pembayaran',
                        //       size: 16,
                        //       fontWeight: FontWeight.w400,
                        //       color: AppColors.secondary,
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: SizeConfig.blockSizeVertical * 3,
                        // ),
                        // HistoryTable(),
                        // if (!Responsive.isDesktop(context)) PaymentDetailList()
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                          PaymentDetailList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
