class CommunityPost {
  final String id;
  final String plantType;
  final String problem;
  final String author;
  final String timeAgo;
  final int replies;
  final String emoji;
  final String? tag;

  const CommunityPost({
    required this.id,
    required this.plantType,
    required this.problem,
    required this.author,
    required this.timeAgo,
    required this.replies,
    required this.emoji,
    this.tag,
  });
}

class PlantStat {
  final String name;
  final int count;
  final String emoji;
  final String status;
  final String statusColor; // 'good', 'warn', 'bad'

  const PlantStat({
    required this.name,
    required this.count,
    required this.emoji,
    required this.status,
    required this.statusColor,
  });
}

class AppData {
  static const List<CommunityPost> posts = [
    CommunityPost(
      id: '1',
      plantType: 'Palm Tree',
      problem: 'Leaves turning yellow at the tips — started 3 days ago.',
      author: 'Karim B.',
      timeAgo: '2h ago',
      replies: 4,
      emoji: '🌴',
      tag: 'Urgent',
    ),
    CommunityPost(
      id: '2',
      plantType: 'Tomatoes',
      problem: 'Small brown spots appearing on lower leaves.',
      author: 'Fatima A.',
      timeAgo: '5h ago',
      replies: 7,
      emoji: '🍅',
      tag: 'Disease',
    ),
    CommunityPost(
      id: '3',
      plantType: 'Olive Tree',
      problem: 'Fruit dropping early before harvest season.',
      author: 'Youcef M.',
      timeAgo: '1d ago',
      replies: 2,
      emoji: '🫒',
      tag: null,
    ),
    CommunityPost(
      id: '4',
      plantType: 'Pepper',
      problem: 'Flowers falling off before fruiting. Soil seems dry.',
      author: 'Nadia R.',
      timeAgo: '1d ago',
      replies: 5,
      emoji: '🌶️',
      tag: 'Watering',
    ),
    CommunityPost(
      id: '5',
      plantType: 'Palm Tree',
      problem: 'White powdery coating on trunk base near the roots.',
      author: 'Omar S.',
      timeAgo: '2d ago',
      replies: 3,
      emoji: '🌴',
      tag: 'Fungal',
    ),
    CommunityPost(
      id: '6',
      plantType: 'Tomatoes',
      problem: 'Plants growing well after switching to drip irrigation!',
      author: 'Amina K.',
      timeAgo: '3d ago',
      replies: 11,
      emoji: '🍅',
      tag: 'Tip',
    ),
  ];

  static const List<PlantStat> gardenStats = [
    PlantStat(
      name: 'Palm Trees',
      count: 10,
      emoji: '🌴',
      status: 'Healthy',
      statusColor: 'good',
    ),
    PlantStat(
      name: 'Olive Trees',
      count: 5,
      emoji: '🫒',
      status: 'Needs check',
      statusColor: 'warn',
    ),
    PlantStat(
      name: 'Tomatoes',
      count: 20,
      emoji: '🍅',
      status: 'Water today',
      statusColor: 'warn',
    ),
  ];

  static const List<String> todaySuggestions = [
    '💧 Water your tomatoes — soil is dry',
    '🔍 Check palm leaves for yellowing',
    '✂️ Prune olive tree lower branches',
  ];

  static const List<String> plantTypes = ['Palm', 'Olive', 'Tomato', 'Pepper', 'Other'];
}