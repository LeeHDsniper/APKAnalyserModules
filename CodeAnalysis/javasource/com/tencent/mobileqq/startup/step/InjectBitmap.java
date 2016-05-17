package com.tencent.mobileqq.startup.step;

import com.tencent.image.SafeBitmapFactory;
import com.tencent.qphone.base.util.QLog;

public class InjectBitmap
  extends Step
{
  private static final String a = "InjectBitmap";
  
  public InjectBitmap() {}
  
  protected boolean a()
  {
    try
    {
      SafeBitmapFactory.injectBitmapHotPatch();
      return true;
    }
    catch (Throwable localThrowable)
    {
      QLog.e("InjectBitmap", 1, "", localThrowable);
    }
    return true;
  }
}
