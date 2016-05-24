package com.adobe.creativesdk.aviary.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ProviderInfo;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.IAviaryClientCredentials;
import com.adobe.creativesdk.aviary.internal.cds.CdsAssetsDownloaderService;
import com.adobe.creativesdk.aviary.internal.cds.CdsProvider;
import com.adobe.creativesdk.aviary.internal.cds.CdsReceiver;
import com.adobe.creativesdk.aviary.internal.cds.CdsService;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.framework.Assert;
import junit.framework.AssertionFailedError;

public final class AdobeImageEditorIntentConfigurationValidator
{
  private AdobeImageEditorIntentConfigurationValidator() {}
  
  private static void validateActivities(Context paramContext, PackageInfo paramPackageInfo)
  {
    boolean bool = false;
    paramContext = activities;
    int j = paramContext.length;
    int i = 0;
    while (i < j)
    {
      if (name.equals(AdobeImageEditorActivity.class.getName())) {
        bool = true;
      }
      i += 1;
    }
    Assert.assertTrue("'AdobeImageEditorActivity' not found in the AndroidManifest", bool);
  }
  
  private static void validateApplicationContext(Context paramContext)
  {
    paramContext = paramContext.getApplicationContext();
    Assert.assertNotNull(paramContext);
    Assert.assertTrue("Your Application must implements IAviaryClientCredentials", paramContext instanceof IAviaryClientCredentials);
    paramContext = (IAviaryClientCredentials)paramContext;
    Assert.assertFalse("getClientID must return a non empty string", TextUtils.isEmpty(paramContext.getClientID()));
    Assert.assertFalse("getClientSecret must return a non empty string", TextUtils.isEmpty(paramContext.getClientSecret()));
    Assert.assertNotNull("getBillingKey must return a non empty string", paramContext.getBillingKey());
  }
  
  public static void validateConfiguration(Context paramContext)
    throws PackageManager.NameNotFoundException
  {
    Assert.assertNotNull(paramContext);
    validateApplicationContext(paramContext);
    PackageInfo localPackageInfo = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 29023);
    validateReceivers(paramContext, localPackageInfo);
    validateServices(paramContext, localPackageInfo);
    validateActivities(paramContext, localPackageInfo);
    validatePermissions(paramContext, localPackageInfo);
  }
  
  @TargetApi(16)
  private static void validatePermissions(Context paramContext, PackageInfo paramPackageInfo)
  {
    if (ApiHelper.AT_LEAST_16)
    {
      paramContext = new String[4];
      paramContext[0] = "android.permission.WRITE_EXTERNAL_STORAGE";
      paramContext[1] = "android.permission.READ_EXTERNAL_STORAGE";
      paramContext[2] = "android.permission.INTERNET";
      paramContext[3] = "android.permission.BROADCAST_STICKY";
    }
    for (;;)
    {
      paramContext = new ArrayList(Arrays.asList(paramContext));
      paramPackageInfo = requestedPermissions;
      int j = paramPackageInfo.length;
      int i = 0;
      while (i < j)
      {
        Object localObject = paramPackageInfo[i];
        if (paramContext.contains(localObject)) {
          paramContext.remove(localObject);
        }
        i += 1;
      }
      paramContext = new String[3];
      paramContext[0] = "android.permission.WRITE_EXTERNAL_STORAGE";
      paramContext[1] = "android.permission.INTERNET";
      paramContext[2] = "android.permission.BROADCAST_STICKY";
    }
    if (paramContext.size() > 0) {
      throw new AssertionFailedError("Missing permission: '" + (String)paramContext.get(0) + "'");
    }
  }
  
  private static void validateReceivers(Context paramContext, PackageInfo paramPackageInfo)
  {
    boolean bool2 = false;
    paramContext = receivers;
    int j = paramContext.length;
    int i = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i < j)
      {
        if (name.equals(CdsReceiver.class.getName())) {
          bool1 = true;
        }
      }
      else
      {
        Assert.assertTrue("'CdsReceiver' not found in the AndroidManifest.xml", bool1);
        return;
      }
      i += 1;
    }
  }
  
  private static void validateServices(Context paramContext, PackageInfo paramPackageInfo)
  {
    int j = 0;
    boolean bool1 = false;
    boolean bool2 = false;
    ServiceInfo[] arrayOfServiceInfo = services;
    int k = arrayOfServiceInfo.length;
    int i = 0;
    if (i < k)
    {
      ServiceInfo localServiceInfo = arrayOfServiceInfo[i];
      boolean bool3;
      if (name.equals(CdsAssetsDownloaderService.class.getName())) {
        bool3 = true;
      }
      for (;;)
      {
        i += 1;
        bool1 = bool3;
        break;
        bool3 = bool1;
        if (name.equals(CdsService.class.getName()))
        {
          bool2 = true;
          bool3 = bool1;
        }
      }
    }
    Assert.assertTrue("'CdsAssetsDownloaderService' not found in the AndroidManifest", bool1);
    Assert.assertTrue("'CdsService' not found in the AndroidManifest", bool2);
    bool1 = false;
    paramPackageInfo = providers;
    k = paramPackageInfo.length;
    i = j;
    while (i < k)
    {
      arrayOfServiceInfo = paramPackageInfo[i];
      if (name.equals(CdsProvider.class.getName()))
      {
        Assert.assertTrue("Wrong value for attribute 'android:authorities' of the CdsProvider. Found '" + authority + "'," + " but '" + paramContext.getPackageName() + "." + CdsProvider.class.getSimpleName() + "' is required", authority.equals(paramContext.getPackageName() + "." + CdsProvider.class.getSimpleName()));
        bool1 = true;
      }
      i += 1;
    }
    Assert.assertTrue("Missing 'CdsProvider' from the manifest", bool1);
  }
}
