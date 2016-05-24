package it.sephiroth.android.library.picasso;

public enum MemoryPolicy
{
  NO_CACHE(1),  NO_STORE(2);
  
  final int index;
  
  private MemoryPolicy(int paramInt)
  {
    index = paramInt;
  }
  
  static boolean shouldReadFromMemoryCache(int paramInt)
  {
    return (NO_CACHEindex & paramInt) == 0;
  }
  
  static boolean shouldWriteToMemoryCache(int paramInt)
  {
    return (NO_STOREindex & paramInt) == 0;
  }
}
