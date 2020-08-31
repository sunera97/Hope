import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/news_admin.dart';
import './pages/news_s.dart';
import './pages/news_p.dart';
import './models/news.dart';
//import 'package:map_view/map_view.dart';

import 'package:The_Hope/scoped-models/main.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  //MapView.setApiKey('AIzaSyA15LNe-FLQu6rjYyo6TwozTkMRUdSKsJE');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
final MainModel _model = MainModel();
bool _isAuthenticated = false;

  @override
  void initState() {
   _model.autoAuthentication();
   _model.userSubject.listen((bool isAuthenticated){
     setState(() {
       _isAuthenticated = isAuthenticated;
     });
   });
   
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    
    return ScopedModel<MainModel>(
      model: _model,
      child:  MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.purple,
            accentColor: Colors.purple,
            buttonColor: Colors.purple),
        // home: AuthPage(),
        routes: {
          '/': (BuildContext context) =>  
          !_isAuthenticated ? AuthPage(): ProductsPage(_model),
          
          //'/products': (BuildContext context) => ProductsPage(_model),
          '/admin': (BuildContext context) => 
           !_isAuthenticated ? AuthPage() : ProductsAdminPage(_model),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (!_isAuthenticated) {
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => AuthPage(),
            );
          }
          final List<String> pathElements = settings.name.split('/'); 
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final News product = _model.allproducts.firstWhere((News product){
              return product.id == productId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  !_isAuthenticated ? AuthPage() :ProductPage(product),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => 
               !_isAuthenticated ? AuthPage() : ProductsPage(_model));
        },
      ),
    );
  }
}
