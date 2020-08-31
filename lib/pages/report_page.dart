import '../models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class ListPage extends StatefulWidget {
  /*ListPage({Key key, this.title}) : super(key: key);

  final String title;*/

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List contacts;

  @override
  void initState() {
    contacts = getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Contacts contacts) =>
        ListTile(

          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),

            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: IconButton( icon  : Icon(Icons.email, color: Colors.purple[700]),
            onPressed: (){
              UrlLauncher.launch('mailto:${contacts.emailAddress}');
            },)




          ),
          title: Text(
            contacts.name,
            style: TextStyle(color: Colors.purple[700], fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[

              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(contacts.telephone,
                        style: TextStyle(color: Colors.purple[600]))),
              )
            ],
          ),

          trailing:
          Icon(Icons.call, color: Colors.purple[700], size: 30.0),
          onTap: () {
            UrlLauncher.launch('tel:${contacts.telephone}');

          },

        );

    Card makeCard(Contacts contacts) =>
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            //decoration: BoxDecoration(color: Color.),
            child: makeListTile(contacts),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(contacts[index]);
        },
      ),
    );

    return Scaffold(


      body: makeBody,

    );
  }
}

List getContacts() {
  return [
    Contacts(
      name: "Sri Lanka Police",
      telephone: "119",
      emailAddress: "slpolice@gmail.com",
    ),
    Contacts(
        name: "Ministry of Women and Child Affairs",
        telephone: " 0112187274",
      emailAddress: "secycdwa@gmail.com"
    ),
    Contacts(
        name: "National Child Protection Authority",
        telephone: "0112778911",
      emailAddress: "ncpa@childprotection.gov.lk"
    ),
    Contacts(
        name: "Department of Probation and Child care Services",
        telephone: "0112187283",
        emailAddress: "cbsrilanka@gmail.com"
    ),
    Contacts(
        name: "Women In Need",
        telephone: "011 267 14 11",
      emailAddress: "connect@winsl.net"
    )
  ];
}
