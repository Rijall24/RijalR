import 'package:flutter/material.dart';

class ListView1 extends StatelessWidget {
  const ListView1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List & Grid dalam Satu Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView & GridView dalam 1 Card'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===============================
                // BAGIAN LIST VIEW
                // ===============================
                const Text(
                  'Daftar Mahasiswa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Mahasiswa 1'),
                      subtitle: Text('Flutter Developer'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Mahasiswa 2'),
                      subtitle: Text('UI Designer'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Mahasiswa 3'),
                      subtitle: Text('Data Analyst'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ===============================
                // BAGIAN GRID VIEW
                // ===============================
                const Text(
                  'Grid Item (4)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(4, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[(index + 2) * 100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Item ${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // ===============================
                // CARD PROFILE TAMBAHAN (DALAM CARD UTAMA)
                // ===============================
                const Divider(),
                const ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.teal,
                  ),
                  title: Text('Rijal Rizki Fauzi'),
                  subtitle: Text('Pemrograman Mobile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
