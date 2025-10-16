import 'package:flutter/material.dart';
import 'package:gameof_throne/entities/person.dart';
import 'package:gameof_throne/services/person_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Person>> futurePersons;

  TextEditingController searchController = TextEditingController();

  String selectedCasas = "Casas";
  String selectedEstado = "Estado";

  void searchOnChanged(String value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    futurePersons = PersonServices().getAllPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personaje de poniente",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchOnChanged,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                hintText: "Buscar..",
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  menuWidth: 200,
                  value: selectedCasas,
                  items: [
                    DropdownMenuItem(value: "Casas", child: Text("Casas")),
                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedCasas = value!;
                    });
                  },
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 24),
                DropdownButton<String>(
                  menuWidth: 200,
                  value: selectedEstado,
                  items: [
                    DropdownMenuItem(value: "Estado", child: Text("Estado")),
                    DropdownMenuItem(value: "Vivo", child: Text("Vivo")),
                    DropdownMenuItem(value: "Muerto", child: Text("Muerto")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedEstado = value!;
                    });
                  },
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Person>>(
                future: futurePersons,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        Person person = snapshot.data![index];
                        return ListTile(
                          onTap: () {
                            print(person.id);
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(person.imageUrl),
                          ),
                          title: Text(
                            person.fullName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
