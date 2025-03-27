import 'package:flutter/material.dart';

class FishDesc extends StatelessWidget {
  FishDesc({super.key});

  final List<Map<String, dynamic>> fishDetails = [
    {
      'title': 'Aquarium Care Standards',
      'details': [
        'Water Temperature: 72 - 82°F (22 - 28°C)',
        'pH Level: 6.5 - 7.5',
        'Water Hardness: 8 - 12 dGH',
      ],
    },
    {
      'title': 'Feed & Diet',
      'details': [
        'Diet Type: Omnivore',
        'Preferred Food:',
        '- High-protein fish feed or Fish flakes',
        '- Frozen-dried bloodworms, daphnia, brine shrimp',
        '- Blanched leafy vegetables (Zucchini, Spinach, etc.)',
        'Feeding Frequency: 1-2 times a day in small amounts',
      ],
    },
    {
      'title': 'Compatibility',
      'details': [
        'Aggression Level: Peaceful',
        'Behavior: Prefers to be in groups of 3 or more',
      ],
    },
    {
      'title': 'For inquiries, orders, feel free to reach out to us.',
      'details': [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: fishDetails.length,
          itemBuilder: (context, index) {
            final item = fishDetails[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...item['details'].map<Widget>(
                      (detail) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 2),
                        child: Text(detail, style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
