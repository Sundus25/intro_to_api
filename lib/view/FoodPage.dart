import 'package:flutter/material.dart';
import '../service/FoodApi.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 59,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      borderSide: BorderSide(color: Colors.grey)),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.orange,
                    size: 24,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 13,
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),
                  hintText: "Search Food..",
                  hintStyle: TextStyle(
                    color: Color(0XFFcbcbd4),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  fillColor: Color(0XFFf8f7fa),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0XFFcbcbd4)),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: getDataOfFood(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 670,
                    width: 650,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            width: 150,
                            child: Card(
                              color: Colors.white,
                              surfaceTintColor: Colors.orange,
                              child: ListTile(
                                leading: Container(
                                  height: 130,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              snapshot.data![index].image))),
                                ),
                                title: Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  snapshot.data![index].description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                trailing: Text(
                                  snapshot.data![index].price,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 249, 79, 79),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}


