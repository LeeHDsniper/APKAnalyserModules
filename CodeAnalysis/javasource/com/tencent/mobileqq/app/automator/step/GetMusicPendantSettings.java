package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.musicpendant.MusicPendantManager;

public class GetMusicPendantSettings
  extends AsyncStep
{
  public GetMusicPendantSettings()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    MusicPendantManager.a().a(a.b.a(), a.b, null);
    return super.a();
  }
}
