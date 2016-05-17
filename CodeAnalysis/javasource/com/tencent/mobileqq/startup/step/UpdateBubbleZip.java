package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.contact.troop.TroopNotificationUtils;
import com.tencent.mobileqq.utils.FileUtils;
import java.io.File;

public class UpdateBubbleZip
  extends Step
{
  private static final String a = "classic_emoticon";
  
  public UpdateBubbleZip() {}
  
  protected boolean a()
  {
    TroopNotificationUtils.a();
    FileUtils.a(BaseApplicationImpl.a.getDir("classic_emoticon", 0).getPath());
    return true;
  }
}
