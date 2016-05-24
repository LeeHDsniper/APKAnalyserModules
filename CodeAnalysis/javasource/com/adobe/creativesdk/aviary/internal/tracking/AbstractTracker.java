package com.adobe.creativesdk.aviary.internal.tracking;

import android.content.Context;
import java.util.HashMap;

public abstract class AbstractTracker
{
  protected String mApiKey = "d2703c903";
  protected String mAppName = "com.aviary.feather";
  protected String mCallingAppName = "com.aviary.feather";
  protected String mSdkVersion;
  
  public AbstractTracker(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    mCallingAppName = paramString1;
    mAppName = paramString1;
    mApiKey = paramString2;
    mSdkVersion = paramString3;
  }
  
  public abstract boolean close();
  
  public abstract void open();
  
  public abstract void putCustomAttribute(String paramString1, String paramString2);
  
  public abstract boolean recordTag(String paramString, HashMap<String, String> paramHashMap);
  
  public abstract void upload();
}
