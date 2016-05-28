package com.facebook.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;
import com.facebook.FacebookException;
import java.lang.reflect.Method;

public class AttributionIdentifiers
{
  private static final Uri ATTRIBUTION_ID_CONTENT_URI = Uri.parse("content://com.facebook.katana.provider.AttributionIdProvider");
  private static final String TAG = AttributionIdentifiers.class.getCanonicalName();
  private static AttributionIdentifiers recentlyFetchedIdentifiers;
  private String androidAdvertiserId;
  private String attributionId;
  private long fetchTime;
  private boolean limitTracking;
  
  public AttributionIdentifiers() {}
  
  private static AttributionIdentifiers getAndroidId(Context paramContext)
  {
    AttributionIdentifiers localAttributionIdentifiers = new AttributionIdentifiers();
    Object localObject;
    Method localMethod;
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              try
              {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                  throw new FacebookException("getAndroidId cannot be called on the main thread.");
                }
              }
              catch (Exception paramContext)
              {
                Utility.logd("android_id", paramContext);
                return localAttributionIdentifiers;
              }
              localObject = Utility.getMethodQuietly("com.google.android.gms.common.GooglePlayServicesUtil", "isGooglePlayServicesAvailable", new Class[] { Context.class });
            } while (localObject == null);
            localObject = Utility.invokeMethodQuietly(null, (Method)localObject, new Object[] { paramContext });
          } while ((!(localObject instanceof Integer)) || (((Integer)localObject).intValue() != 0));
          localObject = Utility.getMethodQuietly("com.google.android.gms.ads.identifier.AdvertisingIdClient", "getAdvertisingIdInfo", new Class[] { Context.class });
        } while (localObject == null);
        paramContext = Utility.invokeMethodQuietly(null, (Method)localObject, new Object[] { paramContext });
      } while (paramContext == null);
      localObject = Utility.getMethodQuietly(paramContext.getClass(), "getId", new Class[0]);
      localMethod = Utility.getMethodQuietly(paramContext.getClass(), "isLimitAdTrackingEnabled", new Class[0]);
    } while ((localObject == null) || (localMethod == null));
    androidAdvertiserId = ((String)Utility.invokeMethodQuietly(paramContext, (Method)localObject, new Object[0]));
    limitTracking = ((Boolean)Utility.invokeMethodQuietly(paramContext, localMethod, new Object[0])).booleanValue();
    return localAttributionIdentifiers;
  }
  
  public static AttributionIdentifiers getAttributionIdentifiers(Context paramContext)
  {
    if ((recentlyFetchedIdentifiers != null) && (System.currentTimeMillis() - recentlyFetchedIdentifiersfetchTime < 3600000L)) {
      return recentlyFetchedIdentifiers;
    }
    AttributionIdentifiers localAttributionIdentifiers = getAndroidId(paramContext);
    try
    {
      paramContext = paramContext.getContentResolver().query(ATTRIBUTION_ID_CONTENT_URI, new String[] { "aid", "androidid", "limit_tracking" }, null, null, null);
      if ((paramContext != null) && (paramContext.moveToFirst()))
      {
        int i = paramContext.getColumnIndex("aid");
        int j = paramContext.getColumnIndex("androidid");
        int k = paramContext.getColumnIndex("limit_tracking");
        attributionId = paramContext.getString(i);
        if ((j > 0) && (k > 0) && (localAttributionIdentifiers.getAndroidAdvertiserId() == null))
        {
          androidAdvertiserId = paramContext.getString(j);
          limitTracking = Boolean.parseBoolean(paramContext.getString(k));
        }
        paramContext.close();
        fetchTime = System.currentTimeMillis();
        recentlyFetchedIdentifiers = localAttributionIdentifiers;
        return localAttributionIdentifiers;
      }
    }
    catch (Exception paramContext)
    {
      Log.d(TAG, "Caught unexpected exception in getAttributionId(): " + paramContext.toString());
      return null;
    }
    return null;
  }
  
  public String getAndroidAdvertiserId()
  {
    return androidAdvertiserId;
  }
  
  public String getAttributionId()
  {
    return attributionId;
  }
  
  public boolean isTrackingLimited()
  {
    return limitTracking;
  }
}
