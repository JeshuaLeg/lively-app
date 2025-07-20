import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class CreateSessionScreen extends ConsumerWidget {
  const CreateSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Focus Session'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Session Title
            TextField(
              decoration: const InputDecoration(
                labelText: 'Session Title',
                hintText: 'Enter a title for your focus session',
              ),
            ),
            const SizedBox(height: 24),
            
            // Duration Selection
            Text(
              'Duration',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDurationCard(context, '25 min', 'Pomodoro'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDurationCard(context, '45 min', 'Deep Work'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDurationCard(context, '90 min', 'Flow State'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Difficulty Level
            Text(
              'Difficulty Level',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildDifficultyOption(context, 'Normal', 'Can pause and cancel anytime'),
            _buildDifficultyOption(context, 'Timeout', 'Must wait 30 seconds to cancel'),
            _buildDifficultyOption(context, 'Deep Focus', 'Cannot cancel or pause'),
            const SizedBox(height: 24),
            
            // Schedule Option
            SwitchListTile(
              title: const Text('Schedule Session'),
              subtitle: const Text('Set a specific time for this session'),
              value: false,
              onChanged: (value) {
                // TODO: Implement scheduling
              },
            ),
            const SizedBox(height: 24),
            
            // Create Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Session created successfully!')),
                );
                context.pop();
              },
              child: const Text('Create Session'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationCard(BuildContext context, String duration, String label) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Select duration
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                duration,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyOption(BuildContext context, String title, String description) {
    return Card(
      child: RadioListTile<String>(
        title: Text(title),
        subtitle: Text(description),
        value: title.toLowerCase(),
        groupValue: 'normal',
        onChanged: (value) {
          // TODO: Select difficulty
        },
      ),
    );
  }
}