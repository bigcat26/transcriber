
class AudioSegment {
  final List<int> pcmData;
  final int offset;
  final int duration;

  AudioSegment(this.pcmData, this.offset, this.duration);
}
