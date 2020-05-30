class ComplaintCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        complaintCardWidget(
            "imageurl", "companyName", "subjectComplaint", "status")
      ],
    );
  }
}

Widget complaintCardWidget(
  String imageurl,
  String companyName,
  String subjectComplaint,
  String status,
) {
  return Padding(
    padding: EdgeInsets.only(left: 100, right: 100),
    child: Container(
      height: 2 * SizeConfig.heightMultiplier,
      child: Card(
        shape:
            (RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: 500,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image.asset(
                      imageurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 6.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            companyName,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 6.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        subjectComplaint,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff1089ff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 12),
              child: Container(
                width: 300,
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 7.0),
          ],
        ),
      ),
    ),
  );
}
