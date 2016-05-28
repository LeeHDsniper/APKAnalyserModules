package com.adobe.creativesdk.aviary.internal.tracking;

import android.content.Context;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.utils.CredentialsUtils;
import it.sephiroth.android.library.ab.AB;
import it.sephiroth.android.library.ab.AB.Group;
import java.util.HashMap;
import junit.framework.Assert;

public class AdobeImageAnalyticsTracker
{
  private static AdobeImageAnalyticsTracker instance;
  private AbstractTracker mInstance;
  
  AdobeImageAnalyticsTracker(Context paramContext)
  {
    String str1 = paramContext.getPackageName();
    String str2 = CredentialsUtils.getApiKey(paramContext);
    Assert.assertFalse("CreativeSDK api-key is missing.", TextUtils.isEmpty(str2));
    mInstance = TrackerFactory.create(paramContext, str1, str2, "4.1.1");
    paramContext = AB.getInstance(paramContext).getGroup();
    mInstance.putCustomAttribute("ab-group", paramContext.name());
  }
  
  public static AdobeImageAnalyticsTracker getInstance(Context paramContext)
  {
    if (instance == null) {}
    try
    {
      if (instance == null) {
        instance = new AdobeImageAnalyticsTracker(paramContext);
      }
      return instance;
    }
    finally {}
  }
  
  public void close()
  {
    if (mInstance != null) {
      mInstance.close();
    }
  }
  
  public void open()
  {
    if (mInstance != null) {
      mInstance.open();
    }
  }
  
  public void tagEvent(String paramString)
  {
    tagEventAttributes(paramString, null);
  }
  
  public void tagEvent(String paramString, String... paramVarArgs)
  {
    if (mInstance == null) {
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length > 0))
    {
      if (paramVarArgs.length % 2 != 0) {
        throw new IllegalArgumentException("attributes array must be even. Found " + paramVarArgs.length);
      }
      HashMap localHashMap = new HashMap();
      int i = 0;
      while (i < paramVarArgs.length)
      {
        localHashMap.put(paramVarArgs[i], paramVarArgs[(i + 1)]);
        i += 2;
      }
      tagEventAttributes(paramString, localHashMap);
      return;
    }
    tagEventAttributes(paramString, null);
  }
  
  public void tagEventAttributes(String paramString, HashMap<String, String> paramHashMap)
  {
    if (mInstance != null) {
      mInstance.recordTag(paramString, paramHashMap);
    }
  }
  
  public void trackBeginPurchaseFlow(String paramString1, String paramString2)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("pack", paramString1);
    localHashMap.put("from", paramString2);
    tagEventAttributes(paramString2 + ": purchase_initiated", localHashMap);
  }
  
  public void trackContentInstalled(String paramString1, String paramString2)
  {
    tagEvent("content: installed", new String[] { "pack", paramString1, "from", paramString2 });
  }
  
  public void trackContentRestored(String paramString1, String paramString2)
  {
    tagEvent("content: restored", new String[] { "pack", paramString1, "from", paramString2 });
  }
  
  public void trackEndPurchaseFlow(String paramString1, String paramString2, boolean paramBoolean, int paramInt)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("pack", paramString1);
    localHashMap.put("from", paramString2);
    if (paramBoolean) {}
    for (paramString1 = "true";; paramString1 = "false")
    {
      localHashMap.put("success", paramString1);
      if (paramInt != -1) {
        localHashMap.put("position", String.valueOf(paramInt));
      }
      tagEventAttributes("content: purchased", localHashMap);
      return;
    }
  }
  
  public void upload()
  {
    if (mInstance != null) {
      mInstance.upload();
    }
  }
}
