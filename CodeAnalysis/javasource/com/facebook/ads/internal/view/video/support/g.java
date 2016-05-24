package com.facebook.ads.internal.view.video.support;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.view.View;
import android.widget.VideoView;

public class g
  extends VideoView
  implements MediaPlayer.OnPreparedListener, e
{
  private View a;
  private Uri b;
  private b c;
  
  public g(Context paramContext)
  {
    super(paramContext);
  }
  
  public void a(View paramView, Uri paramUri)
  {
    a = paramView;
    b = paramUri;
    setOnPreparedListener(this);
  }
  
  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    paramMediaPlayer.setLooping(true);
    paramMediaPlayer.setOnInfoListener(new c(a));
    if (c != null) {
      c.a(paramMediaPlayer);
    }
  }
  
  public void pause()
  {
    a.setVisibility(0);
    stopPlayback();
  }
  
  public void setFrameVideoViewListener(b paramB)
  {
    c = paramB;
  }
  
  public void start()
  {
    setVideoURI(b);
    super.start();
  }
}
