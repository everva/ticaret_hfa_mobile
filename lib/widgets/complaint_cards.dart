import 'package:flutter/material.dart';

class ComplaintCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[complaintCardWidget()],
    );
  }
}

Widget complaintCardWidget() {
  return Center(
    child: Container(
      child: Card(
        color: Colors.white,
        shape: (RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        )),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.apps),
              title: Text("Tarih: 20.05.2020"),
              subtitle: Text("Everva Bilişim A.Ş"),
              trailing: Icon(Icons.navigate_next),
              isThreeLine: true,
            )
          ],
        ),
      ),
    ),
  );
}
