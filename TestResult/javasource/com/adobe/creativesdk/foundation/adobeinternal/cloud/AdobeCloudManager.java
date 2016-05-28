package com.adobe.creativesdk.foundation.adobeinternal.cloud;

import android.os.Handler;
import android.util.Base64;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementSession;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthKeychain;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import org.json.JSONObject;

public class AdobeCloudManager
  implements Observer
{
  private static AdobeCloudManager _sharedManager = null;
  private ArrayList<AdobeCloud> _clouds = new ArrayList();
  private AdobeCloud _defaultCloud = null;
  private boolean _ignoreNotification = false;
  private Object _syncObject = null;
  
  protected AdobeCloudManager()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, this);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeEntilementUserProfileDataFetchNotification, this);
  }
  
  private static AdobeCloud fromString(String paramString)
    throws IOException, ClassNotFoundException
  {
    paramString = new ObjectInputStream(new ByteArrayInputStream(Base64.decode(paramString.getBytes(), 0)));
    AdobeCloud localAdobeCloud = (AdobeCloud)paramString.readObject();
    AdobeLogger.log(Level.DEBUG, "AdobeCloudManager", "Adobe Cloud being retrieved from cache =" + localAdobeCloud.toString());
    paramString.close();
    return localAdobeCloud;
  }
  
  private AdobeCloud getBestGuessForDefaultCloud()
  {
    if ((_clouds == null) || (_clouds.size() <= 0)) {
      refreshCloudsFromCache();
    }
    AdobeCloud localAdobeCloud;
    do
    {
      Iterator localIterator;
      while (!localIterator.hasNext())
      {
        return null;
        if (_clouds.size() == 1) {
          return (AdobeCloud)_clouds.get(0);
        }
        localIterator = _clouds.iterator();
      }
      localAdobeCloud = (AdobeCloud)localIterator.next();
    } while (localAdobeCloud.isPrivateCloud());
    return localAdobeCloud;
  }
  
  /* Error */
  public static AdobeCloudManager getSharedCloudManager()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 25	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_sharedManager	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    //   6: ifnonnull +148 -> 154
    //   9: new 2	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager
    //   12: dup
    //   13: invokespecial 164	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:<init>	()V
    //   16: putstatic 25	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_sharedManager	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    //   19: invokestatic 170	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:getSharedKeychain	()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    //   22: invokevirtual 173	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:getAdobeID	()Ljava/lang/String;
    //   25: astore_2
    //   26: getstatic 179	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions:AdobeCommonCacheKeepInMemoryCache	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
    //   29: invokestatic 185	java/util/EnumSet:of	(Ljava/lang/Enum;)Ljava/util/EnumSet;
    //   32: astore_3
    //   33: invokestatic 191	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache:getSharedInstance	()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;
    //   36: aload_2
    //   37: ldc -63
    //   39: ldc -61
    //   41: invokevirtual 199	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache:containsItem	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    //   44: istore_0
    //   45: iload_0
    //   46: ifeq +108 -> 154
    //   49: aconst_null
    //   50: astore_1
    //   51: new 201	org/json/JSONObject
    //   54: dup
    //   55: invokestatic 191	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache:getSharedInstance	()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;
    //   58: aload_2
    //   59: ldc -63
    //   61: aload_3
    //   62: ldc -61
    //   64: invokevirtual 205	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache:getDataFromGUID	(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Ljava/lang/Object;
    //   67: checkcast 75	java/lang/String
    //   70: invokespecial 208	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   73: astore_2
    //   74: aload_2
    //   75: astore_1
    //   76: iconst_1
    //   77: istore_0
    //   78: aload_1
    //   79: ldc -46
    //   81: invokevirtual 214	org/json/JSONObject:opt	(Ljava/lang/String;)Ljava/lang/Object;
    //   84: ifnull +10 -> 94
    //   87: aload_1
    //   88: ldc -46
    //   90: invokevirtual 218	org/json/JSONObject:optBoolean	(Ljava/lang/String;)Z
    //   93: istore_0
    //   94: invokestatic 224	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices:getSharedServices	()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
    //   97: iload_0
    //   98: invokevirtual 228	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices:setAccessToPublicStorageServices	(Z)V
    //   101: iconst_1
    //   102: istore_0
    //   103: aload_1
    //   104: ldc -26
    //   106: invokevirtual 214	org/json/JSONObject:opt	(Ljava/lang/String;)Ljava/lang/Object;
    //   109: ifnull +10 -> 119
    //   112: aload_1
    //   113: ldc -26
    //   115: invokevirtual 218	org/json/JSONObject:optBoolean	(Ljava/lang/String;)Z
    //   118: istore_0
    //   119: invokestatic 224	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices:getSharedServices	()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
    //   122: iload_0
    //   123: invokevirtual 233	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices:setAccessToPrivateStorageServices	(Z)V
    //   126: new 35	java/util/ArrayList
    //   129: dup
    //   130: invokespecial 36	java/util/ArrayList:<init>	()V
    //   133: astore_2
    //   134: aload_1
    //   135: aload_2
    //   136: invokestatic 239	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils:getCloudsFromUserProfile	(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    //   139: pop
    //   140: aload_2
    //   141: invokevirtual 135	java/util/ArrayList:size	()I
    //   144: ifle +10 -> 154
    //   147: getstatic 25	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_sharedManager	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    //   150: aload_2
    //   151: invokevirtual 243	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:updateClouds	(Ljava/util/ArrayList;)V
    //   154: ldc 2
    //   156: monitorexit
    //   157: getstatic 25	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_sharedManager	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    //   160: areturn
    //   161: astore_2
    //   162: getstatic 103	com/adobe/creativesdk/foundation/internal/utils/logging/Level:DEBUG	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   165: ldc 2
    //   167: invokevirtual 248	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   170: aconst_null
    //   171: aload_2
    //   172: invokestatic 251	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   175: goto -99 -> 76
    //   178: astore_1
    //   179: ldc 2
    //   181: monitorexit
    //   182: aload_1
    //   183: athrow
    //   184: astore_1
    //   185: getstatic 103	com/adobe/creativesdk/foundation/internal/utils/logging/Level:DEBUG	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   188: ldc 2
    //   190: invokevirtual 248	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   193: aconst_null
    //   194: aload_1
    //   195: invokestatic 254	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    //   198: goto -44 -> 154
    // Local variable table:
    //   start	length	slot	name	signature
    //   44	79	0	bool	boolean
    //   50	85	1	localObject1	Object
    //   178	5	1	localObject2	Object
    //   184	11	1	localAdobeCSDKException	AdobeCSDKException
    //   25	126	2	localObject3	Object
    //   161	11	2	localJSONException	org.json.JSONException
    //   32	30	3	localEnumSet	java.util.EnumSet
    // Exception table:
    //   from	to	target	type
    //   51	74	161	org/json/JSONException
    //   3	45	178	finally
    //   51	74	178	finally
    //   78	94	178	finally
    //   94	101	178	finally
    //   103	119	178	finally
    //   119	134	178	finally
    //   134	154	178	finally
    //   154	157	178	finally
    //   162	175	178	finally
    //   179	182	178	finally
    //   185	198	178	finally
    //   134	154	184	com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException
  }
  
  private static String toString(AdobeCloud paramAdobeCloud)
    throws IOException
  {
    AdobeLogger.log(Level.DEBUG, "AdobeCloudManager", "Adobe Cloud being saved to cache =" + paramAdobeCloud.toString());
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(localByteArrayOutputStream);
    localObjectOutputStream.writeObject(paramAdobeCloud);
    localObjectOutputStream.close();
    return new String(Base64.encode(localByteArrayOutputStream.toByteArray(), 0));
  }
  
  protected void addCloud(AdobeCloud paramAdobeCloud)
  {
    if (!_clouds.contains(paramAdobeCloud)) {
      updateCloud(paramAdobeCloud);
    }
  }
  
  protected ArrayList<AdobeCloud> getCloudsFromCache()
  {
    Object localObject2 = null;
    JSONObject localJSONObject = AdobeEntitlementSession.getSharedSession().getUserProfileFromCache();
    Object localObject3 = Level.DEBUG;
    StringBuilder localStringBuilder = new StringBuilder().append("The cached userprofile information = ");
    Object localObject1;
    if (localJSONObject != null) {
      localObject1 = localJSONObject.toString();
    }
    for (;;)
    {
      AdobeLogger.log((Level)localObject3, "AdobeCloudManager", (String)localObject1);
      localObject1 = localObject2;
      if (localJSONObject != null) {
        localObject3 = new ArrayList(_clouds);
      }
      try
      {
        AdobeCloudUtils.getCloudsFromUserProfile(localJSONObject, (ArrayList)localObject3);
        localObject1 = localObject2;
        if (((ArrayList)localObject3).size() > 0) {
          localObject1 = localObject3;
        }
        localObject2 = localObject1;
        if (localObject1 != null)
        {
          localObject3 = ((ArrayList)localObject1).iterator();
          do
          {
            localObject2 = localObject1;
            if (!((Iterator)localObject3).hasNext()) {
              break;
            }
          } while (AdobeCloudUtils.isCloudValid((AdobeCloud)((Iterator)localObject3).next()));
          AdobeLogger.log(Level.DEBUG, "AdobeCloudManager", "Should not hit this condition");
          localObject2 = null;
        }
        return localObject2;
        localObject1 = "";
      }
      catch (AdobeCSDKException localAdobeCSDKException)
      {
        for (;;)
        {
          AdobeLogger.log(Level.DEBUG, AdobeCloudManager.class.getSimpleName(), null, localAdobeCSDKException);
        }
      }
    }
  }
  
  public AdobeCloud getDefaultCloud()
  {
    Object localObject2;
    Object localObject1;
    if (_defaultCloud == null)
    {
      if (!AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().isAdobeApplication()) {
        break label170;
      }
      localObject2 = AdobeAuthKeychain.getSharedKeychain().findKey("defaultCloud");
      if (localObject2 != null) {
        localObject1 = null;
      }
    }
    else
    {
      try
      {
        localObject2 = fromString((String)localObject2);
        localObject1 = localObject2;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          AdobeLogger.log(Level.DEBUG, AdobeCloudManager.class.getSimpleName(), null, localIOException);
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        for (;;)
        {
          AdobeLogger.log(Level.DEBUG, AdobeCloudManager.class.getSimpleName(), null, localClassNotFoundException);
          continue;
          AdobeLogger.log(Level.DEBUG, "AdobeCloudManager", "Should not hit this condition");
          _defaultCloud = null;
        }
      }
      if ((localObject1 != null) && (AdobeCloudUtils.isCloudValid((AdobeCloud)localObject1)))
      {
        addCloud((AdobeCloud)localObject1);
        _defaultCloud = ((AdobeCloud)localObject1);
      }
    }
    for (;;)
    {
      if (_defaultCloud != null) {
        AdobeLogger.log(Level.DEBUG, "AdobeCloudManager", "Getting default cloud =" + _defaultCloud.toString());
      }
      return _defaultCloud;
      _defaultCloud = getBestGuessForDefaultCloud();
      continue;
      label170:
      localObject1 = new AdobeCloud();
      ((AdobeCloud)localObject1).setGUID("00000000-0000-0000-0000-000000000000");
      ((AdobeCloud)localObject1).setName("Adobe Creative Cloud");
      ((AdobeCloud)localObject1).setAvailable(true);
      ((AdobeCloud)localObject1).setPrivateCloud(false);
      addCloud((AdobeCloud)localObject1);
      _defaultCloud = ((AdobeCloud)localObject1);
    }
  }
  
  public AdobeCloud getMatchingCloud(AdobeCloud paramAdobeCloud)
  {
    if (paramAdobeCloud == null) {
      return null;
    }
    if ((_clouds == null) || (_clouds.size() == 0)) {
      return null;
    }
    Iterator localIterator = _clouds.iterator();
    while (localIterator.hasNext())
    {
      AdobeCloud localAdobeCloud = (AdobeCloud)localIterator.next();
      if (localAdobeCloud.equals(paramAdobeCloud)) {
        return localAdobeCloud;
      }
    }
    return null;
  }
  
  public void refreshClouds(final IAdobeGenericCompletionCallback<ArrayList<AdobeCloud>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback, Handler paramHandler)
  {
    AdobeAuthIdentityManagementService localAdobeAuthIdentityManagementService = AdobeAuthIdentityManagementService.getSharedInstance();
    _ignoreNotification = true;
    AdobeEntitlementSession.getSharedSession().getUserProfileForToken(localAdobeAuthIdentityManagementService.getAccessToken(), new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(JSONObject paramAnonymousJSONObject)
      {
        int j = 1;
        boolean bool = true;
        if (paramAnonymousJSONObject.opt("public_cloud") != null) {
          bool = paramAnonymousJSONObject.optBoolean("public_cloud");
        }
        if (bool == AdobeEntitlementServices.getSharedServices().hasAccessToPublicStorageServices())
        {
          i = 1;
          AdobeEntitlementServices.getSharedServices().setAccessToPublicStorageServices(bool);
          bool = true;
          if (paramAnonymousJSONObject.opt("private_cloud") != null) {
            bool = paramAnonymousJSONObject.optBoolean("private_cloud");
          }
          if (bool != AdobeEntitlementServices.getSharedServices().hasAccessToPrivateStorageServices()) {
            break label156;
          }
        }
        label156:
        for (int i = j;; i = 0)
        {
          AdobeEntitlementServices.getSharedServices().setAccessToPrivateStorageServices(bool);
          ArrayList localArrayList = new ArrayList();
          try
          {
            AdobeCloudUtils.getCloudsFromUserProfile(paramAnonymousJSONObject, localArrayList);
            bool = AdobeCloudUtils.areValuesEqual(localArrayList, _sharedManager_clouds);
            if ((localArrayList.size() > 0) && (!bool)) {
              jdField_this.updateClouds(localArrayList);
            }
          }
          catch (AdobeCSDKException paramAnonymousJSONObject)
          {
            for (;;)
            {
              AdobeLogger.log(Level.DEBUG, AdobeCloudManager.class.getSimpleName(), null, paramAnonymousJSONObject);
            }
          }
          if (paramIAdobeGenericCompletionCallback != null) {
            paramIAdobeGenericCompletionCallback.onCompletion(jdField_this_clouds);
          }
          return;
          i = 0;
          break;
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        if (paramIAdobeGenericErrorCallback != null)
        {
          paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeCSDKException);
          return;
        }
        AdobeLogger.log(Level.ERROR, AdobeCloudManager.class.getSimpleName(), "Failed to refresh the cloud manager", paramAnonymousAdobeCSDKException);
      }
    }, paramHandler);
  }
  
  protected void refreshCloudsFromCache()
  {
    ArrayList localArrayList = getCloudsFromCache();
    if (localArrayList != null) {
      updateClouds(localArrayList);
    }
  }
  
  /* Error */
  public void setDefaultCloud(AdobeCloud paramAdobeCloud)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 33	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_syncObject	Ljava/lang/Object;
    //   4: astore 6
    //   6: aload 6
    //   8: monitorenter
    //   9: aload_1
    //   10: ifnull +34 -> 44
    //   13: getstatic 103	com/adobe/creativesdk/foundation/internal/utils/logging/Level:DEBUG	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   16: ldc 105
    //   18: new 107	java/lang/StringBuilder
    //   21: dup
    //   22: invokespecial 108	java/lang/StringBuilder:<init>	()V
    //   25: ldc_w 336
    //   28: invokevirtual 114	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   31: aload_1
    //   32: invokevirtual 118	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud:toString	()Ljava/lang/String;
    //   35: invokevirtual 114	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokevirtual 119	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokestatic 125	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   44: aload_0
    //   45: getfield 40	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_defaultCloud	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    //   48: ifnull +74 -> 122
    //   51: aload_1
    //   52: ifnull +70 -> 122
    //   55: iconst_0
    //   56: istore_3
    //   57: aload_0
    //   58: getfield 38	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_clouds	Ljava/util/ArrayList;
    //   61: invokevirtual 146	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   64: astore 5
    //   66: iload_3
    //   67: istore_2
    //   68: aload 5
    //   70: invokeinterface 152 1 0
    //   75: ifeq +25 -> 100
    //   78: aload 5
    //   80: invokeinterface 155 1 0
    //   85: checkcast 97	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud
    //   88: aload_0
    //   89: getfield 40	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_defaultCloud	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    //   92: invokevirtual 387	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud:isStrictlyEqual	(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    //   95: ifeq -29 -> 66
    //   98: iconst_1
    //   99: istore_2
    //   100: aload_1
    //   101: aload_0
    //   102: getfield 40	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_defaultCloud	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    //   105: invokevirtual 387	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud:isStrictlyEqual	(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    //   108: ifne +14 -> 122
    //   111: iload_2
    //   112: ifne +10 -> 122
    //   115: aload_0
    //   116: getfield 40	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_defaultCloud	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    //   119: invokevirtual 390	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud:removeAllServices	()V
    //   122: aload_0
    //   123: aload_1
    //   124: putfield 40	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:_defaultCloud	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    //   127: invokestatic 321	com/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted:getSharedAuthManagerRestricted	()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    //   130: invokevirtual 324	com/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted:isAdobeApplication	()Z
    //   133: istore 4
    //   135: iload 4
    //   137: ifeq +52 -> 189
    //   140: aload_1
    //   141: ifnull +52 -> 193
    //   144: aconst_null
    //   145: astore 5
    //   147: aload_1
    //   148: invokestatic 392	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager:toString	(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Ljava/lang/String;
    //   151: astore_1
    //   152: invokestatic 170	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:getSharedKeychain	()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    //   155: ldc_w 326
    //   158: aload_1
    //   159: invokevirtual 396	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:updateOrAddKey	(Ljava/lang/String;Ljava/lang/Object;)V
    //   162: new 398	java/util/HashMap
    //   165: dup
    //   166: invokespecial 399	java/util/HashMap:<init>	()V
    //   169: astore_1
    //   170: new 401	com/adobe/creativesdk/foundation/internal/notification/AdobeNotification
    //   173: dup
    //   174: getstatic 404	com/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID:AdobeCloudManagerDefaultCloudUpdatedNotification	Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;
    //   177: aload_1
    //   178: invokespecial 407	com/adobe/creativesdk/foundation/internal/notification/AdobeNotification:<init>	(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V
    //   181: astore_1
    //   182: invokestatic 46	com/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter:getDefaultNotificationCenter	()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
    //   185: aload_1
    //   186: invokevirtual 411	com/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter:postNotification	(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V
    //   189: aload 6
    //   191: monitorexit
    //   192: return
    //   193: invokestatic 170	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:getSharedKeychain	()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    //   196: ldc_w 326
    //   199: invokevirtual 414	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain:deleteKey	(Ljava/lang/String;)V
    //   202: goto -40 -> 162
    //   205: astore_1
    //   206: aload 6
    //   208: monitorexit
    //   209: aload_1
    //   210: athrow
    //   211: astore_1
    //   212: aload 5
    //   214: astore_1
    //   215: goto -63 -> 152
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	218	0	this	AdobeCloudManager
    //   0	218	1	paramAdobeCloud	AdobeCloud
    //   67	45	2	i	int
    //   56	11	3	j	int
    //   133	3	4	bool	boolean
    //   64	149	5	localIterator	Iterator
    //   4	203	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   13	44	205	finally
    //   44	51	205	finally
    //   57	66	205	finally
    //   68	98	205	finally
    //   100	111	205	finally
    //   115	122	205	finally
    //   122	135	205	finally
    //   147	152	205	finally
    //   152	162	205	finally
    //   162	189	205	finally
    //   189	192	205	finally
    //   193	202	205	finally
    //   206	209	205	finally
    //   147	152	211	java/io/IOException
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    if (_clouds != null) {
      localHashMap.put("clouds", _clouds);
    }
    if (_defaultCloud != null) {
      localHashMap.put("defaultCloud", _defaultCloud);
    }
    return localHashMap.toString();
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    paramObservable = (AdobeNotification)paramObject;
    if ((paramObservable.getId() == AdobeInternalNotificationID.AdobeAuthLogoutNotification) && (paramObservable.getInfo() == null))
    {
      paramObservable = _clouds.iterator();
      while (paramObservable.hasNext()) {
        ((AdobeCloud)paramObservable.next()).removeAllServices();
      }
      _clouds.clear();
      setDefaultCloud(null);
    }
    while (paramObservable.getId() != AdobeInternalNotificationID.AdobeEntilementUserProfileDataFetchNotification) {
      return;
    }
    if (_ignoreNotification)
    {
      _ignoreNotification = false;
      return;
    }
    paramObservable = (JSONObject)paramObservable.getInfo().get("AdobeEntitlementSessionUserProfileData");
    boolean bool = true;
    if (paramObservable.opt("public_cloud") != null) {
      bool = paramObservable.optBoolean("public_cloud");
    }
    if (bool == AdobeEntitlementServices.getSharedServices().hasAccessToPublicStorageServices())
    {
      i = 1;
      label137:
      AdobeEntitlementServices.getSharedServices().setAccessToPublicStorageServices(bool);
      bool = true;
      if (paramObservable.opt("private_cloud") != null) {
        bool = paramObservable.optBoolean("private_cloud");
      }
      if (bool != AdobeEntitlementServices.getSharedServices().hasAccessToPrivateStorageServices()) {
        break label245;
      }
    }
    label245:
    for (int i = 1;; i = 0)
    {
      AdobeEntitlementServices.getSharedServices().setAccessToPrivateStorageServices(bool);
      paramObject = new ArrayList();
      try
      {
        AdobeCloudUtils.getCloudsFromUserProfile(paramObservable, paramObject);
        bool = AdobeCloudUtils.areValuesEqual(paramObject, _sharedManager_clouds);
        if ((paramObject.size() <= 0) || (bool)) {
          break;
        }
        updateClouds(paramObject);
        return;
      }
      catch (AdobeCSDKException paramObservable)
      {
        AdobeLogger.log(Level.DEBUG, AdobeCloudManager.class.getSimpleName(), null, paramObservable);
        return;
      }
      i = 0;
      break label137;
    }
  }
  
  protected void updateCloud(AdobeCloud paramAdobeCloud)
  {
    synchronized (_syncObject)
    {
      if (!_clouds.contains(paramAdobeCloud)) {
        _clouds.add(paramAdobeCloud);
      }
      int i;
      do
      {
        return;
        i = _clouds.indexOf(paramAdobeCloud);
      } while (((AdobeCloud)_clouds.get(i)).getEtag() == paramAdobeCloud.getEtag());
      _clouds.set(i, paramAdobeCloud);
    }
  }
  
  protected void updateClouds(ArrayList<AdobeCloud> paramArrayList)
  {
    int k = 1;
    int j = k;
    Object localObject;
    int i;
    AdobeCloud localAdobeCloud;
    if (paramArrayList.size() == _clouds.size())
    {
      j = 1;
      localObject = paramArrayList.iterator();
      i = j;
      if (((Iterator)localObject).hasNext())
      {
        localAdobeCloud = (AdobeCloud)((Iterator)localObject).next();
        if (_clouds.contains(localAdobeCloud)) {
          break label160;
        }
        i = 0;
      }
      label66:
      j = k;
      if (i != 0) {
        j = 0;
      }
    }
    if (j != 0)
    {
      if (paramArrayList.size() != 1) {
        break label194;
      }
      updateCloud((AdobeCloud)paramArrayList.get(0));
      if (_defaultCloud == null) {
        setDefaultCloud((AdobeCloud)paramArrayList.get(0));
      }
    }
    for (;;)
    {
      paramArrayList = new HashMap();
      paramArrayList.put("Clouds", _clouds);
      paramArrayList = new AdobeNotification(AdobeInternalNotificationID.AdobeCloudManagerCloudsUpdatedNotification, paramArrayList);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(paramArrayList);
      return;
      label160:
      i = _clouds.indexOf(localAdobeCloud);
      if (((AdobeCloud)_clouds.get(i)).isStrictlyEqual(localAdobeCloud)) {
        break;
      }
      i = 0;
      break label66;
      label194:
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        localObject = (AdobeCloud)paramArrayList.next();
        updateCloud((AdobeCloud)localObject);
        if ((_defaultCloud == null) && (!((AdobeCloud)localObject).isPrivateCloud())) {
          setDefaultCloud((AdobeCloud)localObject);
        }
      }
    }
  }
}
