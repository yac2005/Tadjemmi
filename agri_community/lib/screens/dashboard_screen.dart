import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/data.dart';
import '../widgets/common_widgets.dart';
import 'plant_detail_screen.dart';
import 'report_issue_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Garden'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.divider),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
        children: [
          _buildWeatherBanner(),
          const SizedBox(height: 20),
          const SectionHeader(
            title: 'Garden Summary',
            subtitle: 'Your plant inventory',
          ),
          const SizedBox(height: 12),
          _buildGardenSummaryCard(),
          const SizedBox(height: 24),
          const SectionHeader(
            title: "Today's Suggestions",
            subtitle: 'Based on current conditions',
          ),
          const SizedBox(height: 12),
          _buildSuggestionsCard(),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Quick Actions'),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'View Plants',
            leadingEmoji: '🌱',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PlantDetailScreen()),
              );
            },
          ),
          const SizedBox(height: 10),
          SecondaryButton(
            label: 'Report Issue',
            leadingEmoji: '⚠️',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportIssueScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5FB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFBEDFF0)),
      ),
      child: Row(
        children: [
          const Text('☀️', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sétif — Today: 22°C, Sunny',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Good conditions for outdoor work',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGardenSummaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...AppData.gardenStats.asMap().entries.map((entry) {
              final stat = entry.value;
              final isLast = entry.key == AppData.gardenStats.length - 1;
              return Column(
                children: [
                  Row(
                    children: [
                      EmojiAvatar(emoji: stat.emoji, size: 40),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stat.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 3),
                            StatusIndicator(
                              status: stat.status,
                              colorCode: stat.statusColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.tagBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${stat.count}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!isLast) ...[
                    const SizedBox(height: 10),
                    const Divider(color: AppColors.divider, height: 1),
                    const SizedBox(height: 10),
                  ],
                ],
              );
            }),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.tagBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text('🌿', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Total: 35 plants across 3 species',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
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

  Widget _buildSuggestionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: AppData.todaySuggestions.asMap().entries.map((entry) {
            final i = entry.key;
            final suggestion = entry.value;
            final isLast = i == AppData.todaySuggestions.length - 1;
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(top: 6, right: 10),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        suggestion,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                if (!isLast) const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}