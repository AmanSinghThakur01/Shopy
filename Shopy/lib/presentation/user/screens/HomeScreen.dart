import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, String>> categories = [
    {"name": "Beauty", "image": "https://wallpapercave.com/wp/wp12244854.jpg"},
    {"name": "Fashion", "image": "https://via.placeholder.com/100"},
    {"name": "Kids", "image": "https://via.placeholder.com/100"},
    {"name": "Mens", "image": "https://via.placeholder.com/100"},
    {"name": "Womens", "image": "https://via.placeholder.com/100"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Stylish",
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150"),
                radius: 18,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: " Search any Product.....",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),


                ),
              ),

              SizedBox(height: size.height * 0.02,),
              //All featured
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" All Featured ", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          debugPrint("Sort clicked");
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide.none
                          ),
                        ),
                        icon: const Icon(
                            Icons.sort, color: Colors.black, size: 18),
                        label: const Text(
                          "Sort",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: () {
                          debugPrint("Filter clicked");
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide.none
                          ),
                        ),
                        icon:
                        const Icon(
                            Icons.filter_list, color: Colors.black, size: 18),
                        label: const Text(
                          "Filter",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
              SizedBox(
                height: size.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(category['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height:1),
                          Text(
                            category['name']!,
                            style: const TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
}