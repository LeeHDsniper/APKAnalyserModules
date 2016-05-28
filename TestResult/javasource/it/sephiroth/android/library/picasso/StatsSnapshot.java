package it.sephiroth.android.library.picasso;

import java.io.PrintWriter;

public class StatsSnapshot
{
  public final long averageDownloadSize;
  public final long averageOriginalBitmapSize;
  public final long averageTransformedBitmapSize;
  public final long cacheHits;
  public final long cacheMisses;
  public final int downloadCount;
  public final int maxSize;
  public final int originalBitmapCount;
  public final int size;
  public final long timeStamp;
  public final long totalDownloadSize;
  public final long totalOriginalBitmapSize;
  public final long totalTransformedBitmapSize;
  public final int transformedBitmapCount;
  
  public StatsSnapshot(int paramInt1, int paramInt2, long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6, long paramLong7, long paramLong8, int paramInt3, int paramInt4, int paramInt5, long paramLong9)
  {
    maxSize = paramInt1;
    size = paramInt2;
    cacheHits = paramLong1;
    cacheMisses = paramLong2;
    totalDownloadSize = paramLong3;
    totalOriginalBitmapSize = paramLong4;
    totalTransformedBitmapSize = paramLong5;
    averageDownloadSize = paramLong6;
    averageOriginalBitmapSize = paramLong7;
    averageTransformedBitmapSize = paramLong8;
    downloadCount = paramInt3;
    originalBitmapCount = paramInt4;
    transformedBitmapCount = paramInt5;
    timeStamp = paramLong9;
  }
  
  public void dump(PrintWriter paramPrintWriter)
  {
    paramPrintWriter.println("===============BEGIN PICASSO STATS ===============");
    paramPrintWriter.println("Memory Cache Stats");
    paramPrintWriter.print("  Max Cache Size: ");
    paramPrintWriter.println(maxSize);
    paramPrintWriter.print("  Cache Size: ");
    paramPrintWriter.println(size);
    paramPrintWriter.print("  Cache % Full: ");
    paramPrintWriter.println((int)Math.ceil(size / maxSize * 100.0F));
    paramPrintWriter.print("  Cache Hits: ");
    paramPrintWriter.println(cacheHits);
    paramPrintWriter.print("  Cache Misses: ");
    paramPrintWriter.println(cacheMisses);
    paramPrintWriter.println("Network Stats");
    paramPrintWriter.print("  Download Count: ");
    paramPrintWriter.println(downloadCount);
    paramPrintWriter.print("  Total Download Size: ");
    paramPrintWriter.println(totalDownloadSize);
    paramPrintWriter.print("  Average Download Size: ");
    paramPrintWriter.println(averageDownloadSize);
    paramPrintWriter.println("Bitmap Stats");
    paramPrintWriter.print("  Total Bitmaps Decoded: ");
    paramPrintWriter.println(originalBitmapCount);
    paramPrintWriter.print("  Total Bitmap Size: ");
    paramPrintWriter.println(totalOriginalBitmapSize);
    paramPrintWriter.print("  Total Transformed Bitmaps: ");
    paramPrintWriter.println(transformedBitmapCount);
    paramPrintWriter.print("  Total Transformed Bitmap Size: ");
    paramPrintWriter.println(totalTransformedBitmapSize);
    paramPrintWriter.print("  Average Bitmap Size: ");
    paramPrintWriter.println(averageOriginalBitmapSize);
    paramPrintWriter.print("  Average Transformed Bitmap Size: ");
    paramPrintWriter.println(averageTransformedBitmapSize);
    paramPrintWriter.println("===============END PICASSO STATS ===============");
    paramPrintWriter.flush();
  }
  
  public String toString()
  {
    return "StatsSnapshot{maxSize=" + maxSize + ", size=" + size + ", cacheHits=" + cacheHits + ", cacheMisses=" + cacheMisses + ", downloadCount=" + downloadCount + ", totalDownloadSize=" + totalDownloadSize + ", averageDownloadSize=" + averageDownloadSize + ", totalOriginalBitmapSize=" + totalOriginalBitmapSize + ", totalTransformedBitmapSize=" + totalTransformedBitmapSize + ", averageOriginalBitmapSize=" + averageOriginalBitmapSize + ", averageTransformedBitmapSize=" + averageTransformedBitmapSize + ", originalBitmapCount=" + originalBitmapCount + ", transformedBitmapCount=" + transformedBitmapCount + ", timeStamp=" + timeStamp + '}';
  }
}
