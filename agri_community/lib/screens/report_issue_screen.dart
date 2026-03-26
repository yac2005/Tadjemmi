import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/data.dart';
import '../widgets/common_widgets.dart';

class ReportIssueScreen extends StatefulWidget {
  final String? preselectedPlant;

  const ReportIssueScreen({super.key, this.preselectedPlant});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  String? _selectedPlant;
  final TextEditingController _descController = TextEditingController();
  bool _hasPhoto = false;

  @override
  void initState() {
    super.initState();
    _selectedPlant = widget.preselectedPlant;
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_selectedPlant == null || _descController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill in all required fields.'),
          backgroundColor: AppColors.errorRed,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(16),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Text('✅  ', style: TextStyle(fontSize: 16)),
            Text(
              'Posted to community',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );

    // Reset form
    setState(() {
      _selectedPlant = null;
      _hasPhoto = false;
    });
    _descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Report Issue'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.divider),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
        children: [
          _buildInfoBanner(),
          const SizedBox(height: 20),
          _buildFormCard(),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Submit to Community',
            leadingEmoji: '📤',
            onPressed: _submit,
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Your post will be visible to all community members',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.tagBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB5D9BC)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('💬', style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Describe your plant issue and share it with the community. Other farmers will help you find a solution.',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.primary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fieldLabel('Plant Type *'),
            const SizedBox(height: 8),
            _buildDropdown(),
            const SizedBox(height: 20),
            _fieldLabel('Issue Description *'),
            const SizedBox(height: 8),
            TextField(
              controller: _descController,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                hintText: 'Describe the problem in detail...\n\nE.g. "Leaves have brown spots starting from the edges."',
              ),
            ),
            const SizedBox(height: 20),
            _fieldLabel('Photo (optional)'),
            const SizedBox(height: 8),
            _buildPhotoUploadArea(),
            const SizedBox(height: 20),
            _fieldLabel('Severity'),
            const SizedBox(height: 8),
            _buildSeveritySelector(),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedPlant,
          isExpanded: true,
          hint: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select plant type',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          borderRadius: BorderRadius.circular(12),
          dropdownColor: AppColors.surface,
          items: AppData.plantTypes.map((plant) {
            return DropdownMenuItem<String>(
              value: plant,
              child: Text(
                plant,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            );
          }).toList(),
          onChanged: (val) => setState(() => _selectedPlant = val),
        ),
      ),
    );
  }

  Widget _buildPhotoUploadArea() {
    return GestureDetector(
      onTap: () => setState(() => _hasPhoto = !_hasPhoto),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 120,
        decoration: BoxDecoration(
          color: _hasPhoto ? AppColors.tagBg : const Color(0xFFF5F2EC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hasPhoto ? AppColors.primaryLight : AppColors.divider,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: _hasPhoto
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('📷', style: TextStyle(fontSize: 28)),
                  const SizedBox(height: 6),
                  Text(
                    'photo_issue.jpg',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Tap to remove',
                    style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate_outlined,
                      size: 32, color: AppColors.textSecondary),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap to add photo',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'JPG, PNG up to 5MB',
                    style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildSeveritySelector() {
    final severities = [
      ('Low', '🟢'),
      ('Medium', '🟡'),
      ('High', '🔴'),
    ];

    return StatefulBuilder(
      builder: (context, setInner) {
        int selected = 1; // default Medium
        return Row(
          children: severities.asMap().entries.map((entry) {
            final i = entry.key;
            final s = entry.value;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i < 2 ? 8 : 0),
                child: GestureDetector(
                  onTap: () => setInner(() => selected = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: selected == i ? AppColors.tagBg : AppColors.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selected == i ? AppColors.primaryLight : AppColors.divider,
                        width: selected == i ? 1.5 : 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(s.$2, style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 4),
                        Text(
                          s.$1,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: selected == i
                                ? AppColors.primary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}