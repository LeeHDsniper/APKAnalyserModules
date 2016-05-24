package it.sephiroth.android.library.picasso;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.os.StatFs;
import android.provider.Settings.System;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.concurrent.ThreadFactory;

final class Utils
{
  static final StringBuilder MAIN_THREAD_KEY_BUILDER = new StringBuilder();
  
  static long calculateDiskCacheSize(File paramFile)
  {
    long l1 = 5242880L;
    try
    {
      paramFile = new StatFs(paramFile.getAbsolutePath());
      long l2 = paramFile.getBlockCount() * paramFile.getBlockSize() / 50L;
      l1 = l2;
    }
    catch (IllegalArgumentException paramFile)
    {
      for (;;) {}
    }
    return Math.max(Math.min(l1, 52428800L), 5242880L);
  }
  
  static int calculateMemoryCacheSize(Context paramContext)
  {
    ActivityManager localActivityManager = (ActivityManager)getService(paramContext, "activity");
    if ((getApplicationInfoflags & 0x100000) != 0) {}
    for (int i = 1;; i = 0)
    {
      int k = localActivityManager.getMemoryClass();
      int j = k;
      if (i != 0)
      {
        j = k;
        if (Build.VERSION.SDK_INT >= 11) {
          j = ActivityManagerHoneycomb.getLargeMemoryClass(localActivityManager);
        }
      }
      return 1048576 * j / 7;
    }
  }
  
  static void checkMain()
  {
    if (!isMain()) {
      throw new IllegalStateException("Method call should happen from the main thread.");
    }
  }
  
  static <T> T checkNotNull(T paramT, String paramString)
  {
    if (paramT == null) {
      throw new NullPointerException(paramString);
    }
    return paramT;
  }
  
  static void closeQuietly(InputStream paramInputStream)
  {
    if (paramInputStream == null) {
      return;
    }
    try
    {
      paramInputStream.close();
      return;
    }
    catch (IOException paramInputStream) {}
  }
  
  static File createDefaultCacheDir(Context paramContext)
  {
    paramContext = new File(paramContext.getApplicationContext().getCacheDir(), "picasso-cache");
    if (!paramContext.exists()) {
      paramContext.mkdirs();
    }
    return paramContext;
  }
  
  static Downloader createDefaultDownloader(Context paramContext)
  {
    try
    {
      Class.forName("com.squareup.okhttp.OkHttpClient");
      Downloader localDownloader = OkHttpLoaderCreator.create(paramContext);
      return localDownloader;
    }
    catch (ClassNotFoundException localClassNotFoundException) {}
    return new UrlConnectionDownloader(paramContext);
  }
  
  static String createKey(Request paramRequest)
  {
    paramRequest = createKey(paramRequest, MAIN_THREAD_KEY_BUILDER);
    MAIN_THREAD_KEY_BUILDER.setLength(0);
    return paramRequest;
  }
  
  static String createKey(Request paramRequest, StringBuilder paramStringBuilder)
  {
    if (stableKey != null)
    {
      paramStringBuilder.ensureCapacity(stableKey.length() + 50);
      paramStringBuilder.append(stableKey);
      paramStringBuilder.append('\n');
      if (rotationDegrees != 0.0F)
      {
        paramStringBuilder.append("rotation:").append(rotationDegrees);
        if (hasRotationPivot) {
          paramStringBuilder.append('@').append(rotationPivotX).append('x').append(rotationPivotY);
        }
        paramStringBuilder.append('\n');
      }
      if (paramRequest.hasSize())
      {
        paramStringBuilder.append("resize:").append(targetWidth).append('x').append(targetHeight);
        paramStringBuilder.append('\n');
      }
      if (!centerCrop) {
        break label276;
      }
      paramStringBuilder.append("centerCrop").append('\n');
    }
    for (;;)
    {
      if (transformations == null) {
        break label299;
      }
      int i = 0;
      int j = transformations.size();
      while (i < j)
      {
        paramStringBuilder.append(((Transformation)transformations.get(i)).key());
        paramStringBuilder.append('\n');
        i += 1;
      }
      if (uri != null)
      {
        String str = uri.toString();
        paramStringBuilder.ensureCapacity(str.length() + 50);
        paramStringBuilder.append(str);
        break;
      }
      paramStringBuilder.ensureCapacity(50);
      paramStringBuilder.append(resourceId);
      break;
      label276:
      if (centerInside) {
        paramStringBuilder.append("centerInside").append('\n');
      }
    }
    label299:
    return paramStringBuilder.toString();
  }
  
