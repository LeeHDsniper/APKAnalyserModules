package com.tencent.mobileqq.msf.core.push;

import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;

class j
  implements MediaPlayer.OnCompletionListener
{
  j(f paramF) {}
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    paramMediaPlayer.release();
    a.R = null;
  }
}
