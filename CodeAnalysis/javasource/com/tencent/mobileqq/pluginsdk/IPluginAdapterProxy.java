package com.tencent.mobileqq.pluginsdk;

public class IPluginAdapterProxy
{
  static IPluginAdapterProxy a;
  private IPluginAdapter b;
  
  private IPluginAdapterProxy(IPluginAdapter paramIPluginAdapter)
  {
    b = paramIPluginAdapter;
  }
  
  public static IPluginAdapterProxy getProxy()
  {
    return a;
  }
  
  public static void setProxy(IPluginAdapter paramIPluginAdapter)
  {
    a = new IPluginAdapterProxy(paramIPluginAdapter);
  }
  
  public boolean isNightMode()
  {
    IPluginAdapter localIPluginAdapter = b;
    if (localIPluginAdapter == null) {
      return false;
    }
    return ((Boolean)localIPluginAdapter.invoke(1, null)).booleanValue();
  }
}
