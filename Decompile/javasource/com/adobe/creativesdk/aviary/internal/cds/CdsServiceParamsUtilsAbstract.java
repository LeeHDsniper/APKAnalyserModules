package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.utils.SDKUtils;
import com.adobe.creativesdk.aviary.internal.utils.ScreenUtils;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import java.util.List;
import java.util.Locale;

class CdsServiceParamsUtilsAbstract
{
  private static String mContentGroup;
  private static String mCountry;
  private static int mDebug = -1;
  private static String mLanguage;
  private static Locale mLocale;
  private static CdsServiceParamsUtilsAbstract sInstance = new CdsServiceParamsUtils();
  
  protected CdsServiceParamsUtilsAbstract() {}
  
  public static CdsServiceParamsUtilsAbstract getInstance()
  {
    try
    {
      CdsServiceParamsUtilsAbstract localCdsServiceParamsUtilsAbstract = sInstance;
      return localCdsServiceParamsUtilsAbstract;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  String getContentGroup(Context paramContext)
  {
    if (mContentGroup == null)
    {
      paramContext = getPreferences(paramContext);
      if (paramContext == null) {
        break label108;
      }
      long l = paramContext.getCdsContentGroupUpdateTime();
      mContentGroup = paramContext.getCdsContentGroup();
      if (System.currentTimeMillis() - l > 86400000L)
      {
        mContentGroup = new String(new char[] { (char)((int)(Math.random() * 10.0D) + 65) });
        paramContext.setCdsContentGroup(mContentGroup);
        paramContext.setCdsContentGroupUpdateTime(System.currentTimeMillis());
      }
    }
    for (;;)
    {
      if ((mContentGroup == null) || (!mContentGroup.matches("[A-J]"))) {
        mContentGroup = "A";
      }
      return mContentGroup;
      label108:
      mContentGroup = "A";
    }
  }
  
  String getCountry()
  {
    if (mCountry == null)
    {
      String str2 = getLocale().getCountry();
      String str1 = str2;
      if (!CdsUtils.CDS_SUPPORTED_COUNTRIES.contains(str2)) {
        str1 = "";
      }
      mCountry = str1;
    }
    return mCountry;
  }
  
  String getFormFactor(Context paramContext)
  {
    if (ScreenUtils.isTablet(paramContext)) {
      return "tablet";
    }
    return "phone";
  }
  
  String getLanguage()
  {
    if (mLanguage == null)
    {
      String str2 = getLocale().getLanguage();
      String str1 = str2;
      if (!CdsUtils.CDS_SUPPORTED_LANGUAGES.contains(str2)) {
        str1 = "";
      }
      mLanguage = str1;
    }
    return mLanguage;
  }
  
  Locale getLocale()
  {
    if (mLocale == null) {
      mLocale = Locale.getDefault();
    }
    return mLocale;
  }
  
  SharedPreferencesUtils getPreferences(Context paramContext)
  {
    return SharedPreferencesUtils.getInstance(paramContext);
  }
  
  String getResolution(Context paramContext)
  {
    return CdsUtils.getResolution(paramContext);
  }
  
  String getServerUrl(Context paramContext)
  {
    if (isDebug(paramContext)) {
      return "http://cds-gateway.aviary.com/v1/gateway";
    }
    return "http://cds-gateway.aviary.com/v1/gateway";
  }
  
  boolean hasCountryParam()
  {
    return !"".equals(getCountry());
  }
  
  boolean hasLanguageParam()
  {
    return !"".equals(getLanguage());
  }
  
  boolean isDebug(Context paramContext)
  {
    return isDebugInternal(paramContext);
  }
  
  boolean isDebugInternal(Context paramContext)
  {
    if (mDebug < 0) {
      if (!SDKUtils.getCDSDebug(paramContext)) {
        break label55;
      }
    }
    label55:
    for (int i = 1;; i = 0)
    {
      mDebug = i;
      Log.v("CdsServiceParamsUtils", "using cds debug: " + mDebug);
      if (mDebug != 1) {
        break;
      }
      return true;
    }
    return false;
  }
}
