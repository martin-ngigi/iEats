import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/base/custome_app_bar.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/pages/orders/view_order.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {

  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn){
      _tabController =  TabController(length: 2, vsync: this);
      /// get order list
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Orders"),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: AppColors.yellowColor,
              controller: _tabController,
              tabs: const [
                Tab(text: "Current",),
                Tab(text: "History")
              ],
            ),
          ),
          /// TabBarView can be implemented at any point and any child
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: const [
                  ViewOrder(isCurrent: true), /// current
                  ViewOrder(isCurrent: false), /// History
                ]
            ),
          )
        ],
      ),
    );
  }
}
