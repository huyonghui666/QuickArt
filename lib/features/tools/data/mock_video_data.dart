class VideoData {
  final String url;
  final String? coverUrl;

  const VideoData({required this.url, this.coverUrl});
}

// Map of Tab Key -> List of Video URLs
// Using the same URLs from reference for demonstration
final Map<String, List<VideoData>> mockVideoData = {
  'popular': _generateMockList(),
  'kiss': _generateMockList(),
  'hug': _generateMockList(),
  'ai_effects': _generateMockList(),
  'style_transfer': _generateMockList(),
  'rich_life': _generateMockList(),
  'cross_dimension': _generateMockList(),
  'animal_effects': _generateMockList(),
  'romantic_day': _generateMockList(),
  'movie_life': _generateMockList(),
  'cross_dressing': _generateMockList(),
  'dance': _generateMockList(),
  'micro_world': _generateMockList(),
};

List<VideoData> _generateMockList() {
  return List.generate(
    12,
    (index) => const VideoData(
      url:
          'https://ai-media-storage.oss-cn-shenzhen.aliyuncs.com/Record_2026-02-07-10-54-00_b783bf344239542886fee7.mp4',
    ),
  );
}
