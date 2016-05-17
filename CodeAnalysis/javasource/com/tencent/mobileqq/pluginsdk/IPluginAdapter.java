package com.tencent.mobileqq.pluginsdk;

import android.os.Bundle;

public abstract interface IPluginAdapter
{
  public static final int CMD_IS_NIGHT_MODE = 1;
  
  public abstract Object invoke(int paramInt, Bundle paramBundle);
}
