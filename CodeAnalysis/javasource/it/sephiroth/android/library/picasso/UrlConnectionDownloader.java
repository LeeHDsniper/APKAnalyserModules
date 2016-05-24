package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.net.Uri;
import android.net.http.HttpResponseCache;
import android.os.Build.VERSION;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class UrlConnectionDownloader
  implements Downloader
{
  private static final ThreadLocal<StringBuilder> CACHE_HEADER_BUILDER = new ThreadLocal()
  {
    protected StringBuilder initialValue()
    {
      return new StringBuilder();
    }
  };
  static volatile Object cache;
  private static final Object lock = new Object();
  private final Context context;
  
  public UrlConnectionDownloader(Context paramContext)
  {
    context = paramContext.getApplicationContext();
  }
  
  private static void installCacheIfNeeded(Context paramContext)
  {
    if (cache == null) {
      try
      {
        synchronized (lock)
        {
          if (cache == null) {
            cache = ResponseCacheIcs.install(paramContext);
          }
          return;
        }
        return;
      }
      catch (IOException paramContext) {}
    }
  }
  
  public Downloader.Response load(Uri paramUri, int paramInt)
    throws IOException
  {
    if (Build.VERSION.SDK_INT >= 14) {
      installCacheIfNeeded(context);
    }
    HttpURLConnection localHttpURLConnection = openConnection(paramUri);
    localHttpURLConnection.setUseCaches(true);
    if (paramInt != 0) {
      if (!NetworkPolicy.isOfflineOnly(paramInt)) {
        break label105;
      }
    }
    for (paramUri = "only-if-cached,max-age=2147483647";; paramUri = paramUri.toString())
    {
      localHttpURLConnection.setRequestProperty("Cache-Control", paramUri);
      int i = localHttpURLConnection.getResponseCode();
      if (i < 300) {
        break;
      }
      localHttpURLConnection.disconnect();
      throw new Downloader.ResponseException(i + " " + localHttpURLConnection.getResponseMessage(), paramInt, i);
      label105:
      paramUri = (StringBuilder)CACHE_HEADER_BUILDER.get();
      paramUri.setLength(0);
      if (!NetworkPolicy.shouldReadFromDiskCache(paramInt)) {
        paramUri.append("no-cache");
      }
      if (!NetworkPolicy.shouldWriteToDiskCache(paramInt))
      {
        if (paramUri.length() > 0) {
          paramUri.append(',');
        }
        paramUri.append("no-store");
      }
    }
    long l = localHttpURLConnection.getHeaderFieldInt("Content-Length", -1);
    boolean bool = Utils.parseResponseSourceHeader(localHttpURLConnection.getHeaderField("X-Android-Response-Source"));
    return new Downloader.Response(localHttpURLConnection.getInputStream(), bool, l);
  }
  
  protected HttpURLConnection openConnection(Uri paramUri)
    throws IOException
  {
    paramUri = (HttpURLConnection)new URL(paramUri.toString()).openConnection();
    paramUri.setConnectTimeout(15000);
    paramUri.setReadTimeout(20000);
    return paramUri;
  }
  
  private static class ResponseCacheIcs
  {
    static Object install(Context paramContext)
      throws IOException
    {
      File localFile = Utils.createDefaultCacheDir(paramContext);
      HttpResponseCache localHttpResponseCache = HttpResponseCache.getInstalled();
      paramContext = localHttpResponseCache;
      if (localHttpResponseCache == null) {
        paramContext = HttpResponseCache.install(localFile, Utils.calculateDiskCacheSize(localFile));
      }
      return paramContext;
    }
  }
}
