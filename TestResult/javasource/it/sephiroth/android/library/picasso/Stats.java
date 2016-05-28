package it.sephiroth.android.library.picasso;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;

class Stats
{
  long averageDownloadSize;
  long averageOriginalBitmapSize;
  long averageTransformedBitmapSize;
  final Cache cache;
  long cacheHits;
  long cacheMisses;
  int downloadCount;
  final Handler handler;
  int originalBitmapCount;
  final HandlerThread statsThread;
  long totalDownloadSize;
  long totalOriginalBitmapSize;
  long totalTransformedBitmapSize;
  int transformedBitmapCount;
  
  Stats(Cache paramCache)
  {
    cache = paramCache;
    statsThread = new HandlerThread("Picasso-Stats", 10);
    statsThread.start();
    Utils.flushStackLocalLeaks(statsThread.getLooper());
    handler = new StatsHandler(statsThread.getLooper(), this);
  }
  
  private static long getAverage(int paramInt, long paramLong)
  {
    return paramLong / paramInt;
  }
  
  private void processBitmap(Bitmap paramBitmap, int paramInt)
  {
    int i = Utils.getBitmapBytes(paramBitmap);
    handler.sendMessage(handler.obtainMessage(paramInt, i, 0));
  }
  
  StatsSnapshot createSnapshot()
  {
    return new StatsSnapshot(cache.maxSize(), cache.size(), cacheHits, cacheMisses, totalDownloadSize, totalOriginalBitmapSize, totalTransformedBitmapSize, averageDownloadSize, averageOriginalBitmapSize, averageTransformedBitmapSize, downloadCount, originalBitmapCount, transformedBitmapCount, System.currentTimeMillis());
  }
  
  void dispatchBitmapDecoded(Bitmap paramBitmap)
  {
    processBitmap(paramBitmap, 2);
  }
  
  void dispatchBitmapTransformed(Bitmap paramBitmap)
  {
    processBitmap(paramBitmap, 3);
  }
  
  void dispatchCacheHit()
  {
    handler.sendEmptyMessage(0);
  }
  
  void dispatchCacheMiss()
  {
    handler.sendEmptyMessage(1);
  }
  
  void dispatchDownloadFinished(long paramLong)
  {
    handler.sendMessage(handler.obtainMessage(4, Long.valueOf(paramLong)));
  }
  
  void performBitmapDecoded(long paramLong)
  {
    originalBitmapCount += 1;
    totalOriginalBitmapSize += paramLong;
    averageOriginalBitmapSize = getAverage(originalBitmapCount, totalOriginalBitmapSize);
  }
  
  void performBitmapTransformed(long paramLong)
  {
    transformedBitmapCount += 1;
    totalTransformedBitmapSize += paramLong;
    averageTransformedBitmapSize = getAverage(originalBitmapCount, totalTransformedBitmapSize);
  }
  
  void performCacheHit()
  {
    cacheHits += 1L;
  }
  
  void performCacheMiss()
  {
    cacheMisses += 1L;
  }
  
  void performDownloadFinished(Long paramLong)
  {
    downloadCount += 1;
    totalDownloadSize += paramLong.longValue();
    averageDownloadSize = getAverage(downloadCount, totalDownloadSize);
  }
  
  private static class StatsHandler
    extends Handler
  {
    private final Stats stats;
    
    public StatsHandler(Looper paramLooper, Stats paramStats)
    {
      super();
      stats = paramStats;
    }
    
    public void handleMessage(final Message paramMessage)
    {
      switch (what)
      {
      default: 
        Picasso.HANDLER.post(new Runnable()
        {
          public void run()
          {
            throw new AssertionError("Unhandled stats message." + paramMessagewhat);
          }
        });
        return;
      case 0: 
        stats.performCacheHit();
        return;
      case 1: 
        stats.performCacheMiss();
        return;
      case 2: 
        stats.performBitmapDecoded(arg1);
        return;
      case 3: 
        stats.performBitmapTransformed(arg1);
        return;
      }
      stats.performDownloadFinished((Long)obj);
    }
  }
}
