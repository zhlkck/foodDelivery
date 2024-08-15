import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommer/pages/details.dart';
import 'package:ecommer/service/database.dart';
import 'package:ecommer/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  Stream? fooditemStream;
  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }
  Widget allItemsVerticaly() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.lenght,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                     borderRadius: BorderRadius.circular(20),
                                    child: Image.network("image",
                                    
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(ds["Name"],
                                      style:
                                          AppWidget.semiBooldTextFeildStyle()),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Taze ve Sağlıklı",
                                      style: AppWidget.LightTextFeildStyle()),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("\TL"+ds["Price"],
                                      style:
                                          AppWidget.semiBooldTextFeildStyle())
                                ],
                              )),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.lenght,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                     borderRadius: BorderRadius.circular(20),
                                    child: Image.network("image",
                                    
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(ds["Name"],
                                      style:
                                          AppWidget.semiBooldTextFeildStyle()),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Taze ve Sağlıklı",
                                      style: AppWidget.LightTextFeildStyle()),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("\TL"+ds["Price"],
                                      style:
                                          AppWidget.semiBooldTextFeildStyle())
                                ],
                              )),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 50.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Merhaba Zuhal,", style: AppWidget.boldTextFeildStyle()),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text("Lezzetli Yemek", style: AppWidget.HeadLineTextFeildStyle()),
            Text("Harika yiyecekler keşfedin ve alın",
                style: AppWidget.LightTextFeildStyle()),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                margin: const EdgeInsets.only(right: 20.0), child: showItem()),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 270,
              child: allItems()),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Akdeniz nohut salatası",
                                style: AppWidget.semiBooldTextFeildStyle(),
                              )),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "bal keçi peynirli",
                                style: AppWidget.LightTextFeildStyle(),
                              )),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "\240 TL",
                                style: AppWidget.semiBooldTextFeildStyle(),
                              ))
                        ])
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: icecream ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/ice-cream.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: icecream ? Colors.white : Colors.black)),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: pizza ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/pizza.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: pizza ? Colors.white : Colors.black)),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: salad ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/salad.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: salad ? Colors.white : Colors.black)),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: burger ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/burger.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: burger ? Colors.white : Colors.black)),
          ),
        ),
      ],
    );
  }
}