  static void flushStackLocalLeaks(Looper paramLooper)
  {
    paramLooper = new Handler(paramLooper)
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        sendMessageDelayed(obtainMessage(), 1000L);
      }
    };
    paramLooper.sendMessageDelayed(paramLooper.obtainMessage(), 1000L);
  }
  
  static int getBitmapBytes(Bitmap paramBitmap)
  {
    if (Build.VERSION.SDK_INT >= 12) {}
    for (int i = BitmapHoneycombMR1.getByteCount(paramBitmap); i < 0; i = paramBitmap.getRowBytes() * paramBitmap.getHeight()) {
      throw new IllegalStateException("Negative size: " + paramBitmap);
    }
    return i;
  }
  
  static String getLogIdsForHunter(BitmapHunter paramBitmapHunter)
  {
    return getLogIdsForHunter(paramBitmapHunter, "");
  }
  
  static String getLogIdsForHunter(BitmapHunter paramBitmapHunter, String paramString)
  {
    paramString = new StringBuilder(paramString);
    Action localAction = paramBitmapHunter.getAction();
    if (localAction != null) {
      paramString.append(request.logId());
    }
    paramBitmapHunter = paramBitmapHunter.getActions();
    if (paramBitmapHunter != null)
    {
      int i = 0;
      int j = paramBitmapHunter.size();
      while (i < j)
      {
        if ((i > 0) || (localAction != null)) {
          paramString.append(", ");
        }
        paramString.append(getrequest.logId());
        i += 1;
      }
    }
    return paramString.toString();
  }
  
  static int getResourceId(Resources paramResources, Request paramRequest)
    throws FileNotFoundException
  {
    if ((resourceId != 0) || (uri == null)) {
      return resourceId;
    }
    String str = uri.getAuthority();
    if (str == null) {
      throw new FileNotFoundException("No package provided: " + uri);
    }
    List localList = uri.getPathSegments();
    if ((localList == null) || (localList.isEmpty())) {
      throw new FileNotFoundException("No path segments: " + uri);
    }
    if (localList.size() == 1) {
      try
      {
        int i = Integer.parseInt((String)localList.get(0));
        return i;
      }
      catch (NumberFormatException paramResources)
      {
        throw new FileNotFoundException("Last path segment is not a resource ID: " + uri);
      }
    }
    if (localList.size() == 2)
    {
      paramRequest = (String)localList.get(0);
      return paramResources.getIdentifier((String)localList.get(1), paramRequest, str);
    }
    throw new FileNotFoundException("More than two path segments: " + uri);
  }
  
  static Resources getResources(Context paramContext, Request paramRequest)
    throws FileNotFoundException
  {
    if ((resourceId != 0) || (uri == null)) {
      return paramContext.getResources();
    }
    String str = uri.getAuthority();
    if (str == null) {
      throw new FileNotFoundException("No package provided: " + uri);
    }
    try
    {
      paramContext = paramContext.getPackageManager().getResourcesForApplication(str);
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      throw new FileNotFoundException("Unable to obtain resources for package: " + uri);
    }
  }
  
  static <T> T getService(Context paramContext, String paramString)
  {
    return paramContext.getSystemService(paramString);
  }
  
  static boolean hasPermission(Context paramContext, String paramString)
  {
    return paramContext.checkCallingOrSelfPermission(paramString) == 0;
  }
  
  static boolean isAirplaneModeOn(Context paramContext)
  {
    boolean bool = false;
    paramContext = paramContext.getContentResolver();
    try
    {
      int i = Settings.System.getInt(paramContext, "airplane_mode_on", 0);
      if (i != 0) {
        bool = true;
      }
      return bool;
    }
    catch (NullPointerException paramContext) {}
    return false;
  }
  
  static boolean isMain()
  {
    return Looper.getMainLooper().getThread() == Thread.currentThread();
  }
  
  static boolean isWebPFile(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[12];
    boolean bool = false;
    if (paramInputStream.read(arrayOfByte, 0, 12) == 12)
    {
      if (("RIFF".equals(new String(arrayOfByte, 0, 4, "US-ASCII"))) && ("WEBP".equals(new String(arrayOfByte, 8, 4, "US-ASCII")))) {
        bool = true;
      }
    }
    else {
      return bool;
    }
    return false;
  }
  
  static void log(String paramString1, String paramString2, String paramString3)
  {
    log(paramString1, paramString2, paramString3, "");
  }
  
  static void log(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    Log.d("Picasso", String.format("%1$-11s %2$-12s %3$s %4$s", new Object[] { paramString1, paramString2, paramString3, paramString4 }));
  }
  
  static boolean parseResponseSourceHeader(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {}
    do
    {
      return false;
      paramString = paramString.split(" ", 2);
      if ("CACHE".equals(paramString[0])) {
        return true;
      }
    } while (paramString.length == 1);
    try
    {
      if ("CONDITIONAL_CACHE".equals(paramString[0]))
      {
        int i = Integer.parseInt(paramString[1]);
        if (i != 304) {}
      }
      for (;;)
      {
        return bool;
        bool = false;
      }
      return false;
    }
    catch (NumberFormatException paramString) {}
  }
  
  static byte[] toByteArray(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte['က'];
    for (;;)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (-1 == i) {
        break;
      }
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    return localByteArrayOutputStream.toByteArray();
  }
  
  @TargetApi(11)
  private static class ActivityManagerHoneycomb
  {
    static int getLargeMemoryClass(ActivityManager paramActivityManager)
    {
      return paramActivityManager.getLargeMemoryClass();
    }
  }
  
  @TargetApi(12)
  private static class BitmapHoneycombMR1
  {
    static int getByteCount(Bitmap paramBitmap)
    {
      return paramBitmap.getByteCount();
    }
  }
  
  private static class OkHttpLoaderCreator
  {
    static Downloader create(Context paramContext)
    {
      return new OkHttpDownloader(paramContext);
    }
  }
  
  private static class PicassoThread
    extends Thread
  {
    public PicassoThread(Runnable paramRunnable)
    {
      super();
    }
    
    public void run()
    {
      Process.setThreadPriority(10);
      super.run();
    }
  }
  
  static class PicassoThreadFactory
    implements ThreadFactory
  {
    PicassoThreadFactory() {}
    
    public Thread newThread(Runnable paramRunnable)
    {
      return new Utils.PicassoThread(paramRunnable);
    }
  }
}
