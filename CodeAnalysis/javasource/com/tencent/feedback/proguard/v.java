package com.tencent.feedback.proguard;

import android.content.Context;
import com.tencent.feedback.common.e;
import com.tencent.feedback.upload.AbstractUploadDatas;

public final class v
  extends AbstractUploadDatas
{
  private S d = null;
  
  public v(Context paramContext, int paramInt1, int paramInt2, S paramS)
  {
    super(paramContext, 1111, 540);
    d = paramS;
  }
  
  public final N a()
  {
    try
    {
      Context localContext = c;
      int i = a;
      if (d == null) {}
      for (byte[] arrayOfByte = null;; arrayOfByte = d.a()) {
        return a(localContext, i, arrayOfByte);
      }
      return null;
    }
    catch (Exception localException)
    {
      if (!e.a(localException)) {
        localException.printStackTrace();
      }
    }
  }
  
  public final void done(boolean paramBoolean) {}
}
