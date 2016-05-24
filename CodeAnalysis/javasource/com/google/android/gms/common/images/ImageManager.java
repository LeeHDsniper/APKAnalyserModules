package com.google.android.gms.common.images;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.util.Log;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.internal.zzku;
import com.google.android.gms.internal.zzlf;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;

public final class ImageManager
{
  private static final Object zzabB = new Object();
  private static HashSet<Uri> zzabC = new HashSet();
  private final Context mContext;
  private final Handler mHandler;
  private final ExecutorService zzabF;
  private final zzb zzabG;
  private final zzku zzabH;
  private final Map<zza, ImageReceiver> zzabI;
  private final Map<Uri, ImageReceiver> zzabJ;
  private final Map<Uri, Long> zzabK;
  
  private final class ImageReceiver
    extends ResultReceiver
  {
    private final Uri mUri;
    private final ArrayList<zza> zzabL;
    
    public void onReceiveResult(int paramInt, Bundle paramBundle)
    {
      paramBundle = (ParcelFileDescriptor)paramBundle.getParcelable("com.google.android.gms.extra.fileDescriptor");
      ImageManager.zzf(zzabM).execute(new ImageManager.zzc(zzabM, mUri, paramBundle));
    }
  }
  
  public static abstract interface OnImageLoadedListener
  {
    public abstract void onImageLoaded(Uri paramUri, Drawable paramDrawable, boolean paramBoolean);
  }
  
  private static final class zzb
    extends zzlf<zza.zza, Bitmap>
  {
    protected int zza(zza.zza paramZza, Bitmap paramBitmap)
    {
      return paramBitmap.getHeight() * paramBitmap.getRowBytes();
    }
    
    protected void zza(boolean paramBoolean, zza.zza paramZza, Bitmap paramBitmap1, Bitmap paramBitmap2)
    {
      super.entryRemoved(paramBoolean, paramZza, paramBitmap1, paramBitmap2);
    }
  }
  
  private final class zzc
    implements Runnable
  {
    private final Uri mUri;
    private final ParcelFileDescriptor zzabN;
    
    public zzc(Uri paramUri, ParcelFileDescriptor paramParcelFileDescriptor)
    {
      mUri = paramUri;
      zzabN = paramParcelFileDescriptor;
    }
    
    public void run()
    {
      zzb.zzci("LoadBitmapFromDiskRunnable can't be executed in the main thread");
      boolean bool1 = false;
      boolean bool2 = false;
      Bitmap localBitmap = null;
      CountDownLatch localCountDownLatch = null;
      if (zzabN != null) {}
      try
      {
        localBitmap = BitmapFactory.decodeFileDescriptor(zzabN.getFileDescriptor());
        bool1 = bool2;
        Object localObject;
        return;
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        try
        {
          for (;;)
          {
            zzabN.close();
            localCountDownLatch = new CountDownLatch(1);
            ImageManager.zzg(ImageManager.this).post(new ImageManager.zzf(ImageManager.this, mUri, localBitmap, bool1, localCountDownLatch));
            try
            {
              localCountDownLatch.await();
              return;
            }
            catch (InterruptedException localInterruptedException)
            {
              Log.w("ImageManager", "Latch interrupted while posting " + mUri);
            }
            localOutOfMemoryError = localOutOfMemoryError;
            Log.e("ImageManager", "OOM while loading bitmap for uri: " + mUri, localOutOfMemoryError);
            bool1 = true;
            localObject = localCountDownLatch;
          }
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            Log.e("ImageManager", "closed failed", localIOException);
          }
        }
      }
    }
  }
  
  private final class zzf
    implements Runnable
  {
    private final Bitmap mBitmap;
    private final Uri mUri;
    private boolean zzabP;
    private final CountDownLatch zzoR;
    
    public zzf(Uri paramUri, Bitmap paramBitmap, boolean paramBoolean, CountDownLatch paramCountDownLatch)
    {
      mUri = paramUri;
      mBitmap = paramBitmap;
      zzabP = paramBoolean;
      zzoR = paramCountDownLatch;
    }
    
    private void zza(ImageManager.ImageReceiver paramImageReceiver, boolean paramBoolean)
    {
      paramImageReceiver = ImageManager.ImageReceiver.zza(paramImageReceiver);
      int j = paramImageReceiver.size();
      int i = 0;
      if (i < j)
      {
        zza localZza = (zza)paramImageReceiver.get(i);
        if (paramBoolean) {
          localZza.zza(ImageManager.zzb(ImageManager.this), mBitmap, false);
        }
        for (;;)
        {
          if (!(localZza instanceof zza.zzc)) {
            ImageManager.zza(ImageManager.this).remove(localZza);
          }
          i += 1;
          break;
          ImageManager.zzd(ImageManager.this).put(mUri, Long.valueOf(SystemClock.elapsedRealtime()));
          localZza.zza(ImageManager.zzb(ImageManager.this), ImageManager.zzc(ImageManager.this), false);
        }
      }
    }
    
    public void run()
    {
      zzb.zzch("OnBitmapLoadedRunnable must be executed in the main thread");
      boolean bool;
      if (mBitmap != null) {
        bool = true;
      }
      while (ImageManager.zzh(ImageManager.this) != null) {
        if (zzabP)
        {
          ImageManager.zzh(ImageManager.this).evictAll();
          System.gc();
          zzabP = false;
          ImageManager.zzg(ImageManager.this).post(this);
          return;
          bool = false;
        }
        else if (bool)
        {
          ImageManager.zzh(ImageManager.this).put(new zza.zza(mUri), mBitmap);
        }
      }
      ??? = (ImageManager.ImageReceiver)ImageManager.zze(ImageManager.this).remove(mUri);
      if (??? != null) {
        zza((ImageManager.ImageReceiver)???, bool);
      }
      zzoR.countDown();
      synchronized (ImageManager.zzoa())
      {
        ImageManager.zzob().remove(mUri);
        return;
      }
    }
  }
}
