import 'package:flutter/material.dart';

class Rijal24 extends StatelessWidget {
  const Rijal24({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wilujeung sumping pak alamsyah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WidgetKompleksPage(),
    );
  }
}

class WidgetKompleksPage extends StatelessWidget {
  const WidgetKompleksPage({super.key});

  final List<Map<String, String>> listData = const [
    {'nama': 'Rijal Rizki Fauzi', 'deskripsi': 'Flutter Developer'},
    {'nama': 'Azril', 'deskripsi': 'UI/UX Designer'},
    {'nama': 'Curos', 'deskripsi': 'Backend Engineer'},
    {'nama': 'Ranzi', 'deskripsi': 'Project Manager'},
  ];

  final List<Map<String, dynamic>> gridData = const [
    {'icon': Icons.phone_android, 'label': 'Gadget'},
    {'icon': Icons.laptop_mac, 'label': 'Laptop'},
    {'icon': Icons.headphones, 'label': 'Audio'},
    {'icon': Icons.watch, 'label': 'Smartwatch'},
    {'icon': Icons.camera_alt, 'label': 'Kamera'},
    {'icon': Icons.tv, 'label': 'Televisi'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wilujeung sumping pak alamsyah'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade600,
        elevation: 4,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Tim:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final item = listData[index];
                  return Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 6,
                    shadowColor: Colors.teal.shade200,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.teal.shade400,
                        child: Text(
                          item['nama']![0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        item['nama']!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item['deskripsi']!,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                        size: 18,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Anda menekan ${item['nama']}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              const Text(
                'Kategori Produk:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                physics: const NeverScrollableScrollPhysics(),
                children: gridData.map((item) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Anda memilih ${item['label']}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shadowColor: Colors.teal.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.teal.shade50,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Icon(
                              item['icon'],
                              size: 40,
                              color: Colors.teal.shade600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['label'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
