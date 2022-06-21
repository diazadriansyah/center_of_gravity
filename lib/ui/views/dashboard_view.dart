import 'package:center_of_gravity/models/value_model.dart';
import 'package:center_of_gravity/ui/shared/ui_helper.dart';
import 'package:center_of_gravity/ui/widget/card_view.dart';
import 'package:flutter/material.dart';
import 'package:center_of_gravity/constants/route_name.dart';
import 'package:center_of_gravity/ui/views/register_view.dart';
import 'package:center_of_gravity/viewmodels/dashboard_view_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  List<ValueModel> device = [];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () =>DashboardViewModel(),
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("4186B2"),
          appBar: AppBar(
            title: Text('Center of Gravity'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                itemCount: model.device.length,
                shrinkWrap: true,
                itemBuilder: (context,idx){
                  return ContentCardView(device: model.device[idx],);
                },
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
              onPressed: () {
                if (_scrollController.hasClients) {
                  final position = _scrollController.position.maxScrollExtent;
                  _scrollController.animateTo(
                    position,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
              },
              isExtended: true,
              tooltip: 'Scroll to Top',
              backgroundColor: Colors.blue,
              child: Icon(Icons.arrow_upward),
              ),
              verticalSpaceSmall,
              FloatingActionButton(
                  onPressed: () {
                model.resetData();
              },
              backgroundColor: Colors.red,
              child: Text("RESET", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}