package com.tencent.mobileqq.pluginsdk;

import android.content.Context;

public abstract interface IStatisticsUploader
{
  public abstract void uploadStartupFailure(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5);
}
