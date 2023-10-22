import 'package:flutter/material.dart';
import 'package:showroom_app/src/main_model.dart';
import 'package:showroom_app/src/main_detailview.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class MainCustomView extends StatefulWidget {
  const MainCustomView({super.key});

  @override
  State<MainCustomView> createState() => _MainCustomViewState();
}

class _MainCustomViewState extends State<MainCustomView> {

  var showroomList = [
    Showroom(
      name: 'Audi R8 V10',
      image: 'images/audi_r8_v10.png',
      description:
      'Audi R8 V10 is a high-performance sports car produced by the German automaker Audi. It is known for its sleek and aggressive design, as well as its powerful V10 engine',
      merk: 'Audi',
    ),
    Showroom(
      name: 'Bugatti La Voiture Noire',
      image: 'images/bugatti_la_voiture_noire.png',
      description:
      'Bugatti La Voiture Noire is a hypercar produced by the French luxury automobile manufacturer Bugatti. "La Voiture Noire" translates to "The Black Car" in French, and it is often referred to as one of the most expensive and exclusive production cars in the world ',
      merk: 'Bugatti',
    ),
    Showroom(
      name: 'Ferrari Monza',
      image: 'images/ferrari_monza.png',
      description:
      'Ferrari Monza is a series of limited-production, open-top sports cars produced by the Italian automaker Ferrari. The Monza series pays tribute to Ferrari racing heritage and classic cars from the 1950s, particularly the iconic Ferrari 166 MM and 750 Monza models',
      merk: 'Ferrari',
    ),
    Showroom(
      name: 'Lamborghini Veneno',
      image: 'images/lamborghini_veneno.png',
      description:
      'Lamborghini Veneno is a limited-production hypercar built by the Italian automaker Lamborghini. It was unveiled at the 2013 Geneva Motor Show to celebrate Lamborghini 50th anniversary. The Veneno is known for its extreme styling, high performance, and exclusivity.',
      merk: 'Lamborghini',
    ),
    Showroom(
      name: 'McLaren Elva',
      image: 'images/mclaren_elva.png',
      description:
      'McLaren Elva is a limited-production, open-top supercar produced by the British automotive manufacturer McLaren. The Elva is part of McLarens Ultimate Series, which focuses on creating high-performance, track-focused vehicles.',
      merk: 'McLaren',
    ),
    Showroom(
      name: 'Mercedes AMG GT R',
      image: 'images/mercedes_amg_gt_r.png',
      description:
      'Mercedes-AMG GT R is a high-performance sports car produced by Mercedes-AMG, the performance division of Mercedes-Benz. It is part of the AMG GT series and is known for its exceptional performance, aerodynamics, and distinctive styling.',
      merk: 'Mercedes',
    ),
    Showroom(
      name: 'Minicooper Clubman',
      image: 'images/minicooper_clubman.png',
      description:
      'Mini Cooper Clubman is a compact car produced by MINI, a British automotive brand that is now owned by BMW. The Clubman is known for its distinctive and quirky design, as well as its slightly larger size compared to the standard MINI Cooper models.',
      merk: 'BMW',
    ),
    Showroom(
      name: 'Rolls Royce Boat Tail',
      image: 'images/rolls_royce_boat_tail.png',
      description:
      'Boat Tail’s nautical form evokes graceful J-class yachts and a 1932 Rolls-Royce Boat Tail the owners lovingly restored as part of their expansive collection',
      merk: 'Rolls Royce',
    ),
    Showroom(
      name: 'SP Chaos',
      image: 'images/minicooper_clubman.png',
      description:
      'SP Chaos is a new hypercar from a Greek company called Spyros Panopoulos Automotive (SP Automotive). It claims to be the world first "ultracar" with up to 3,000 horsepower and a top speed of over 500 km/h. It has a twin-turbocharged 4.0-liter V10 engine with a hybrid system and a dual-clutch transmission. It also has carbon fiber, titanium, magnesium, and ceramic components to reduce weight and increase performance. The SP Chaos is expected to debut in 2022 and will cost 14.4 million USD for the most powerful version',
      merk: 'SP Automative',
    ),
  ];

  var countMain = 0;
  bool isLoading = false;

  void addData() {
    if (countMain < 10) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(msg: "This app is loading..");
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          showroomList.add(showroomList[countMain]);
          countMain++;
          progressDialog.close();
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Showroom Apps"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countMain < 10 ? addData : null,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: showroomList.length,
        itemBuilder: (context, position) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          showroomList[position].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    showroomList[position].name,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainDetailView(
                          name: showroomList[position].name,
                          image: showroomList[position].image,
                          description: showroomList[position].description,
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}
