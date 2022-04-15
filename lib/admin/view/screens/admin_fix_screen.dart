import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/fix_card.dart';

import '../../../fix/bloc/fix_bloc.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';

class AdminFixScreen extends StatefulWidget {
  static const String route = '/fix_screen';
  const AdminFixScreen({Key? key}) : super(key: key);

  @override
  State<AdminFixScreen> createState() => _AdminFixScreenState();
}

class _AdminFixScreenState extends State<AdminFixScreen> {
  @override
  void initState() {
    super.initState();
    //Loading fix requests.
    BlocProvider.of<FixBloc>(context).add(FixGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const AppTitleAppBar(
            textColor: Colors.black, title: 'Fix Requests'),
      ),
      body: BlocBuilder<FixBloc, FixState>(builder: (context, state) {
        return ListView.builder(
          itemCount: state.fixList.length,
          itemBuilder: (BuildContext context, int index) {
            return FixCard(
              fix: state.fixList[index],
            );
          },
        );
      }),
    );
  }
}
