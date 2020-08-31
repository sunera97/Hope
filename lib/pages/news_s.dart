import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/products/newss.dart';
import '../widgets/location.dart';
import '../pages/aboutUs.dart';
import 'donation.dart';
import '../scoped-models/main.dart';
import '../widgets/ui_elements/logout.dart';
import 'report_page.dart';
import '../widgets/products/notifications/notifications.dart';
import 'package:The_Hope/widgets/main_map/map_details.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  initState() {
    widget.model.fetchProducts();
    super.initState();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              child: UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset('Assets/logopng.png'),
            accountEmail: Text("Welcome To HOPE", style: TextStyle(fontSize: 20,fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, color:Colors.purple,),),
            decoration: BoxDecoration(/*colors: [Color(0xFF0D47A1), Color(0xFF1E88E5)]*/color: Colors.purple[100]),
          )),
          ListTile(
            leading: Icon(Icons.account_box, color: Colors.purple[800],),
            title: Text('My Profile', style: TextStyle(fontSize: 17,fontStyle: FontStyle.normal, color: Colors.purple[800],),),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.purple[800],),
            title: Text('Donations', style: TextStyle(fontSize: 17,fontStyle: FontStyle.normal, color: Colors.purple[800],),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DonationPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.purple[800],),
            title: Text('Settings', style: TextStyle(fontSize: 17,fontStyle: FontStyle.normal, color: Colors.purple[800],),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          /*ListTile(

            leading: Icon(Icons.person_outline),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductListPage()),
              );

            },
          ),*/
          ListTile(
            leading: Icon(Icons.tag_faces, color: Colors.purple[800],),
            title: Text('About Us', style: TextStyle(fontSize: 17,fontStyle: FontStyle.normal, color: Colors.purple[800],),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Abtus()),
              );
            },
          ),
          LogoutListTile(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('HOPE'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.featured_play_list),
              text: 'News Feed',
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: 'Notifications',
            ),
            Tab(
              icon: Icon(Icons.report),
              text: 'Report',
            ),
          ]),
          actions: <Widget>[
            ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return IconButton(
                  icon: Icon(model.displayFavoritesOnly ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    model.toggleDisplayMode();
                  },
                );
              },
            ),
            ScopedModelDescendant<MainModel>(
                builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                  icon: Icon(Icons.zoom_out_map),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapSetting(model),
                      ),
                    );
                  });
            }),
          ],
        ),
        body: TabBarView(
          children: <Widget>[Products(), Notifications(), ListPage()],
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/admin');
          },
        ),
      ),
    );
  }
}
