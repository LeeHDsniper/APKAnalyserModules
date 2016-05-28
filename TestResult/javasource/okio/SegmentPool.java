package okio;

final class SegmentPool
{
  static final SegmentPool INSTANCE = new SegmentPool();
  long byteCount;
  private Segment next;
  
  private SegmentPool() {}
  
  void recycle(Segment paramSegment)
  {
    if ((next != null) || (prev != null)) {
      throw new IllegalArgumentException();
    }
    try
    {
      if (byteCount + 2048L > 65536L) {
        return;
      }
      byteCount += 2048L;
      next = next;
      limit = 0;
      pos = 0;
      next = paramSegment;
      return;
    }
    finally {}
  }
  
  Segment take()
  {
    try
    {
      if (next != null)
      {
        Segment localSegment = next;
        next = next;
        next = null;
        byteCount -= 2048L;
        return localSegment;
      }
      return new Segment();
    }
    finally {}
  }
}
