import 'package:flutter/material.dart';

import './news_edit.dart';
import './news_list.dart';
import '../scoped-models/main.dart';
import '../widgets/ui_elements/logout.dart';


class ProductsAdminPage extends StatelessWidget {

  final MainModel model;

  ProductsAdminPage(this.model);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('HOPE'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Posts/News'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
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
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Post/News'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Add Post/News',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Posts',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductEditPage(), ProductListPage(model)],
        ),
      ),
    );
  }
}
