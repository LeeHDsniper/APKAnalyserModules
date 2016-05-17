package com.tencent.mobileqq.activity.recent;

import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class RecentCallObserver
  implements com.tencent.mobileqq.app.BusinessObserver, mqq.observer.BusinessObserver
{
  public RecentCallObserver()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, Integer paramInteger, String paramString, List paramList, boolean paramBoolean2) {}
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle) {}
  
  public void onUpdate(int paramInt, boolean paramBoolean, Object paramObject)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    paramObject = (Object[])paramObject;
    a(paramBoolean, (Integer)paramObject[0], (String)paramObject[1], (List)paramObject[2], ((Boolean)paramObject[3]).booleanValue());
  }
}
