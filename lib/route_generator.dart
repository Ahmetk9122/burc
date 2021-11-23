import 'package:burc/burc_detay.dart';
import 'package:burc/burc_listesi.dart';
import 'package:burc/model/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator
{
  static Route<dynamic>? routeGenerator(RouteSettings settings)
{
  switch(settings.name)
  {
    case"/":
    return MaterialPageRoute(
      builder: (context)=> BurcListesi(),
      );
    case"/burcDetay":
    {
      final Burc secilenBurc =settings.arguments as Burc;
      return MaterialPageRoute(builder: (context)=>BurcDetay(secilenBurc: secilenBurc),);
    }
  }
}

}