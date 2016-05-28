package com.adobe.creativesdk.foundation.internal.net;

import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException.AdobeNetworkErrorCode;
import java.net.ConnectException;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class AdobeNetworkHttpService
{
  private static int AdobeNetworkHTTPServiceMaxAuthTokenHistory = 10;
  private static int AdobeNetworkHTTPServiceMaxConcurrentRequests = 5;
  private String _accessToken = null;
  private Map<String, String> _additionalHTTPHeaders = null;
  private String _applicationName = null;
  private List<Date> _authTokenHistory = null;
  private URL _baseURL = null;
  private int _numConcurrentRequests = 5;
  private List<String> _recentAuthTokens = null;
  private Object _recentAuthTokensMutex = new Object();
  private AtomicInteger _recentErrorCount = null;
  private int _recentErrorThresholdToDisconnect = 5;
  private AdobeNetworkHttpRequestExecutor _requestExecutor = null;
  private IAdobeNetworkHttpServiceDelegate _serviceDelegate = null;
  
  public AdobeNetworkHttpService(String paramString1, String paramString2, Map<String, String> paramMap)
  {
    try
    {
      _baseURL = new URL(paramString1);
      _applicationName = paramString2;
      _additionalHTTPHeaders = paramMap;
      _numConcurrentRequests = 5;
      _recentErrorThresholdToDisconnect = 5;
      _recentErrorCount = new AtomicInteger(0);
      _authTokenHistory = new ArrayList();
      _recentAuthTokens = new ArrayList();
      _requestExecutor = new AdobeNetworkHttpRequestExecutor(_numConcurrentRequests, _numConcurrentRequests, 100L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
      return;
    }
    catch (MalformedURLException paramString1)
    {
      for (;;)
      {
        AdobeLogger.log(Level.INFO, AdobeNetworkHttpService.class.getName(), "Malformed url", paramString1);
      }
    }
  }
  
  private void ConvertHeaderKeyToLowerCase(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    if (paramAdobeNetworkHttpResponse == null) {}
    do
    {
      return;
      localObject1 = paramAdobeNetworkHttpResponse.getHeaders();
    } while ((localObject1 == null) || (((Map)localObject1).size() == 0));
    HashMap localHashMap = new HashMap();
    Object localObject1 = ((Map)localObject1).entrySet().iterator();
    while (((Iterator)localObject1).hasNext())
    {
      Object localObject2 = (Map.Entry)((Iterator)localObject1).next();
      String str = (String)((Map.Entry)localObject2).getKey();
      localObject2 = (List)((Map.Entry)localObject2).getValue();
      if (str != null) {
        localHashMap.put(str.toLowerCase(), localObject2);
      }
    }
    paramAdobeNetworkHttpResponse.setHeaders(localHashMap);
  }
  
  private void _addAdditionalHttpHeaders(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest)
  {
    if (_additionalHTTPHeaders == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = _additionalHTTPHeaders.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        paramAdobeNetworkHttpRequest.getRequestProperties().put(str, _additionalHTTPHeaders.get(str));
      }
    }
  }
  
  private void _analyseResponse(final AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse, final AdobeNetworkHttpTaskHandle paramAdobeNetworkHttpTaskHandle, Runnable paramRunnable, final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, Handler paramHandler)
  {
    ConvertHeaderKeyToLowerCase(paramAdobeNetworkHttpResponse);
    boolean bool1 = false;
    boolean bool2 = false;
    if (paramAdobeNetworkHttpResponse != null) {
      if (paramAdobeNetworkHttpResponse.getStatusCode() != 401) {}
    }
    for (;;)
    {
      synchronized (_recentAuthTokensMutex)
      {
        String str2 = paramAdobeNetworkHttpTaskHandle.getAccessToken();
        String str1 = str2;
        if (str2 != null) {
          break label339;
        }
        str1 = "no-token";
        break label339;
        if (i >= _recentAuthTokens.size()) {
          break label357;
        }
        if (!((String)_recentAuthTokens.get(i)).equals(str1)) {
          break label348;
        }
        j = i;
        break label348;
        bool1 = bool2;
        if (i == 0)
        {
          bool1 = bool2;
          if (_serviceDelegate != null)
          {
            _requestExecutor.pause();
            bool1 = _serviceDelegate.HTTPServiceAuthenticationDidFail(this);
          }
        }
        if (i == 0)
        {
          if (_recentAuthTokens.size() >= AdobeNetworkHTTPServiceMaxConcurrentRequests) {
            _recentAuthTokens.remove(_recentAuthTokens.size() - 1);
          }
          _recentAuthTokens.add(str1);
        }
        if ((paramAdobeNetworkHttpResponse.getStatusCode() == 401) && (!_hasUserCancelled(paramAdobeNetworkHttpTaskHandle)))
        {
          _recentErrorCount.incrementAndGet();
          if ((_serviceDelegate != null) && (!isConnected())) {
            _serviceDelegate.HTTPServiceDidDisconnect(this);
          }
        }
        if ((paramAdobeNetworkHttpResponse.getStatusCode() < 400) && (!paramAdobeNetworkHttpResponse.hasFileError()) && (_serviceDelegate != null)) {
          _serviceDelegate.HTTPServiceIsActive(this);
        }
        if (bool1)
        {
          paramRunnable.run();
          return;
          i = 0;
        }
      }
      _sendResponse(new Runnable()
      {
        public void run()
        {
          int i;
          HashMap localHashMap;
          if (paramIAdobeNetworkCompletionHandler != null)
          {
            i = paramAdobeNetworkHttpResponse.getStatusCode();
            if (i >= 400) {
              break label100;
            }
            if (!paramAdobeNetworkHttpResponse.hasFileError()) {
              break label84;
            }
            localObject = AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorFileDoesNotExist;
            localHashMap = new HashMap();
            localHashMap.put(AdobeNetworkException.getKeyForResponse(), paramAdobeNetworkHttpResponse);
            localObject = new AdobeNetworkException((AdobeNetworkException.AdobeNetworkErrorCode)localObject, localHashMap);
            paramIAdobeNetworkCompletionHandler.onError((AdobeNetworkException)localObject);
          }
          for (;;)
          {
            paramAdobeNetworkHttpTaskHandle.markFinished();
            return;
            label84:
            paramIAdobeNetworkCompletionHandler.onSuccess(paramAdobeNetworkHttpResponse);
          }
          label100:
          Object localObject = AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorBadRequest;
          if (i == 401) {
            localObject = AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorAuthenticationFailed;
          }
          for (;;)
          {
            localHashMap = new HashMap();
            localHashMap.put(AdobeNetworkException.getKeyForResponse(), paramAdobeNetworkHttpResponse);
            localObject = new AdobeNetworkException((AdobeNetworkException.AdobeNetworkErrorCode)localObject, localHashMap);
            paramIAdobeNetworkCompletionHandler.onError((AdobeNetworkException)localObject);
            break;
            if (i == 600) {
              localObject = AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorOffline;
            } else if (((paramAdobeNetworkHttpResponse.getNetworkException() != null) && ((paramAdobeNetworkHttpResponse.getNetworkException() instanceof SocketTimeoutException))) || ((paramAdobeNetworkHttpResponse.getNetworkException() instanceof ConnectException))) {
              localObject = AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorTimeout;
            }
          }
        }
      }, paramHandler);
      return;
      _sendResponse(new Runnable()
      {
        public void run()
        {
          if (paramIAdobeNetworkCompletionHandler != null)
          {
            AdobeNetworkException localAdobeNetworkException = new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorCancelled, null);
            paramIAdobeNetworkCompletionHandler.onError(localAdobeNetworkException);
          }
          paramAdobeNetworkHttpTaskHandle.markFinished();
        }
      }, paramHandler);
      return;
      label339:
      int j = -1;
      int i = 0;
      continue;
      label348:
      i += 1;
      continue;
      label357:
      if (j != -1) {
        i = 1;
      }
    }
  }
  
  private boolean _hasUserCancelled(AdobeNetworkHttpTaskHandle paramAdobeNetworkHttpTaskHandle)
  {
    return paramAdobeNetworkHttpTaskHandle.isCancelled();
  }
  
  private void _sendDisconnectError(final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, Handler paramHandler)
  {
    paramIAdobeNetworkCompletionHandler = new Runnable()
    {
      public void run()
      {
        if (paramIAdobeNetworkCompletionHandler != null)
        {
          HashMap localHashMap = new HashMap();
          localHashMap.put("AdobeNetworkHTTPStatus", Integer.valueOf(401));
          paramIAdobeNetworkCompletionHandler.onError(new AdobeNetworkException(AdobeNetworkException.AdobeNetworkErrorCode.AdobeNetworkErrorServiceDisconnected, localHashMap));
        }
      }
    };
    if (paramHandler != null)
    {
      paramHandler.post(paramIAdobeNetworkCompletionHandler);
      return;
    }
    new Thread(paramIAdobeNetworkCompletionHandler).start();
  }
  
  private void _sendResponse(Runnable paramRunnable, Handler paramHandler)
  {
    if (paramHandler != null)
    {
      paramHandler.post(paramRunnable);
      return;
    }
    new Thread(paramRunnable).start();
  }
  
  private boolean areStringsEqual(String paramString1, String paramString2)
  {
    boolean bool2 = false;
    boolean bool1;
    if ((paramString1 == null) && (paramString2 == null)) {
      bool1 = true;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (paramString1 == null);
      bool1 = bool2;
    } while (paramString2 == null);
    return paramString1.equals(paramString2);
  }
  
  private boolean areURLsEqual(URL paramURL1, URL paramURL2)
  {
    boolean bool2 = false;
    boolean bool1;
    if ((paramURL1 == null) && (paramURL2 == null)) {
      bool1 = true;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (paramURL1 == null);
      bool1 = bool2;
    } while (paramURL2 == null);
    return paramURL1.getPath().equals(paramURL2.getPath());
  }
  
  public URL baseURL()
  {
    return _baseURL;
  }
  
  public void clearQueuedRequests()
  {
    _requestExecutor.shutdownNow();
    _requestExecutor = new AdobeNetworkHttpRequestExecutor(_numConcurrentRequests, _numConcurrentRequests, 100L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramObject != null)
    {
      bool1 = bool2;
      if ((paramObject instanceof AdobeNetworkHttpService))
      {
        paramObject = (AdobeNetworkHttpService)paramObject;
        bool1 = areURLsEqual(_baseURL, _baseURL) & areStringsEqual(_applicationName, _applicationName) & areStringsEqual(_accessToken, _accessToken);
      }
    }
    return bool1;
  }
  
  public String getAccessToken()
  {
    try
    {
      String str = _accessToken;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public URL getBaseURL()
  {
    return _baseURL;
  }
  
  public AdobeNetworkHttpTaskHandle getResponseForDataRequest(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, final AdobeNetworkRequestPriority paramAdobeNetworkRequestPriority, final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, final Handler paramHandler)
  {
    _addAdditionalHttpHeaders(paramAdobeNetworkHttpRequest);
    paramAdobeNetworkRequestPriority = new AdobeNetworkHttpTaskHandle();
    final AdobeNetworkHttpResponseHandler local1 = new AdobeNetworkHttpResponseHandler()
    {
      public void handleResponse(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        AdobeNetworkHttpService.this._analyseResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeNetworkRequestPriority, _requestRunner, paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    paramAdobeNetworkHttpRequest = new Runnable()
    {
      public void run()
      {
        if (isConnected())
        {
          Object localObject = new AdobeNetworkHttpDataDownloadTask();
          String str = getAccessToken();
          ((AdobeNetworkHttpDataDownloadTask)localObject).init(paramAdobeNetworkHttpRequest, str, local1, paramAdobeNetworkRequestPriority);
          localObject = _requestExecutor.submit((Callable)localObject);
          paramAdobeNetworkRequestPriority.setFuture((Future)localObject);
          paramAdobeNetworkRequestPriority.setAccessTokenForRequest(str);
          return;
        }
        AdobeNetworkHttpService.this._sendDisconnectError(paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    _requestRunner = paramAdobeNetworkHttpRequest;
    paramAdobeNetworkHttpRequest.run();
    return paramAdobeNetworkRequestPriority;
  }
  
  public AdobeNetworkHttpTaskHandle getResponseForDownloadRequest(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, final String paramString, final AdobeNetworkRequestPriority paramAdobeNetworkRequestPriority, final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, final Handler paramHandler)
  {
    _addAdditionalHttpHeaders(paramAdobeNetworkHttpRequest);
    paramAdobeNetworkRequestPriority = new AdobeNetworkHttpTaskHandle();
    paramAdobeNetworkRequestPriority.setNotifyHandler(paramHandler);
    final AdobeNetworkHttpResponseHandler local3 = new AdobeNetworkHttpResponseHandler()
    {
      public void handleResponse(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        AdobeNetworkHttpService.this._analyseResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeNetworkRequestPriority, _requestRunner, paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    paramAdobeNetworkHttpRequest = new Runnable()
    {
      public void run()
      {
        if (isConnected())
        {
          Object localObject = new AdobeNetworkHttpFileDownloadTask();
          String str = getAccessToken();
          ((AdobeNetworkHttpFileDownloadTask)localObject).init(paramAdobeNetworkHttpRequest, str, paramString, local3, paramAdobeNetworkRequestPriority);
          localObject = _requestExecutor.submit((Callable)localObject);
          paramAdobeNetworkRequestPriority.setFuture((Future)localObject);
          paramAdobeNetworkRequestPriority.setAccessTokenForRequest(str);
          return;
        }
        AdobeNetworkHttpService.this._sendDisconnectError(paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    _requestRunner = paramAdobeNetworkHttpRequest;
    paramAdobeNetworkHttpRequest.run();
    return paramAdobeNetworkRequestPriority;
  }
  
  public AdobeNetworkHttpTaskHandle getResponseForUploadRequest(final AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, final String paramString, final AdobeNetworkRequestPriority paramAdobeNetworkRequestPriority, final IAdobeNetworkCompletionHandler paramIAdobeNetworkCompletionHandler, final Handler paramHandler)
  {
    _addAdditionalHttpHeaders(paramAdobeNetworkHttpRequest);
    paramAdobeNetworkRequestPriority = new AdobeNetworkHttpTaskHandle();
    paramAdobeNetworkRequestPriority.setNotifyHandler(paramHandler);
    final AdobeNetworkHttpResponseHandler local5 = new AdobeNetworkHttpResponseHandler()
    {
      public void handleResponse(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
      {
        AdobeNetworkHttpService.this._analyseResponse(paramAnonymousAdobeNetworkHttpResponse, paramAdobeNetworkRequestPriority, _requestRunner, paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    paramAdobeNetworkHttpRequest = new Runnable()
    {
      public void run()
      {
        if (isConnected())
        {
          String str = getAccessToken();
          Object localObject = new AdobeNetworkHttpFileUploadTask();
          ((AdobeNetworkHttpFileUploadTask)localObject).init(paramAdobeNetworkHttpRequest, str, paramString, local5, paramAdobeNetworkRequestPriority);
          localObject = _requestExecutor.submit((Callable)localObject);
          paramAdobeNetworkRequestPriority.setAccessTokenForRequest(str);
          paramAdobeNetworkRequestPriority.setFuture((Future)localObject);
          return;
        }
        AdobeNetworkHttpService.this._sendDisconnectError(paramIAdobeNetworkCompletionHandler, paramHandler);
      }
    };
    _requestRunner = paramAdobeNetworkHttpRequest;
    paramAdobeNetworkHttpRequest.run();
    return paramAdobeNetworkRequestPriority;
  }
  
  /* Error */
  public boolean hasEncounteredTooManyAuthFailures()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: iconst_0
    //   3: istore 4
    //   5: aload_0
    //   6: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   9: invokeinterface 225 1 0
    //   14: istore_1
    //   15: getstatic 54	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:AdobeNetworkHTTPServiceMaxAuthTokenHistory	I
    //   18: istore_2
    //   19: iload_1
    //   20: iload_2
    //   21: if_icmpge +9 -> 30
    //   24: iconst_0
    //   25: istore_3
    //   26: aload_0
    //   27: monitorexit
    //   28: iload_3
    //   29: ireturn
    //   30: new 366	java/util/Date
    //   33: dup
    //   34: invokespecial 367	java/util/Date:<init>	()V
    //   37: astore 9
    //   39: iconst_0
    //   40: istore_1
    //   41: iload 4
    //   43: istore_3
    //   44: iload_1
    //   45: aload_0
    //   46: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   49: invokeinterface 225 1 0
    //   54: if_icmpge -28 -> 26
    //   57: aload 9
    //   59: invokevirtual 371	java/util/Date:getTime	()J
    //   62: lstore 5
    //   64: aload_0
    //   65: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   68: iload_1
    //   69: invokeinterface 228 2 0
    //   74: checkcast 366	java/util/Date
    //   77: invokevirtual 371	java/util/Date:getTime	()J
    //   80: lstore 7
    //   82: lload 5
    //   84: lload 7
    //   86: lsub
    //   87: ldc2_w 372
    //   90: lcmp
    //   91: ifle +8 -> 99
    //   94: iconst_1
    //   95: istore_3
    //   96: goto -70 -> 26
    //   99: iload_1
    //   100: iconst_1
    //   101: iadd
    //   102: istore_1
    //   103: goto -62 -> 41
    //   106: astore 9
    //   108: aload_0
    //   109: monitorexit
    //   110: aload 9
    //   112: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	113	0	this	AdobeNetworkHttpService
    //   14	89	1	i	int
    //   18	4	2	j	int
    //   25	71	3	bool1	boolean
    //   3	39	4	bool2	boolean
    //   62	21	5	l1	long
    //   80	5	7	l2	long
    //   37	21	9	localDate	Date
    //   106	5	9	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   5	19	106	finally
    //   30	39	106	finally
    //   44	82	106	finally
  }
  
  /* Error */
  public boolean isConnected()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 79	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_recentErrorCount	Ljava/util/concurrent/atomic/AtomicInteger;
    //   6: invokevirtual 375	java/util/concurrent/atomic/AtomicInteger:get	()I
    //   9: istore_1
    //   10: aload_0
    //   11: getfield 77	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_recentErrorThresholdToDisconnect	I
    //   14: istore_2
    //   15: iload_1
    //   16: iload_2
    //   17: if_icmpge +9 -> 26
    //   20: iconst_1
    //   21: istore_3
    //   22: aload_0
    //   23: monitorexit
    //   24: iload_3
    //   25: ireturn
    //   26: iconst_0
    //   27: istore_3
    //   28: goto -6 -> 22
    //   31: astore 4
    //   33: aload_0
    //   34: monitorexit
    //   35: aload 4
    //   37: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	38	0	this	AdobeNetworkHttpService
    //   9	9	1	i	int
    //   14	4	2	j	int
    //   21	7	3	bool	boolean
    //   31	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	15	31	finally
  }
  
  public void reconnect()
  {
    try
    {
      _recentErrorCount.set(0);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public void setAccessToken(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: putfield 71	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_accessToken	Ljava/lang/String;
    //   7: aload_1
    //   8: ifnull +59 -> 67
    //   11: aload_0
    //   12: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   15: invokeinterface 225 1 0
    //   20: getstatic 54	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:AdobeNetworkHTTPServiceMaxAuthTokenHistory	I
    //   23: if_icmplt +24 -> 47
    //   26: aload_0
    //   27: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   30: aload_0
    //   31: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   34: invokeinterface 225 1 0
    //   39: iconst_1
    //   40: isub
    //   41: invokeinterface 244 2 0
    //   46: pop
    //   47: aload_0
    //   48: getfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   51: new 366	java/util/Date
    //   54: dup
    //   55: invokespecial 367	java/util/Date:<init>	()V
    //   58: invokeinterface 247 2 0
    //   63: pop
    //   64: aload_0
    //   65: monitorexit
    //   66: return
    //   67: aload_0
    //   68: new 97	java/util/ArrayList
    //   71: dup
    //   72: invokespecial 98	java/util/ArrayList:<init>	()V
    //   75: putfield 81	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService:_authTokenHistory	Ljava/util/List;
    //   78: goto -14 -> 64
    //   81: astore_1
    //   82: aload_0
    //   83: monitorexit
    //   84: aload_1
    //   85: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	86	0	this	AdobeNetworkHttpService
    //   0	86	1	paramString	String
    // Exception table:
    //   from	to	target	type
    //   2	7	81	finally
    //   11	47	81	finally
    //   47	64	81	finally
    //   67	78	81	finally
  }
  
  public void setBaseURL(URL paramURL)
  {
    _baseURL = paramURL;
  }
  
  public void setHttpServiceDelegate(IAdobeNetworkHttpServiceDelegate paramIAdobeNetworkHttpServiceDelegate)
  {
    _serviceDelegate = paramIAdobeNetworkHttpServiceDelegate;
  }
  
  public void setSuspended(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      _requestExecutor.pause();
      return;
    }
    _requestExecutor.resume();
  }
}
