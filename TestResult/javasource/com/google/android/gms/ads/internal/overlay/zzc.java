package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.AudioManager;
import android.media.AudioManager.OnAudioFocusChangeListener;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Handler;
import android.view.Surface;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View.MeasureSpec;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzlm;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@zzgk
public class zzc
  extends zzi
  implements AudioManager.OnAudioFocusChangeListener, MediaPlayer.OnBufferingUpdateListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnInfoListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnVideoSizeChangedListener, TextureView.SurfaceTextureListener
{
  private static final Map<Integer, String> zzAb = new HashMap();
  private final zzp zzAc;
  private int zzAd = 0;
  private int zzAe = 0;
  private MediaPlayer zzAf;
  private Uri zzAg;
  private int zzAh;
  private int zzAi;
  private int zzAj;
  private int zzAk;
  private int zzAl;
  private float zzAm = 1.0F;
  private boolean zzAn;
  private boolean zzAo;
  private int zzAp;
  private zzh zzAq;
  
  static
  {
    zzAb.put(Integer.valueOf(64532), "MEDIA_ERROR_IO");
    zzAb.put(Integer.valueOf(64529), "MEDIA_ERROR_MALFORMED");
    zzAb.put(Integer.valueOf(64526), "MEDIA_ERROR_UNSUPPORTED");
    zzAb.put(Integer.valueOf(-110), "MEDIA_ERROR_TIMED_OUT");
    zzAb.put(Integer.valueOf(100), "MEDIA_ERROR_SERVER_DIED");
    zzAb.put(Integer.valueOf(1), "MEDIA_ERROR_UNKNOWN");
    zzAb.put(Integer.valueOf(1), "MEDIA_INFO_UNKNOWN");
    zzAb.put(Integer.valueOf(700), "MEDIA_INFO_VIDEO_TRACK_LAGGING");
    zzAb.put(Integer.valueOf(3), "MEDIA_INFO_VIDEO_RENDERING_START");
    zzAb.put(Integer.valueOf(701), "MEDIA_INFO_BUFFERING_START");
    zzAb.put(Integer.valueOf(702), "MEDIA_INFO_BUFFERING_END");
    zzAb.put(Integer.valueOf(800), "MEDIA_INFO_BAD_INTERLEAVING");
    zzAb.put(Integer.valueOf(801), "MEDIA_INFO_NOT_SEEKABLE");
    zzAb.put(Integer.valueOf(802), "MEDIA_INFO_METADATA_UPDATE");
    zzAb.put(Integer.valueOf(901), "MEDIA_INFO_UNSUPPORTED_SUBTITLE");
    zzAb.put(Integer.valueOf(902), "MEDIA_INFO_SUBTITLE_TIMED_OUT");
  }
  
  public zzc(Context paramContext, zzp paramZzp)
  {
    super(paramContext);
    setSurfaceTextureListener(this);
    zzAc = paramZzp;
    zzAc.zza(this);
  }
  
  private void zzb(float paramFloat)
  {
    if (zzAf != null) {}
    try
    {
      zzAf.setVolume(paramFloat, paramFloat);
      return;
    }
    catch (IllegalStateException localIllegalStateException) {}
    zzb.zzaE("AdVideoView setMediaPlayerVolume() called before onPrepared().");
    return;
  }
  
  private void zzel()
  {
    zzb.v("AdVideoView init MediaPlayer");
    SurfaceTexture localSurfaceTexture = getSurfaceTexture();
    if ((zzAg == null) || (localSurfaceTexture == null)) {
      return;
    }
    zzt(false);
    try
    {
      zzAf = new MediaPlayer();
      zzAf.setOnBufferingUpdateListener(this);
      zzAf.setOnCompletionListener(this);
      zzAf.setOnErrorListener(this);
      zzAf.setOnInfoListener(this);
      zzAf.setOnPreparedListener(this);
      zzAf.setOnVideoSizeChangedListener(this);
      zzAj = 0;
      zzAf.setDataSource(getContext(), zzAg);
      zzAf.setSurface(new Surface(localSurfaceTexture));
      zzAf.setAudioStreamType(3);
      zzAf.setScreenOnWhilePlaying(true);
      zzAf.prepareAsync();
      zzt(1);
      return;
    }
    catch (IOException localIOException)
    {
      zzb.zzd("Failed to initialize MediaPlayer at " + zzAg, localIOException);
      onError(zzAf, 1, 0);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;) {}
    }
  }
  
  private void zzem()
  {
    if ((zzep()) && (zzAf.getCurrentPosition() > 0) && (zzAe != 3))
    {
      zzb.v("AdVideoView nudging MediaPlayer");
      zzb(0.0F);
      zzAf.start();
      int i = zzAf.getCurrentPosition();
      long l = com.google.android.gms.ads.internal.zzp.zzbB().currentTimeMillis();
      while ((zzep()) && (zzAf.getCurrentPosition() == i) && (com.google.android.gms.ads.internal.zzp.zzbB().currentTimeMillis() - l <= 250L)) {}
      zzAf.pause();
      zzeu();
    }
  }
  
  private void zzen()
  {
    AudioManager localAudioManager = zzev();
    if ((localAudioManager != null) && (!zzAo))
    {
      if (localAudioManager.requestAudioFocus(this, 3, 2) == 1) {
        zzes();
      }
    }
    else {
      return;
    }
    zzb.zzaE("AdVideoView audio focus request failed");
  }
  
  private void zzeo()
  {
    zzb.v("AdVideoView abandon audio focus");
    AudioManager localAudioManager = zzev();
    if ((localAudioManager != null) && (zzAo))
    {
      if (localAudioManager.abandonAudioFocus(this) == 1) {
        zzAo = false;
      }
    }
    else {
      return;
    }
    zzb.zzaE("AdVideoView abandon audio focus failed");
  }
  
  private boolean zzep()
  {
    return (zzAf != null) && (zzAd != -1) && (zzAd != 0) && (zzAd != 1);
  }
  
  private void zzes()
  {
    zzb.v("AdVideoView audio focus gained");
    zzAo = true;
    zzeu();
  }
  
  private void zzet()
  {
    zzb.v("AdVideoView audio focus lost");
    zzAo = false;
    zzeu();
  }
  
  private void zzeu()
  {
    if ((!zzAn) && (zzAo))
    {
      zzb(zzAm);
      return;
    }
    zzb(0.0F);
  }
  
  private AudioManager zzev()
  {
    return (AudioManager)getContext().getSystemService("audio");
  }
  
  private void zzt(int paramInt)
  {
    if (paramInt == 3) {
      zzAc.zzeY();
    }
    for (;;)
    {
      zzAd = paramInt;
      return;
      if ((zzAd == 3) && (paramInt != 3)) {
        zzAc.zzeZ();
      }
    }
  }
  
  private void zzt(boolean paramBoolean)
  {
    zzb.v("AdVideoView release");
    if (zzAf != null)
    {
      zzAf.reset();
      zzAf.release();
      zzAf = null;
      zzt(0);
      if (paramBoolean)
      {
        zzAe = 0;
        zzu(0);
      }
      zzeo();
    }
  }
  
  private void zzu(int paramInt)
  {
    zzAe = paramInt;
  }
  
  public int getCurrentPosition()
  {
    if (zzep()) {
      return zzAf.getCurrentPosition();
    }
    return 0;
  }
  
  public int getDuration()
  {
    if (zzep()) {
      return zzAf.getDuration();
    }
    return -1;
  }
  
  public int getVideoHeight()
  {
    if (zzAf != null) {
      return zzAf.getVideoHeight();
    }
    return 0;
  }
  
  public int getVideoWidth()
  {
    if (zzAf != null) {
      return zzAf.getVideoWidth();
    }
    return 0;
  }
  
  public void onAudioFocusChange(int paramInt)
  {
    if (paramInt > 0) {
      zzes();
    }
    while (paramInt >= 0) {
      return;
    }
    zzet();
  }
  
  public void onBufferingUpdate(MediaPlayer paramMediaPlayer, int paramInt)
  {
    zzAj = paramInt;
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    zzb.v("AdVideoView completion");
    zzt(5);
    zzu(5);
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if (zzc.zza(zzc.this) != null) {
          zzc.zza(zzc.this).zzeN();
        }
      }
    });
  }
  
  public boolean onError(final MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    paramMediaPlayer = (String)zzAb.get(Integer.valueOf(paramInt1));
    final String str = (String)zzAb.get(Integer.valueOf(paramInt2));
    zzb.zzaE("AdVideoView MediaPlayer error: " + paramMediaPlayer + ":" + str);
    zzt(-1);
    zzu(-1);
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if (zzc.zza(zzc.this) != null) {
          zzc.zza(zzc.this).zzh(paramMediaPlayer, str);
        }
      }
    });
    return true;
  }
  
  public boolean onInfo(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    paramMediaPlayer = (String)zzAb.get(Integer.valueOf(paramInt1));
    String str = (String)zzAb.get(Integer.valueOf(paramInt2));
    zzb.v("AdVideoView MediaPlayer info: " + paramMediaPlayer + ":" + str);
    return true;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int k = getDefaultSize(zzAh, paramInt1);
    int m = getDefaultSize(zzAi, paramInt2);
    int j = m;
    int i = k;
    int n;
    if (zzAh > 0)
    {
      j = m;
      i = k;
      if (zzAi > 0)
      {
        m = View.MeasureSpec.getMode(paramInt1);
        paramInt1 = View.MeasureSpec.getSize(paramInt1);
        n = View.MeasureSpec.getMode(paramInt2);
        paramInt2 = View.MeasureSpec.getSize(paramInt2);
        if ((m != 1073741824) || (n != 1073741824)) {
          break label211;
        }
        if (zzAh * paramInt2 >= zzAi * paramInt1) {
          break label178;
        }
        i = zzAh * paramInt2 / zzAi;
        j = paramInt2;
      }
    }
    for (;;)
    {
      setMeasuredDimension(i, j);
      if (Build.VERSION.SDK_INT == 16)
      {
        if (((zzAk > 0) && (zzAk != i)) || ((zzAl > 0) && (zzAl != j))) {
          zzem();
        }
        zzAk = i;
        zzAl = j;
      }
      return;
      label178:
      if (zzAh * paramInt2 > zzAi * paramInt1)
      {
        j = zzAi * paramInt1 / zzAh;
        i = paramInt1;
        continue;
        label211:
        if (m == 1073741824)
        {
          j = zzAi * paramInt1 / zzAh;
          if ((n == Integer.MIN_VALUE) && (j > paramInt2))
          {
            j = paramInt2;
            i = paramInt1;
          }
        }
        else
        {
          if (n == 1073741824)
          {
            k = zzAh * paramInt2 / zzAi;
            j = paramInt2;
            i = k;
            if (m != Integer.MIN_VALUE) {
              continue;
            }
            j = paramInt2;
            i = k;
            if (k <= paramInt1) {
              continue;
            }
            j = paramInt2;
            i = paramInt1;
            continue;
          }
          k = zzAh;
          i = zzAi;
          if ((n == Integer.MIN_VALUE) && (i > paramInt2)) {
            k = zzAh * paramInt2 / zzAi;
          }
          for (;;)
          {
            j = paramInt2;
            i = k;
            if (m != Integer.MIN_VALUE) {
              break;
            }
            j = paramInt2;
            i = k;
            if (k <= paramInt1) {
              break;
            }
            j = zzAi * paramInt1 / zzAh;
            i = paramInt1;
            break;
            paramInt2 = i;
          }
        }
        i = paramInt1;
      }
      else
      {
        j = paramInt2;
        i = paramInt1;
      }
    }
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    zzb.v("AdVideoView prepared");
    zzt(2);
    zzAc.zzeL();
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if (zzc.zza(zzc.this) != null) {
          zzc.zza(zzc.this).zzeL();
        }
      }
    });
    zzAh = paramMediaPlayer.getVideoWidth();
    zzAi = paramMediaPlayer.getVideoHeight();
    if (zzAp != 0) {
      seekTo(zzAp);
    }
    zzem();
    zzb.zzaD("AdVideoView stream dimensions: " + zzAh + " x " + zzAi);
    if (zzAe == 3) {
      play();
    }
    zzen();
    zzeu();
  }
  
  public void onSurfaceTextureAvailable(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
  {
    zzb.v("AdVideoView surface created");
    zzel();
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if (zzc.zza(zzc.this) != null) {
          zzc.zza(zzc.this).zzeK();
        }
      }
    });
  }
  
  public boolean onSurfaceTextureDestroyed(SurfaceTexture paramSurfaceTexture)
  {
    zzb.v("AdVideoView surface destroyed");
    if ((zzAf != null) && (zzAp == 0)) {
      zzAp = zzAf.getCurrentPosition();
    }
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if (zzc.zza(zzc.this) != null)
        {
          zzc.zza(zzc.this).onPaused();
          zzc.zza(zzc.this).zzeO();
        }
      }
    });
    zzt(true);
    return true;
  }
  
  public void onSurfaceTextureSizeChanged(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
  {
    int j = 1;
    zzb.v("AdVideoView surface changed");
    int i;
    if (zzAe == 3)
    {
      i = 1;
      if ((zzAh != paramInt1) || (zzAi != paramInt2)) {
        break label81;
      }
    }
    label81:
    for (paramInt1 = j;; paramInt1 = 0)
    {
      if ((zzAf != null) && (i != 0) && (paramInt1 != 0))
      {
        if (zzAp != 0) {
          seekTo(zzAp);
        }
        play();
      }
      return;
      i = 0;
      break;
    }
  }
  
  public void onSurfaceTextureUpdated(SurfaceTexture paramSurfaceTexture)
  {
    zzAc.zzb(this);
  }
  
  public void onVideoSizeChanged(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    zzb.v("AdVideoView size changed: " + paramInt1 + " x " + paramInt2);
    zzAh = paramMediaPlayer.getVideoWidth();
    zzAi = paramMediaPlayer.getVideoHeight();
    if ((zzAh != 0) && (zzAi != 0)) {
      requestLayout();
    }
  }
  
  public void pause()
  {
    zzb.v("AdVideoView pause");
    if ((zzep()) && (zzAf.isPlaying()))
    {
      zzAf.pause();
      zzt(4);
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          if (zzc.zza(zzc.this) != null) {
            zzc.zza(zzc.this).onPaused();
          }
        }
      });
    }
    zzu(4);
  }
  
  public void play()
  {
    zzb.v("AdVideoView play");
    if (zzep())
    {
      zzAf.start();
      zzt(3);
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          if (zzc.zza(zzc.this) != null) {
            zzc.zza(zzc.this).zzeM();
          }
        }
      });
    }
    zzu(3);
  }
  
  public void seekTo(int paramInt)
  {
    zzb.v("AdVideoView seek " + paramInt);
    if (zzep())
    {
      zzAf.seekTo(paramInt);
      zzAp = 0;
      return;
    }
    zzAp = paramInt;
  }
  
  public void setMimeType(String paramString) {}
  
  public void setVideoPath(String paramString)
  {
    setVideoURI(Uri.parse(paramString));
  }
  
  public void setVideoURI(Uri paramUri)
  {
    zzAg = paramUri;
    zzAp = 0;
    zzel();
    requestLayout();
    invalidate();
  }
  
  public void stop()
  {
    zzb.v("AdVideoView stop");
    if (zzAf != null)
    {
      zzAf.stop();
      zzAf.release();
      zzAf = null;
      zzt(0);
      zzu(0);
      zzeo();
    }
    zzAc.onStop();
  }
  
  public String toString()
  {
    return getClass().getName() + "@" + Integer.toHexString(hashCode());
  }
  
  public void zza(float paramFloat)
  {
    zzAm = paramFloat;
    zzeu();
  }
  
  public void zza(zzh paramZzh)
  {
    zzAq = paramZzh;
  }
  
  public String zzek()
  {
    return "MediaPlayer";
  }
  
  public void zzeq()
  {
    zzAn = true;
    zzeu();
  }
  
  public void zzer()
  {
    zzAn = false;
    zzeu();
  }
}
