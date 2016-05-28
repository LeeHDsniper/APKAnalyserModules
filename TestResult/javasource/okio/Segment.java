package okio;

final class Segment
{
  final byte[] data = new byte['ࠀ'];
  int limit;
  Segment next;
  int pos;
  Segment prev;
  
  Segment() {}
  
  public void compact()
  {
    if (prev == this) {
      throw new IllegalStateException();
    }
    if (prev.limit - prev.pos + (limit - pos) > 2048) {
      return;
    }
    writeTo(prev, limit - pos);
    pop();
    SegmentPool.INSTANCE.recycle(this);
  }
  
  public Segment pop()
  {
    if (next != this) {}
    for (Segment localSegment = next;; localSegment = null)
    {
      prev.next = next;
      next.prev = prev;
      next = null;
      prev = null;
      return localSegment;
    }
  }
  
  public Segment push(Segment paramSegment)
  {
    prev = this;
    next = next;
    next.prev = paramSegment;
    next = paramSegment;
    return paramSegment;
  }
  
  public Segment split(int paramInt)
  {
    int i = limit - pos - paramInt;
    if ((paramInt <= 0) || (i <= 0)) {
      throw new IllegalArgumentException();
    }
    if (paramInt < i)
    {
      localSegment = SegmentPool.INSTANCE.take();
      System.arraycopy(data, pos, data, pos, paramInt);
      pos += paramInt;
      limit += paramInt;
      prev.push(localSegment);
      return localSegment;
    }
    Segment localSegment = SegmentPool.INSTANCE.take();
    System.arraycopy(data, pos + paramInt, data, pos, i);
    limit -= i;
    limit += i;
    push(localSegment);
    return this;
  }
  
  public void writeTo(Segment paramSegment, int paramInt)
  {
    if (limit - pos + paramInt > 2048) {
      throw new IllegalArgumentException();
    }
    if (limit + paramInt > 2048)
    {
      System.arraycopy(data, pos, data, 0, limit - pos);
      limit -= pos;
      pos = 0;
    }
    System.arraycopy(data, pos, data, limit, paramInt);
    limit += paramInt;
    pos += paramInt;
  }
}
