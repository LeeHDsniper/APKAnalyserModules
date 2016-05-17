package com.tencent.mobileqq.msf.core.b;

import com.tencent.feedback.eup.CrashHandleListener;
import com.tencent.qphone.base.util.QLog;

class o
  implements CrashHandleListener
{
  o(m paramM) {}
  
  public byte[] getCrashExtraData(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong)
  {
    return null;
  }
  
  public String getCrashExtraMessage(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.StatReport", 2, "getCrashExtraMessage." + m.a(a).toString());
    }
    return m.a(a).toString();
  }
  
  public boolean onCrashHandleEnd(boolean paramBoolean)
  {
    return true;
  }
  
  public void onCrashHandleStart(boolean paramBoolean)
  {
    a.a();
    a.b();
  }
  
  public boolean onCrashSaving(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong, String paramString4, String paramString5, String paramString6)
  {
    return true;
  }
}
