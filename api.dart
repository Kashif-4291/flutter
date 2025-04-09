import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'db.dart'; // Import database helper

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<Map<String, dynamic>> apiData = [];
  bool isLoading = false;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('https://bgnuerp.online/api/gradeapi'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        await DatabaseHelper.instance.insertApiData(List<Map<String, dynamic>>.from(data));

        await loadDataFromDB();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data successfully inserted into database')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load data')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $error')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadDataFromDB() async {
    List<Map<String, dynamic>> data = await DatabaseHelper.instance.getApiData();
    setState(() {
      apiData = data;
    });
  }

  Future<void> resetData() async {
    await DatabaseHelper.instance.clearApiData();
    await loadDataFromDB();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data successfully removed from database')),
    );
  }

  Future<void> deleteData(int id) async {
    await DatabaseHelper.instance.deleteApiDataById(id);
    await loadDataFromDB();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item deleted successfully')),
    );
  }

  @override
  void initState() {
    super.initState();
    loadDataFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Screen')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'API Screen',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 2, color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: fetchData,
                  child: const Text('Load Data'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: resetData,
                  child: const Text('Reset Data'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : apiData.isEmpty
                    ? const Center(child: Text('No data available'))
                    : ListView.builder(
                        itemCount: apiData.length,
                        itemBuilder: (context, index) {
                          var item = apiData[index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                '${item['coursecode']} - ${item['coursetitle']}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Credit Hours: ${item['credithours']}'),
                                  Text('Marks: ${item['obtainedmarks']}'),
                                  Text('Semester: ${item['mysemester']}'),
                                  Text('Consider Status: ${item['consider_status']}'),
                                  Text('Roll No: ${item['rollno']}'),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteData(item['id']);
                                },
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
