import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/screens/experience_detail_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ExperienceListScreen extends StatefulWidget {
  const ExperienceListScreen({super.key});

  @override
  State<ExperienceListScreen> createState() => _ExperienceListScreenState();
}

class _ExperienceListScreenState extends State<ExperienceListScreen> {
  late Future<List<Experience>> _experiencesFuture;

  @override
  void initState() {
    super.initState();
    _experiencesFuture = context.read<ApiClient>().getExperiences();
  }

  Future<void> _reload() async {
    final future = context.read<ApiClient>().getExperiences();
    setState(() {
      _experiencesFuture = future;
    });
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achievements: Experiences')),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<Experience>>(
        future: _experiencesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Failed to load experiences: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _reload,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final experiences = snapshot.data ?? const <Experience>[];
          if (experiences.isEmpty) {
            return RefreshIndicator(
              onRefresh: _reload,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: Text("No experiences found."),
                ),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _reload,
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final experience = experiences[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: ListTile(
                        title: Text(experience.title),
                        subtitle: Text(experience.description),
                        trailing: Text(experience.category),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ExperienceDetailScreen(experience),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
