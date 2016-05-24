package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@zzgk
public class zzdu
  extends zzdr
{
  private static final Set<String> zzxB = Collections.synchronizedSet(new HashSet());
  private static final DecimalFormat zzxC = new DecimalFormat("#,###");
  private File zzxD;
  private boolean zzxE;
  
  public zzdu(zzip paramZzip)
  {
    super(paramZzip);
    paramZzip = paramZzip.getContext().getCacheDir();
    if (paramZzip == null) {
      zzb.zzaE("Context.getCacheDir() returned null");
    }
    do
    {
      return;
      zzxD = new File(paramZzip, "admobVideoStreams");
      if ((!zzxD.isDirectory()) && (!zzxD.mkdirs()))
      {
        zzb.zzaE("Could not create preload cache directory at " + zzxD.getAbsolutePath());
        zzxD = null;
        return;
      }
    } while ((zzxD.setReadable(true, false)) && (zzxD.setExecutable(true, false)));
    zzb.zzaE("Could not set cache file permissions at " + zzxD.getAbsolutePath());
    zzxD = null;
  }
  
  private File zza(File paramFile)
  {
    return new File(zzxD, paramFile.getName() + ".done");
  }
  
  private static void zzb(File paramFile)
  {
    if (paramFile.isFile())
    {
      paramFile.setLastModified(System.currentTimeMillis());
      return;
    }
    try
    {
      paramFile.createNewFile();
      return;
    }
    catch (IOException paramFile) {}
  }
  
  public void abort()
  {
    zzxE = true;
  }
  
  public boolean zzZ(String paramString)
  {
    if (zzxD == null)
    {
      zzf(paramString, null);
      return false;
    }
    while (zzdH() > ((Integer)zzby.zzuj.get()).intValue()) {
      if (!zzdI())
      {
        zzb.zzaE("Unable to expire stream cache");
        zzf(paramString, null);
        return false;
      }
    }
    Object localObject1 = zzaa(paramString);
    File localFile = new File(zzxD, (String)localObject1);
    localObject1 = zza(localFile);
    int i;
    if ((localFile.isFile()) && (((File)localObject1).isFile()))
    {
      i = (int)localFile.length();
      zzb.zzaC("Stream cache hit at " + paramString);
      zza(paramString, localFile.getAbsolutePath(), i);
      return true;
    }
    String str = zzxD.getAbsolutePath() + paramString;
    synchronized (zzxB)
    {
      if (zzxB.contains(str))
      {
        zzb.zzaE("Stream cache already in progress at " + paramString);
        zzf(paramString, localFile.getAbsolutePath());
        return false;
      }
    }
    zzxB.add(str);
    try
    {
      ??? = new URL(paramString).openConnection();
      i = ((Integer)zzby.zzuo.get()).intValue();
      ((URLConnection)???).setConnectTimeout(i);
      ((URLConnection)???).setReadTimeout(i);
      if ((??? instanceof HttpURLConnection))
      {
        i = ((HttpURLConnection)???).getResponseCode();
        if (i >= 400) {
          throw new IOException("HTTP status code " + i + " at " + paramString);
        }
      }
    }
    catch (IOException localIOException1)
    {
      ??? = null;
    }
    for (;;)
    {
      try
      {
        ((FileOutputStream)???).close();
        int k;
        Object localObject3;
        int m;
        if (zzxE)
        {
          zzb.zzaD("Preload aborted for URL \"" + paramString + "\"");
          if ((localFile.exists()) && (!localFile.delete())) {
            zzb.zzaE("Could not delete partial cache file at " + localFile.getAbsolutePath());
          }
          zzf(paramString, localFile.getAbsolutePath());
          zzxB.remove(str);
          return false;
          k = ((URLConnection)???).getContentLength();
          if (k < 0)
          {
            zzb.zzaE("Stream cache aborted, missing content-length header at " + paramString);
            zzf(paramString, localFile.getAbsolutePath());
            zzxB.remove(str);
            return false;
          }
          localObject3 = zzxC.format(k);
          m = ((Integer)zzby.zzuk.get()).intValue();
          if (k > m)
          {
            zzb.zzaE("Content length " + (String)localObject3 + " exceeds limit at " + paramString);
            zzf(paramString, localFile.getAbsolutePath());
            zzxB.remove(str);
            return false;
          }
          zzb.zzaC("Caching " + (String)localObject3 + " bytes from " + paramString);
          localObject3 = Channels.newChannel(((URLConnection)???).getInputStream());
          ??? = new FileOutputStream(localFile);
        }
        try
        {
          FileChannel localFileChannel = ((FileOutputStream)???).getChannel();
          ByteBuffer localByteBuffer = ByteBuffer.allocate(1048576);
          zzlm localZzlm = zzp.zzbB();
          i = 0;
          long l1 = localZzlm.currentTimeMillis();
          zzib localZzib = new zzib(((Long)zzby.zzun.get()).longValue());
          long l2 = ((Long)zzby.zzum.get()).longValue();
          int j = ((ReadableByteChannel)localObject3).read(localByteBuffer);
          if (j >= 0)
          {
            j = i + j;
            if (j > m) {
              throw new IOException("stream cache file size limit exceeded");
            }
            localByteBuffer.flip();
            if (localFileChannel.write(localByteBuffer) > 0) {
              continue;
            }
            localByteBuffer.clear();
            if (localZzlm.currentTimeMillis() - l1 > 1000L * l2) {
              throw new IOException("stream cache time limit exceeded");
            }
            if (zzxE) {
              throw new IOException("abort requested");
            }
            i = j;
            if (!localZzib.tryAcquire()) {
              continue;
            }
            zza(paramString, localFile.getAbsolutePath(), j, k, false);
            i = j;
            continue;
          }
          ((FileOutputStream)???).close();
          if (zzb.zzM(3))
          {
            localObject3 = zzxC.format(i);
            zzb.zzaC("Preloaded " + (String)localObject3 + " bytes from " + paramString);
          }
          localFile.setReadable(true, false);
          zzb(localIOException1);
          zza(paramString, localFile.getAbsolutePath(), i);
          zzxB.remove(str);
          return true;
        }
        catch (IOException localIOException2) {}
        zzb.zzd("Preload failed for URL \"" + paramString + "\"", localIOException1);
      }
      catch (IOException localIOException3) {}catch (NullPointerException localNullPointerException) {}
    }
  }
  
  public int zzdH()
  {
    int i = 0;
    int k = 0;
    if (zzxD == null) {
      return k;
    }
    File[] arrayOfFile = zzxD.listFiles();
    int m = arrayOfFile.length;
    int j = 0;
    for (;;)
    {
      k = i;
      if (j >= m) {
        break;
      }
      k = i;
      if (!arrayOfFile[j].getName().endsWith(".done")) {
        k = i + 1;
      }
      j += 1;
      i = k;
    }
  }
  
  public boolean zzdI()
  {
    if (zzxD == null) {
      return false;
    }
    Object localObject = null;
    long l1 = Long.MAX_VALUE;
    File[] arrayOfFile = zzxD.listFiles();
    int j = arrayOfFile.length;
    int i = 0;
    if (i < j)
    {
      File localFile = arrayOfFile[i];
      if (localFile.getName().endsWith(".done")) {
        break label134;
      }
      long l2 = localFile.lastModified();
      if (l2 >= l1) {
        break label134;
      }
      localObject = localFile;
      l1 = l2;
    }
    label134:
    for (;;)
    {
      i += 1;
      break;
      boolean bool2;
      if (localObject != null)
      {
        bool2 = ((File)localObject).delete();
        localObject = zza((File)localObject);
        bool1 = bool2;
        if (!((File)localObject).isFile()) {}
      }
      for (boolean bool1 = bool2 & ((File)localObject).delete();; bool1 = false) {
        return bool1;
      }
    }
  }
}
