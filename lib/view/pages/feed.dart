import 'package:flutter/material.dart';
import 'package:projeto_unitudo_flutter/view/pages/moradia.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 82, 75),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: const Color.fromARGB(255, 22, 127, 108),
            child: Stack(
              children: [
              Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                  icon: const Icon(Icons.person_2,
                      color: Color.fromARGB(255, 121, 255, 203)),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: const Icon(Icons.filter_alt,
                      color: Color.fromARGB(255, 121, 255, 203)),
                  onPressed: () {},
                ),
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        filled: true,
                        fillColor: const Color.fromARGB(255, 81, 196, 144),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HousingPage()));},
                            label: const Icon(
                              Icons.house_outlined,
                              color: Color.fromARGB(255, 21, 100, 63),
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 81, 196, 144),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: const Icon(
                              Icons.directions_bus_filled_outlined,
                              color: Color.fromARGB(255, 21, 100, 63),
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 81, 196, 144),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          )
                        ]),
                  ])),
              ])),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.home,
                            size: 50,
                            color: Colors.greenAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Postagem ${index + 1}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.thumb_up,
                                    color: Colors.greenAccent),
                                onPressed: () {
                                  // Ação do like
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.thumb_down,
                                    color: Colors.greenAccent),
                                onPressed: () {
                                  // Ação do dislike
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            Container(
            height: MediaQuery.of(context).size.height *
                0.10, // Cerca de 10% da altura da página
            color: const Color.fromARGB(255, 22, 127, 108), // Cor de fundo do rodapé
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Distribui os ícones igualmente
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: const Color.fromARGB(255, 121, 255, 203),
                  onPressed: () {
                    // Ação do botão
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: const Color.fromARGB(255, 121, 255, 203),
                  onPressed: () {
                    // Ação do botão
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  color: const Color.fromARGB(255, 121, 255, 203),
                  onPressed: () {
                    // Ação do botão
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: const Color.fromARGB(255, 121, 255, 203),
                  onPressed: () {
                    // Ação do botão
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
