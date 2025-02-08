import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'app_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppDatabase database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift and Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(database: database),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppDatabase database;
  const HomeScreen({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة النباتات')),
      body: Column(
        children: [
          Expanded(child: PlantList(database: database)),
          PlantInputForm(database: database),
        ],
      ),
    );
  }
}

class PlantList extends StatelessWidget {
  final AppDatabase database;
  const PlantList({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Plant>>(
      stream: database.watchAllPlants(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final plants = snapshot.data!;
        return ListView.builder(
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final plant = plants[index];
            return ListTile(
              title: Text(plant.name),
              subtitle: Text('السعر: ${plant.price} | العمر: ${plant.age} يوم'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => database.deletePlant(plant),
              ),
            );
          },
        );
      },
    );
  }
}

class PlantInputForm extends StatefulWidget {
  final AppDatabase database;
  const PlantInputForm({Key? key, required this.database}) : super(key: key);

  @override
  _PlantInputFormState createState() => _PlantInputFormState();
}

class _PlantInputFormState extends State<PlantInputForm> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _ageController = TextEditingController();

  void _addPlant() {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final age = int.tryParse(_ageController.text) ?? 0;

    if (name.isNotEmpty) {
      final plant = PlantsCompanion(
        name: drift.Value(name),
        price: drift.Value(price),
        age: drift.Value(age),
      );
      widget.database.insertPlant(plant);
      _nameController.clear();
      _priceController.clear();
      _ageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'اسم النبات')),
          TextField(controller: _priceController, decoration: const InputDecoration(labelText: 'السعر'), keyboardType: TextInputType.number),
          TextField(controller: _ageController, decoration: const InputDecoration(labelText: 'العمر (أيام)'), keyboardType: TextInputType.number),
          ElevatedButton(onPressed: _addPlant, child: const Text('إضافة نبات')),
        ],
      ),
    );
  }
}
