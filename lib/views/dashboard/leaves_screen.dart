import 'package:devhub/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';



class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  final List<Map<String, dynamic>> leaveData = [
    {"title": "Leave Balance", "value": "20", "color": Colors.blue},
    {"title": "Leave Approved", "value": "2", "color": Colors.green},
    {"title": "Leave Pending", "value": "4", "color": Colors.teal},
    {"title": "Leave Cancelled", "value": "10", "color": Colors.red},
  ];


  @override
  void initState() {
    // TODO: implement initState
    _tabController= TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("All Leaves",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.tune, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside grid
                itemCount: leaveData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5, // Adjusts height
                ),
                itemBuilder: (context, index) {
                  final item = leaveData[index];
                  return leaveCard(item["title"], item["value"], item["color"]);
                },
              ),
            ),

            // Tabs Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                indicator: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                  Tab(text: "Team Leave"),
                ],
              ),
            ),
            SizedBox(height: 16),

            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, i){
                return leaveListCard("Apr 15, 2023 - Apr 18, 2023", "3 Days", "16", "Martin Deo");
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget leaveCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          Spacer(),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
  //
  Widget leaveListCard(String date, String days, String balance, String approvedBy) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date", style: TextStyle(color: Colors.black54, fontSize: 12)),
                  SizedBox(height: 4),
                  Text(date, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Approved",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Apply Days, Balance, Approved By
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              columnInfo("Apply Days", days),
              columnInfo("Leave Balance", balance),
              columnInfo("Approved By", approvedBy, isBold: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget columnInfo(String title, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.black54, fontSize: 12)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }


}
