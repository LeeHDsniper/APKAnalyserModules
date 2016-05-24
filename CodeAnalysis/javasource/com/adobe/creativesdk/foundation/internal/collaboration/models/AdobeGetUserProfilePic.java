package com.adobe.creativesdk.foundation.internal.collaboration.models;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.LruCache;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.internal.net.IAdobeNetworkCompletionHandler;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeGetUserProfilePic
{
  private static int MAX_ITEMS = 10;
  private static LruCache<String, Bitmap> _mPictureCache;
  private static String api_key = "spFzOBHcTLsIoXWyKjayKRW5gBZ55wWh";
  private static String client_id = "TU7NfEJ94OGF29SkePTunHHM8QOImepU";
  private static HashMap<String, IAdobeProfilePicCallback> pictureRequestQueue;
  private static AdobeNetworkHttpService service = null;
  
  public static void getAvatarFromURL(String paramString, final IAdobeProfilePicCallback paramIAdobeProfilePicCallback)
  {
    if (pictureRequestQueue == null) {
      pictureRequestQueue = new HashMap();
    }
    if ((paramString == null) || (paramString.length() == 0))
    {
      paramIAdobeProfilePicCallback.onError();
      return;
    }
    if (_mPictureCache == null) {
      _mPictureCache = new LruCache(MAX_ITEMS);
    }
    while (!pictureRequestQueue.containsKey(paramString))
    {
      getResponse(paramString, false, new IAdobeUserProfilePictureResponse()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          paramAnonymousAdobeNetworkHttpResponse = paramAnonymousAdobeNetworkHttpResponse.getDataBytes();
          paramAnonymousAdobeNetworkHttpResponse = BitmapFactory.decodeByteArray(paramAnonymousAdobeNetworkHttpResponse, 0, paramAnonymousAdobeNetworkHttpResponse.length);
          if ((val$imageURL != null) && (AdobeGetUserProfilePic._mPictureCache != null)) {
            AdobeGetUserProfilePic._mPictureCache.put(val$imageURL, paramAnonymousAdobeNetworkHttpResponse);
          }
          paramIAdobeProfilePicCallback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
          AdobeGetUserProfilePic.handleOtherPictureRequests(val$imageURL, paramAnonymousAdobeNetworkHttpResponse, true);
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramIAdobeProfilePicCallback.onError();
          AdobeGetUserProfilePic.handleOtherPictureRequests(val$imageURL, null, false);
        }
      });
      return;
      if (paramString != null) {}
      for (Bitmap localBitmap = (Bitmap)_mPictureCache.get(paramString); localBitmap != null; localBitmap = null)
      {
        paramIAdobeProfilePicCallback.onComplete(localBitmap);
        return;
      }
    }
    pictureRequestQueue.put(paramString, paramIAdobeProfilePicCallback);
  }
  
  public static void getAvatarFromUserID(String paramString, final IAdobeProfilePicCallback paramIAdobeProfilePicCallback)
  {
    if (pictureRequestQueue == null) {
      pictureRequestQueue = new HashMap();
    }
    if ((paramString == null) || (paramString.length() == 0))
    {
      paramIAdobeProfilePicCallback.onError();
      return;
    }
    if (_mPictureCache == null) {
      _mPictureCache = new LruCache(MAX_ITEMS);
    }
    while (!pictureRequestQueue.containsKey(paramString))
    {
      Object localObject = "https://www.behance.net/v2/users/" + paramString;
      if (AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment() == AdobeAuthIMSEnvironment.AdobeAuthIMSEnvironmentStageUS) {
        localObject = "https://net.s2stagehance.com/v2/users/" + paramString;
      }
      getResponse((String)localObject, true, new IAdobeUserProfilePictureResponse()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          try
          {
            AdobeGetUserProfilePic.getRendition(new JSONObject(new String(paramAnonymousAdobeNetworkHttpResponse.getDataBytes(), "UTF-8")), val$userId, paramIAdobeProfilePicCallback);
            return;
          }
          catch (JSONException paramAnonymousAdobeNetworkHttpResponse)
          {
            onError(null);
            return;
          }
          catch (UnsupportedEncodingException paramAnonymousAdobeNetworkHttpResponse)
          {
            onError(null);
          }
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          paramIAdobeProfilePicCallback.onError();
        }
      });
      return;
      localObject = (Bitmap)_mPictureCache.get(paramString);
      if (localObject != null)
      {
        paramIAdobeProfilePicCallback.onComplete((Bitmap)localObject);
        return;
      }
    }
    pictureRequestQueue.put(paramString, paramIAdobeProfilePicCallback);
  }
  
  /* Error */
  private static void getRendition(JSONObject paramJSONObject, String paramString, final IAdobeProfilePicCallback paramIAdobeProfilePicCallback)
  {
    // Byte code:
    //   0: aload_0
    //   1: ldc -113
    //   3: invokevirtual 149	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   6: ldc -105
    //   8: invokevirtual 154	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   11: checkcast 145	org/json/JSONObject
    //   14: astore 6
    //   16: aconst_null
    //   17: astore_0
    //   18: bipush 50
    //   20: istore_3
    //   21: aload 6
    //   23: invokevirtual 158	org/json/JSONObject:keys	()Ljava/util/Iterator;
    //   26: astore 7
    //   28: aload_0
    //   29: astore 5
    //   31: aload 7
    //   33: invokeinterface 164 1 0
    //   38: ifeq +55 -> 93
    //   41: aload 7
    //   43: invokeinterface 168 1 0
    //   48: checkcast 68	java/lang/String
    //   51: astore 5
    //   53: aload 5
    //   55: invokestatic 174	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   58: istore 4
    //   60: iload 4
    //   62: iload_3
    //   63: if_icmplt -35 -> 28
    //   66: aload 6
    //   68: aload 5
    //   70: invokevirtual 178	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   73: astore_0
    //   74: iload 4
    //   76: istore_3
    //   77: goto -49 -> 28
    //   80: astore_0
    //   81: aload 6
    //   83: ldc -76
    //   85: invokevirtual 154	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   88: checkcast 68	java/lang/String
    //   91: astore 5
    //   93: aload 5
    //   95: iconst_0
    //   96: new 10	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$3
    //   99: dup
    //   100: aload_1
    //   101: aload_2
    //   102: invokespecial 181	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$3:<init>	(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    //   105: invokestatic 92	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:getResponse	(Ljava/lang/String;ZLcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V
    //   108: return
    //   109: astore_0
    //   110: aload_0
    //   111: invokevirtual 182	org/json/JSONException:toString	()Ljava/lang/String;
    //   114: pop
    //   115: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	116	0	paramJSONObject	JSONObject
    //   0	116	1	paramString	String
    //   0	116	2	paramIAdobeProfilePicCallback	IAdobeProfilePicCallback
    //   20	57	3	i	int
    //   58	17	4	j	int
    //   29	65	5	localObject	Object
    //   14	68	6	localJSONObject	JSONObject
    //   26	16	7	localIterator	java.util.Iterator
    // Exception table:
    //   from	to	target	type
    //   21	28	80	org/json/JSONException
    //   31	60	80	org/json/JSONException
    //   66	74	80	org/json/JSONException
    //   0	16	109	org/json/JSONException
    //   81	93	109	org/json/JSONException
    //   93	108	109	org/json/JSONException
  }
  
  /* Error */
  private static void getResponse(String paramString, boolean paramBoolean, IAdobeUserProfilePictureResponse paramIAdobeUserProfilePictureResponse)
  {
    // Byte code:
    //   0: new 188	java/net/URL
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 191	java/net/URL:<init>	(Ljava/lang/String;)V
    //   8: astore_0
    //   9: getstatic 40	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:service	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    //   12: ifnonnull +16 -> 28
    //   15: new 193	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService
    //   18: dup
    //   19: aconst_null
    //   20: aconst_null
    //   21: aconst_null
    //   22: invokespecial 196	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    //   25: putstatic 40	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:service	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    //   28: new 198	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest
    //   31: dup
    //   32: aload_0
    //   33: getstatic 204	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod:AdobeNetworkHttpRequestMethodGET	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    //   36: aconst_null
    //   37: invokespecial 207	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:<init>	(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;)V
    //   40: astore_3
    //   41: iload_1
    //   42: ifeq +40 -> 82
    //   45: new 63	java/util/HashMap
    //   48: dup
    //   49: invokespecial 66	java/util/HashMap:<init>	()V
    //   52: astore_0
    //   53: invokestatic 126	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService:getSharedInstance	()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    //   56: invokevirtual 130	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService:getEnvironment	()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    //   59: getstatic 136	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment:AdobeAuthIMSEnvironmentStageUS	Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    //   62: if_acmpne +53 -> 115
    //   65: aload_0
    //   66: ldc -48
    //   68: getstatic 38	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:client_id	Ljava/lang/String;
    //   71: invokeinterface 211 3 0
    //   76: pop
    //   77: aload_3
    //   78: aload_0
    //   79: invokevirtual 215	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:setQueryParams	(Ljava/util/Map;)V
    //   82: new 217	android/os/Handler
    //   85: dup
    //   86: invokespecial 218	android/os/Handler:<init>	()V
    //   89: astore_0
    //   90: new 12	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$4
    //   93: dup
    //   94: aload_2
    //   95: invokespecial 221	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$4:<init>	(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V
    //   98: astore 4
    //   100: getstatic 40	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:service	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    //   103: aload_3
    //   104: getstatic 227	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority:NORMAL	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    //   107: aload 4
    //   109: aload_0
    //   110: invokevirtual 231	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:getResponseForDataRequest	(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    //   113: pop
    //   114: return
    //   115: aload_0
    //   116: ldc -24
    //   118: getstatic 34	com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic:api_key	Ljava/lang/String;
    //   121: invokeinterface 211 3 0
    //   126: pop
    //   127: goto -50 -> 77
    //   130: astore_0
    //   131: aload_2
    //   132: aconst_null
    //   133: invokeinterface 235 2 0
    //   138: return
    //   139: astore_0
    //   140: aconst_null
    //   141: astore_0
    //   142: goto -52 -> 90
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	145	0	paramString	String
    //   0	145	1	paramBoolean	boolean
    //   0	145	2	paramIAdobeUserProfilePictureResponse	IAdobeUserProfilePictureResponse
    //   40	64	3	localAdobeNetworkHttpRequest	com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest
    //   98	10	4	local4	4
    // Exception table:
    //   from	to	target	type
    //   0	28	130	java/net/MalformedURLException
    //   28	41	130	java/net/MalformedURLException
    //   45	77	130	java/net/MalformedURLException
    //   77	82	130	java/net/MalformedURLException
    //   82	90	130	java/net/MalformedURLException
    //   90	114	130	java/net/MalformedURLException
    //   115	127	130	java/net/MalformedURLException
    //   82	90	139	java/lang/Exception
  }
  
  private static void handleOtherPictureRequests(String paramString, Bitmap paramBitmap, boolean paramBoolean)
  {
    if (pictureRequestQueue.containsKey(paramString))
    {
      if (!paramBoolean) {
        break label39;
      }
      ((IAdobeProfilePicCallback)pictureRequestQueue.get(paramString)).onComplete(paramBitmap);
    }
    for (;;)
    {
      pictureRequestQueue.remove(paramString);
      return;
      label39:
      ((IAdobeProfilePicCallback)pictureRequestQueue.get(paramString)).onError();
    }
  }
  
  static abstract interface IAdobeUserProfilePictureResponse
  {
    public abstract void onComplete(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse);
    
    public abstract void onError(AdobeNetworkException paramAdobeNetworkException);
  }
}
