String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
}

String formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}