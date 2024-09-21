import 'package:flutter/material.dart';


class HousingPage extends StatefulWidget {
  const HousingPage({super.key});

  @override
  State<HousingPage> createState() => _HousingPageState();
}


class _HousingPageState extends State<HousingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 82, 75),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 82, 75),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 121, 255, 203),),
          onPressed: () {
            Navigator.pop(context); // Volta para a FeedPage
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: Text("Para onde?", style: TextStyle(color: Color.fromARGB(255, 121, 255, 203)),),
              dropdownColor: Color.fromARGB(255, 121, 255, 203),
              items: <String>['São Paulo - SP', 'São José dos Campos - SP', 'Campinas - SP']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Lógica para mudar a opção selecionada
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 10, // Substitua pelo número desejado
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Color.fromARGB(255, 22, 127, 108),
                      child: Column(
                        children: [
                          Expanded(child: Center(
                            child: Icon(Icons.house, size: 50, color: Color.fromARGB(255, 121, 255, 203),),
                          )),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Casa ${index + 1}', style: TextStyle(color: Color.fromARGB(255, 121, 255, 203)),),
                              Text('Descrição da casa ${index + 1}', style: TextStyle(color: Color.fromARGB(255, 121, 255, 203)),),
                              Text('Valor da casa ${index + 1}', style: TextStyle(color: Color.fromARGB(255, 121, 255, 203)),)
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                ),
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
        
      ),
      
    );
    
  }
}
