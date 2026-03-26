import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/common_widgets.dart';
import 'report_issue_screen.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Tomatoes'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.divider),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
        children: [
          _buildHeroCard(),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Plant Status'),
          const SizedBox(height: 12),
          _buildStatusCard(),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Care History'),
          const SizedBox(height: 12),
          _buildCareHistoryCard(),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Growth Tracker'),
          const SizedBox(height: 12),
          _buildGrowthCard(),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Report Issue',
            leadingEmoji: '⚠️',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportIssueScreen(preselectedPlant: 'Tomato')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF4FAF5), Color(0xFFE6F4E8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.divider),
            ),
            child: const Center(
              child: Text('🍅', style: TextStyle(fontSize: 42)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tomatoes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Solanum lycopersicum',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _statBadge('20', 'Plants'),
                    const SizedBox(width: 8),
                    _statBadge('Bed A3', 'Zone'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBadge(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overall Health',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      StatusIndicator(status: 'Needs Attention', colorCode: 'warn'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFFE082)),
                  ),
                  child: const Text(
                    '⚠️  Action needed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7A5200),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.divider, height: 1),
            const SizedBox(height: 16),
            const InfoRow(label: 'Last watered', value: 'Yesterday'),
            const InfoRow(label: 'Last fertilized', value: '5 days ago'),
            const InfoRow(label: 'Next watering', value: 'Today', highlight: true),
            const InfoRow(label: 'Soil moisture', value: 'Low 🔴'),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5FB),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBEDFF0)),
              ),
              child: const Row(
                children: [
                  Text('💧', style: TextStyle(fontSize: 22)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suggestion',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Water today — soil moisture is critically low.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A5276),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareHistoryCard() {
    final history = [
      ('💧', 'Watered', 'Yesterday, 8:00 AM'),
      ('✂️', 'Pruned lower leaves', '3 days ago'),
      ('🌱', 'Fertilized (NPK)', '5 days ago'),
      ('💧', 'Watered', '6 days ago'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: history.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            final isLast = i == history.length - 1;
            return Column(
              children: [
                Row(
                  children: [
                    Text(item.$1, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (!isLast) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 1,
                        height: 14,
                        color: AppColors.divider,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildGrowthCard() {
    final stages = [
      ('Seeding', true),
      ('Sprouting', true),
      ('Vegetative', true),
      ('Flowering', false),
      ('Harvest', false),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Stage: Vegetative 🌿',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: stages.asMap().entries.map((entry) {
                final i = entry.key;
                final stage = entry.value;
                final isLast = i == stages.length - 1;
                final isCurrent = i == 2;
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: stage.$2
                                    ? AppColors.primary
                                    : isCurrent
                                        ? AppColors.accent
                                        : AppColors.divider,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                stage.$2 ? Icons.check : Icons.circle,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              stage.$1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: stage.$2 ? AppColors.primary : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isLast)
                        Expanded(
                          child: Container(
                            height: 2,
                            color: stage.$2 ? AppColors.primaryLight : AppColors.divider,
                            margin: const EdgeInsets.only(bottom: 18),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}