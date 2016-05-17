package com.tencent.mobileqq.startup.step;

import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.pluginsdk.PluginRecoverReceiver;
import rec;

public class SetPlugin
  extends Step
{
  public SetPlugin() {}
  
  protected boolean a()
  {
    PluginRecoverReceiver.register(BaseApplicationImpl.a, new rec());
    return true;
  }
}
