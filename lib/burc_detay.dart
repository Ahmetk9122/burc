import 'package:burc/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc , Key? key}) : super(key: key);
  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
Color appbarRengi =Colors.transparent;
 late PaletteGenerator _generator;
  //sadece bir kere kullanıyoruz bunu da uygulamamızdaki ilk atamaları yaprken kullanıyoruz.
@override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_)=>appbarRenginiBul());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.secilenBurc.burcAdi+" Burcu ve Özellikleri"),
            centerTitle: true,
            background: Image.asset("assets/images/"+widget.secilenBurc.burcBuyukResim,
            fit:BoxFit.cover,),),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  color: Colors.amber,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(

                    title: Text("Genel Özellikler",textAlign: TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                  ),
      ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child:Text(
                      widget.secilenBurc.burcDetayi
                      ,style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  void appbarRenginiBul() async{
    _generator=await PaletteGenerator.fromImageProvider(AssetImage("assets/images/${widget.secilenBurc.burcBuyukResim}"));
    setState(() {
         
    });
  appbarRengi=_generator.dominantColor!.color;

  }
}