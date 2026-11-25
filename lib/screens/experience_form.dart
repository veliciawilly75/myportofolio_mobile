import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();
  final now = DateTime.now();

  String _experienceName = "";
  String _description = "";
  String _category = '';
  DateTime? _startedAt = DateTime.now();
  DateTime? _endedAt;

  final List<String> _categories = [
    'Internship',
    'Research',
    'Volunteer',
    'Part-Time',
    'Full-Time',
    'Freelance',
  ];

  // === Fungsi untuk date picker ===
  Future<void> _selectStartDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, now.day),
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    setState(() {
      // Validasi dan set nilai
      if (pickedDate != null) {
        _startedAt = pickedDate;
      }
    });
  }

  Future<void> _selectEndDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, now.day),
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    setState(() {
      // Validasi dan set nilai
      // Memastikan end date berada setelah start date
      if (pickedDate!.isAfter(_startedAt!)) {
        _endedAt = pickedDate;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("End date has to be after Start date!")),
        );
      }
    });
  }
  // ==================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Experience Form')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Experience Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Experience Name",
                    labelText: "Experience Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _experienceName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Experience name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Experience Description",
                    labelText: "Experience Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Experience description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  hint: Text('Select'),
                  decoration: InputDecoration(
                    labelText: "Experience Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _categories.contains(_category)
                      ? _category
                      : null,
                  items: _categories
                      .map(
                        (category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return "Experience category cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Started At ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // Menampilkan instruksi pengisian atau tanggal yang dipilih
                      _startedAt == null
                          ? 'Select start date'
                          : '${_startedAt!.year}-${_startedAt!.month}-${_startedAt!.day}',
                    ),
                    ElevatedButton(
                      onPressed: _selectStartDate,
                      child: const Text('Select Date'),
                    ),
                  ],
                ),
              ),

              // === Ended At ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // Menampilkan instruksi pengisian atau tanggal yang dipilih
                      _endedAt == null
                          ? 'Select end date'
                          : '${_endedAt!.year}-${_endedAt!.month}-${_endedAt!.day}',
                    ),
                    ElevatedButton(
                      onPressed: _selectEndDate,
                      child: const Text('Select Date'),
                    ),
                  ],
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Experience successfully added!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Experience: $_experienceName'),
                                    Text('Description: $_description'),
                                    Text('Category: $_category'),
                                    Text(
                                      'Started at: ${_startedAt!.year}-${_startedAt!.month}-${_startedAt!.day}',
                                    ),
                                    // Menampilkan teks 'Ongoing' apabila Experience belum memiliki tanggal akhir
                                    Text(
                                      _endedAt == null
                                          ? 'Ongoing'
                                          : 'Ended at : ${_endedAt!.year}-${_endedAt!.month}-${_endedAt!.day}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
