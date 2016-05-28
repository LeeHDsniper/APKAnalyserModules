package com.facebook.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.pm.Signature;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.SessionDefaultAudience;
import com.facebook.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class NativeProtocol
{
  private static final NativeAppInfo FACEBOOK_APP_INFO = new KatanaAppInfo(null);
  private static final List<Integer> KNOWN_PROTOCOL_VERSIONS = Arrays.asList(new Integer[] { Integer.valueOf(20140701), Integer.valueOf(20140324), Integer.valueOf(20140204), Integer.valueOf(20131107), Integer.valueOf(20130618), Integer.valueOf(20130502), Integer.valueOf(20121101) });
  private static Map<String, List<NativeAppInfo>> actionToAppInfoMap;
  private static List<NativeAppInfo> facebookAppInfoList = buildFacebookAppList();
  
  static
  {
    actionToAppInfoMap = buildActionToAppInfoMap();
  }
  
  private static Map<String, List<NativeAppInfo>> buildActionToAppInfoMap()
  {
    HashMap localHashMap = new HashMap();
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new MessengerAppInfo(null));
    localHashMap.put("com.facebook.platform.action.request.OGACTIONPUBLISH_DIALOG", facebookAppInfoList);
    localHashMap.put("com.facebook.platform.action.request.FEED_DIALOG", facebookAppInfoList);
    localHashMap.put("com.facebook.platform.action.request.MESSAGE_DIALOG", localArrayList);
    localHashMap.put("com.facebook.platform.action.request.OGMESSAGEPUBLISH_DIALOG", localArrayList);
    return localHashMap;
  }
  
  private static List<NativeAppInfo> buildFacebookAppList()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(FACEBOOK_APP_INFO);
    localArrayList.add(new WakizashiAppInfo(null));
    return localArrayList;
  }
  
  private static Uri buildPlatformProviderVersionURI(NativeAppInfo paramNativeAppInfo)
  {
    return Uri.parse("content://" + paramNativeAppInfo.getPackage() + ".provider.PlatformProvider/versions");
  }
  
  public static Intent createPlatformServiceIntent(Context paramContext)
  {
    Iterator localIterator = facebookAppInfoList.iterator();
    Object localObject;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localObject = (NativeAppInfo)localIterator.next();
      localObject = validateServiceIntent(paramContext, new Intent("com.facebook.platform.PLATFORM_SERVICE").setPackage(((NativeAppInfo)localObject).getPackage()).addCategory("android.intent.category.DEFAULT"), (NativeAppInfo)localObject);
    } while (localObject == null);
    return localObject;
  }
  
  public static Intent createProxyAuthIntent(Context paramContext, String paramString1, List<String> paramList, String paramString2, boolean paramBoolean, SessionDefaultAudience paramSessionDefaultAudience)
  {
    Iterator localIterator = facebookAppInfoList.iterator();
    Object localObject;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localObject = (NativeAppInfo)localIterator.next();
      Intent localIntent = new Intent().setClassName(((NativeAppInfo)localObject).getPackage(), "com.facebook.katana.ProxyAuth").putExtra("client_id", paramString1);
      if (!Utility.isNullOrEmpty(paramList)) {
        localIntent.putExtra("scope", TextUtils.join(",", paramList));
      }
      if (!Utility.isNullOrEmpty(paramString2)) {
        localIntent.putExtra("e2e", paramString2);
      }
      localIntent.putExtra("response_type", "token");
      localIntent.putExtra("return_scopes", "true");
      localIntent.putExtra("default_audience", paramSessionDefaultAudience.getNativeProtocolAudience());
      if (!Settings.getPlatformCompatibilityEnabled())
      {
        localIntent.putExtra("legacy_override", "v2.1");
        if (paramBoolean) {
          localIntent.putExtra("auth_type", "rerequest");
        }
      }
      localObject = validateActivityIntent(paramContext, localIntent, (NativeAppInfo)localObject);
    } while (localObject == null);
    return localObject;
  }
  
  public static Intent createTokenRefreshIntent(Context paramContext)
  {
    Iterator localIterator = facebookAppInfoList.iterator();
    Object localObject;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localObject = (NativeAppInfo)localIterator.next();
      localObject = validateServiceIntent(paramContext, new Intent().setClassName(((NativeAppInfo)localObject).getPackage(), "com.facebook.katana.platform.TokenRefreshService"), (NativeAppInfo)localObject);
    } while (localObject == null);
    return localObject;
  }
  
  public static Bundle getBridgeArgumentsFromIntent(Intent paramIntent)
  {
    if (!isVersionCompatibleWithBucketedIntent(getProtocolVersionFromIntent(paramIntent))) {
      return null;
    }
    return paramIntent.getBundleExtra("com.facebook.platform.protocol.BRIDGE_ARGS");
  }
  
  private static int getLatestAvailableProtocolVersionForAppInfo(Context paramContext, NativeAppInfo paramNativeAppInfo, int paramInt)
  {
    Object localObject = paramContext.getContentResolver();
    paramNativeAppInfo = buildPlatformProviderVersionURI(paramNativeAppInfo);
    paramContext = null;
    int i;
    do
    {
      Integer localInteger;
      do
      {
        Iterator localIterator;
        try
        {
          paramNativeAppInfo = ((ContentResolver)localObject).query(paramNativeAppInfo, new String[] { "version" }, null, null, null);
          if (paramNativeAppInfo == null)
          {
            if (paramNativeAppInfo != null) {
              paramNativeAppInfo.close();
            }
            paramInt = -1;
            return paramInt;
          }
          paramContext = paramNativeAppInfo;
          localObject = new HashSet();
          for (;;)
          {
            paramContext = paramNativeAppInfo;
            if (!paramNativeAppInfo.moveToNext())
            {
              paramContext = paramNativeAppInfo;
              localIterator = KNOWN_PROTOCOL_VERSIONS.iterator();
              paramContext = paramNativeAppInfo;
              boolean bool = localIterator.hasNext();
              if (bool) {
                break;
              }
              return -1;
            }
            paramContext = paramNativeAppInfo;
            ((Set)localObject).add(Integer.valueOf(paramNativeAppInfo.getInt(paramNativeAppInfo.getColumnIndex("version"))));
          }
          paramContext = paramNativeAppInfo;
        }
        finally
        {
          if (paramContext != null) {
            paramContext.close();
          }
        }
        localInteger = (Integer)localIterator.next();
        paramContext = paramNativeAppInfo;
        i = localInteger.intValue();
        if (i < paramInt)
        {
          if (paramNativeAppInfo != null) {
            paramNativeAppInfo.close();
          }
          return -1;
        }
        paramContext = paramNativeAppInfo;
      } while (!((Set)localObject).contains(localInteger));
      paramContext = paramNativeAppInfo;
      i = localInteger.intValue();
      paramInt = i;
    } while (paramNativeAppInfo == null);
    paramNativeAppInfo.close();
    return i;
  }
  
  private static int getLatestAvailableProtocolVersionForAppInfoList(Context paramContext, List<NativeAppInfo> paramList, int paramInt)
  {
    if (paramList == null) {
      return -1;
    }
    paramList = paramList.iterator();
    int i;
    do
    {
      if (!paramList.hasNext()) {
        return -1;
      }
      i = getLatestAvailableProtocolVersionForAppInfo(paramContext, (NativeAppInfo)paramList.next(), paramInt);
    } while (i == -1);
    return i;
  }
  
  public static int getLatestAvailableProtocolVersionForService(Context paramContext, int paramInt)
  {
    return getLatestAvailableProtocolVersionForAppInfoList(paramContext, facebookAppInfoList, paramInt);
  }
  
  public static int getProtocolVersionFromIntent(Intent paramIntent)
  {
    return paramIntent.getIntExtra("com.facebook.platform.protocol.PROTOCOL_VERSION", 0);
  }
  
  public static boolean isErrorResult(Intent paramIntent)
  {
    Bundle localBundle = getBridgeArgumentsFromIntent(paramIntent);
    if (localBundle != null) {
      return localBundle.containsKey("error");
    }
    return paramIntent.hasExtra("com.facebook.platform.status.ERROR_TYPE");
  }
  
  public static boolean isVersionCompatibleWithBucketedIntent(int paramInt)
  {
    return (KNOWN_PROTOCOL_VERSIONS.contains(Integer.valueOf(paramInt))) && (paramInt >= 20140701);
  }
  
  static Intent validateActivityIntent(Context paramContext, Intent paramIntent, NativeAppInfo paramNativeAppInfo)
  {
    if (paramIntent == null) {
      paramIntent = null;
    }
    ResolveInfo localResolveInfo;
    do
    {
      return paramIntent;
      localResolveInfo = paramContext.getPackageManager().resolveActivity(paramIntent, 0);
      if (localResolveInfo == null) {
        return null;
      }
    } while (paramNativeAppInfo.validateSignature(paramContext, activityInfo.packageName));
    return null;
  }
  
  static Intent validateServiceIntent(Context paramContext, Intent paramIntent, NativeAppInfo paramNativeAppInfo)
  {
    if (paramIntent == null) {
      paramIntent = null;
    }
    ResolveInfo localResolveInfo;
    do
    {
      return paramIntent;
      localResolveInfo = paramContext.getPackageManager().resolveService(paramIntent, 0);
      if (localResolveInfo == null) {
        return null;
      }
    } while (paramNativeAppInfo.validateSignature(paramContext, serviceInfo.packageName));
    return null;
  }
  
  private static class KatanaAppInfo
    extends NativeProtocol.NativeAppInfo
  {
    private KatanaAppInfo()
    {
      super();
    }
    
    protected String getPackage()
    {
      return "com.facebook.katana";
    }
  }
  
  private static class MessengerAppInfo
    extends NativeProtocol.NativeAppInfo
  {
    private MessengerAppInfo()
    {
      super();
    }
    
    protected String getPackage()
    {
      return "com.facebook.orca";
    }
  }
  
  private static abstract class NativeAppInfo
  {
    private static final HashSet<String> validAppSignatureHashes = ;
    
    private NativeAppInfo() {}
    
    private static HashSet<String> buildAppSignatureHashes()
    {
      HashSet localHashSet = new HashSet();
      localHashSet.add("8a3c4b262d721acd49a4bf97d5213199c86fa2b9");
      localHashSet.add("a4b7452e2ed8f5f191058ca7bbfd26b0d3214bfc");
      localHashSet.add("5e8f16062ea3cd2c4a0d547876baa6f38cabf625");
      return localHashSet;
    }
    
    protected abstract String getPackage();
    
    public boolean validateSignature(Context paramContext, String paramString)
    {
      String str = Build.BRAND;
      int i = getApplicationInfoflags;
      if ((str.startsWith("generic")) && ((i & 0x2) != 0)) {
        return true;
      }
      for (;;)
      {
        try
        {
          paramContext = paramContext.getPackageManager().getPackageInfo(paramString, 64);
          paramContext = signatures;
          int j = paramContext.length;
          i = 0;
          if (i >= j) {
            return false;
          }
        }
        catch (PackageManager.NameNotFoundException paramContext)
        {
          return false;
        }
        paramString = Utility.sha1hash(paramContext[i].toByteArray());
        if (validAppSignatureHashes.contains(paramString)) {
          break;
        }
        i += 1;
      }
    }
  }
  
  private static class WakizashiAppInfo
    extends NativeProtocol.NativeAppInfo
  {
    private WakizashiAppInfo()
    {
      super();
    }
    
    protected String getPackage()
    {
      return "com.facebook.wakizashi";
    }
  }
}
