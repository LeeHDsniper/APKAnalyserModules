package com.tencent.mobileqq.activity.aio.item;

import android.graphics.drawable.AnimationDrawable;
import android.os.Handler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import kvd;

public abstract class DetectableAnimationDrawable
  extends AnimationDrawable
{
  Handler a;
  
  public DetectableAnimationDrawable(AnimationDrawable paramAnimationDrawable)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    int i = 0;
    while (i < paramAnimationDrawable.getNumberOfFrames())
    {
      addFrame(paramAnimationDrawable.getFrame(i), paramAnimationDrawable.getDuration(i));
      i += 1;
    }
  }
  
  private int a()
  {
    int i = 0;
    int j = 0;
    while (i < getNumberOfFrames())
    {
      j += getDuration(i);
      i += 1;
    }
    return j;
  }
  
  public abstract void a();
  
  public void start()
  {
    super.start();
    a = new Handler();
    a.postDelayed(new kvd(this), a());
  }
}
