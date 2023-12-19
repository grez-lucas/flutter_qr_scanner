import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_models.dart';
import '../services/app_services.dart';

class ScanListView extends StatelessWidget {
  const ScanListView({
    super.key,
    required this.scans,
  });

  final List<ScanModel> scans;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListService>(context, listen: false)
                    .deleteScanById(scans[index].id!);
              },
              child: ListTile(
                leading: Icon(
                    scans[index].type == 'geo'
                        ? Icons.network_wifi_3_bar_rounded
                        : Icons.grid_on_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[index].value),
                subtitle: Text('ID: ${scans[index].id}'),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () {
                  print(scans[index].id);
                },
                splashColor: Theme.of(context).primaryColorLight,
              ),
            ));
  }
}
