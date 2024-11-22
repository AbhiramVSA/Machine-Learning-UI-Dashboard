import 'package:flutter/material.dart';
import 'package:test2_app/util/responsive.dart';
import 'package:test2_app/widgets/dashboard_widget.dart';
import 'package:test2_app/widgets/side_menu_widget.dart';
import 'package:test2_app/widgets/summary_widget.dart';


class MainScreen extends StatelessWidget{
    const MainScreen({super.key});


    @override
    Widget build(BuildContext context){
      final isDesktop = Responsive.isDesktop(context);
      return Scaffold(
        drawer: !isDesktop
            ? const SizedBox(
              width: 250,
              child: SideMenuWidget(),
            )
            : null,
        body: SafeArea(
          child: Row(
            children: [
              if (isDesktop)
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
                Expanded(
                  flex: 7,
                  child: DashboardWidget(),
                ),
                if (isDesktop)
                Expanded(
                  flex: 3,
                  child: SummaryWidget(),
                ),
            ],
          ),
        ),
      );
    }


  
}