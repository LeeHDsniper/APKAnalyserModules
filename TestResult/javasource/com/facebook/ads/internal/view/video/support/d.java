package com.facebook.ads.internal.view.video.support;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View;

@TargetApi(14)
public class d
  extends TextureView
  implements MediaPlayer.OnBufferingUpdateListener, MediaPlayer.OnPreparedListener, TextureView.SurfaceTextureListener, e
{
  private static final String i = d.class.getSimpleName();
  private View a;
  private Uri b;
  private b c;
  private Surface d;
  private MediaPlayer e;
  private boolean f;
  private boolean g;
  private int h;
  
  public d(Context paramContext)
  {
    super(paramContext);
  }
  
  private void a()
  {
    MediaPlayer localMediaPlayer = new MediaPlayer();
    try
    {
      localMediaPlayer.setDataSource(getContext(), b);
      localMediaPlayer.setSurface(d);
      localMediaPlayer.setOnPreparedListener(this);
      localMediaPlayer.setOnInfoListener(new c(a));
      localMediaPlayer.setOnBufferingUpdateListener(this);
      localMediaPlayer.setLooping(false);
      localMediaPlayer.prepareAsync();
      e = localMediaPlayer;
      return;
    }
    catch (Exception localException)
    {
      localMediaPlayer.release();
      Log.e(i, "Cannot prepare media player with SurfaceTexture: " + localException);
    }
  }
  
  public void a(View paramView, Uri paramUri)
  {
    a = paramView;
    b = paramUri;
    setSurfaceTextureListener(this);
  }
  
  public int getCurrentPosition()
  {
    int j = 0;
    if (e != null) {
      j = e.getCurrentPosition();
    }
    return j;
  }
  
  public void onBufferingUpdate(MediaPlayer paramMediaPlayer, int paramInt) {}
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (c != null) {
      c.a(paramMediaPlayer);
    }
    if (g)
    {
      paramMediaPlayer.start();
      g = false;
    }
    if (h > 0)
    {
      if (h >= e.getDuration()) {
        h = 0;
      }
      e.seekTo(h);
      h = 0;
    }
    f = true;
  }
  
  public void onSurfaceTextureAvailable(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
  {
    d = new Surface(paramSurfaceTexture);
    a();
  }
  
  public boolean onSurfaceTextureDestroyed(SurfaceTexture paramSurfaceTexture)
  {
    return false;
  }
  
  public void onSurfaceTextureSizeChanged(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2) {}
  
  public void onSurfaceTextureUpdated(SurfaceTexture paramSurfaceTexture) {}
  
  public void setFrameVideoViewListener(b paramB)
  {
    c = paramB;
  }
  
  public void start()
  {
    if (f) {
      e.start();
    }
    for (;;)
    {
      if (isAvailable()) {
        onSurfaceTextureAvailable(getSurfaceTexture(), 0, 0);
      }
      return;
      g = true;
    }
  }
}
