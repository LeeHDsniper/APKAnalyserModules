package com.facebook.ads.internal.view.video.support;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnInfoListener;
import android.view.View;

public class c
  implements MediaPlayer.OnInfoListener
{
  private View a;
  
  public c(View paramView)
  {
    a = paramView;
  }
  
  public boolean onInfo(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    if (paramInt1 == 3)
    {
      a.setVisibility(8);
      return true;
    }
    return false;
  }
}
