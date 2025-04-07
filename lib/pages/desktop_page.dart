import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/constants/constants.dart';
import 'package:intellij_tourism_designer/constants/theme.dart';
import 'package:intellij_tourism_designer/models/state_model.dart';
import 'package:intellij_tourism_designer/pages/stats_page.dart';
import 'package:intellij_tourism_designer/pages/plan_page.dart';
import 'package:intellij_tourism_designer/pages/map_page.dart';
import 'package:intellij_tourism_designer/pages/personal_page.dart';
import 'package:provider/provider.dart';
import '../models/global_model.dart';
import '../models/plan_edit_model.dart';


class DeskTopPage extends StatefulWidget {
  const DeskTopPage({super.key});

  @override
  State<DeskTopPage> createState() => _DeskTopPageState();
}

class _DeskTopPageState extends State<DeskTopPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    final vm = Provider.of<GlobalModel>(context,listen: false);
    //两张地图同时存在，只有显示的那张会刷新中心点
    vm.changeMapIndex(index==1 ? true : false);
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Intellij_tourism_designer"),),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.supervised_user_circle),
                label: Text("主页")),
              NavigationRailDestination(
                  icon: Icon(Icons.photo),
                  label: Text("主页")),
              NavigationRailDestination(
                  icon: Icon(Icons.alarm_on),
                  label: Text("主页")),
              NavigationRailDestination(
                  icon: Icon(Icons.add_chart),
                  label: Text("主页"))
            ],
          ),
          const VerticalDivider(thickness: 1, width:1),
          ChangeNotifierProvider<PlanEditModel>(
            create: (context) => PlanEditModel(),
            child: Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  Placeholder(),Placeholder(),Placeholder(),Placeholder(),
                  // PersonalPage(callBack: _onItemTapped,),
                  // const MapPage(),
                  // const PlanPage(),
                  // ChangeNotifierProvider<StateModel>(
                  //     create: (context) => StateModel(),
                  //     child: const CityStatsPage()),
                ],
              ),
            )
          )
        ]
      )
    );
  }

}