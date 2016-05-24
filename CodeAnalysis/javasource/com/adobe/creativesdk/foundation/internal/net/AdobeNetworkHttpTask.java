package com.adobe.creativesdk.foundation.internal.net;

import android.os.Build;
import android.os.Build.VERSION;
import android.util.Base64;
import com.adobe.creativesdk.foundation.AdobeCSDKFoundation;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import javax.net.ssl.SSLException;
import org.apache.commons.io.Charsets;
import org.apache.commons.io.IOUtils;

abstract class AdobeNetworkHttpTask
  implements Callable<AdobeNetworkHttpResponse>
{
  protected static double[] retryOn5xxDelays = { 0.1D, 1.0D, 2.0D };
  protected String _accessToken = null;
  protected AdobeNetworkHttpResponseHandler _completionHandler = null;
  protected int _numRetries = -1;
  protected AdobeNetworkHttpRequest _request = null;
  protected AdobeNetworkHttpTaskHandle _requestHandler = null;
  AdobeNetworkHttpResponse _response = null;
  protected HttpURLConnection _urlConnection = null;
  
  AdobeNetworkHttpTask() {}
  
  private String getRFC2047DecodedValue(String paramString)
  {
    String str2 = paramString;
    String str1 = str2;
    String str3;
    if (paramString != null)
    {
      str1 = str2;
      if (paramString.startsWith("=?"))
      {
        str1 = str2;
        if (paramString.endsWith("?="))
        {
          String[] arrayOfString = paramString.split("\\?");
          if ((arrayOfString != null) && (arrayOfString.length < 4)) {
            return paramString;
          }
          paramString = arrayOfString[3];
          str3 = arrayOfString[2];
          str1 = str2;
          if (arrayOfString[1].startsWith("utf-8"))
          {
            if (!str3.startsWith("b")) {
              break label105;
            }
            str1 = new String(Base64.decode(paramString, 0), Charsets.UTF_8);
          }
        }
      }
    }
    for (;;)
    {
      return str1;
      label105:
      str1 = str2;
      if (str3.startsWith("q")) {
        str1 = new String(paramString.getBytes(Charsets.UTF_8), Charsets.UTF_8);
      }
    }
  }
  
  private void setUserAgent(URLConnection paramURLConnection)
  {
    String str1 = Build.MANUFACTURER;
    String str2 = Build.MODEL;
    String str3 = Build.VERSION.RELEASE;
    paramURLConnection.setRequestProperty("User-Agent", AdobeCSDKFoundation.getApplicationName() + "(" + AdobeCSDKFoundation.getApplicationVersion() + ";" + str1 + ";" + str2 + ";" + "Android" + ";" + str3 + ")");
  }
  
  protected void addRequestMethod()
  {
    try
    {
      switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$net$AdobeNetworkHttpRequestMethod[_request.getRequestMethod().ordinal()])
      {
      case 1: 
        _urlConnection.setRequestMethod("GET");
        return;
      }
    }
    catch (Exception localException)
    {
      AdobeLogger.log(Level.ERROR, "NetworkService", "Error while setting Http request method.");
      return;
    }
    _urlConnection.setRequestMethod("DELETE");
    return;
    _urlConnection.setRequestMethod("HEAD");
    return;
    _urlConnection.setRequestMethod("POST");
    return;
    _urlConnection.setRequestMethod("PUT");
    return;
  }
  
  public AdobeNetworkHttpResponse call()
  {
    if (!_requestHandler.isCancelled()) {
      _response = new AdobeNetworkHttpResponse();
    }
    for (;;)
    {
      _urlConnection = null;
      _response.setStatusCode(404);
      try
      {
        _urlConnection = ((HttpURLConnection)openConnection(_request));
        _response.setURL(_request.getUrl());
        addRequestMethod();
        bool2 = false;
        if (_urlConnection != null)
        {
          useAccessTokenInHeaders();
          bool1 = bool2;
        }
      }
      catch (IOException localIOException1)
      {
        try
        {
          writeToOutputStream();
          boolean bool1 = bool2;
          boolean bool2 = _requestHandler.isCancelled();
          bool1 = bool2;
          if (!bool2) {}
          try
          {
            _response.setStatusCode(_urlConnection.getResponseCode());
            bool1 = bool2;
            parseHttpHeaders(_response);
            bool1 = bool2;
            captureInputStream();
            bool1 = bool2;
            bool2 = _requestHandler.isCancelled();
            bool1 = bool2;
            if (_urlConnection != null)
            {
              _urlConnection.disconnect();
              _urlConnection = null;
              if (bool1) {
                _response = null;
              }
            }
            if (checkIfShouldRetry(_response)) {
              continue;
            }
            onPostExecute(_response);
            return _response;
            localIOException1 = localIOException1;
            AdobeLogger.log(Level.ERROR, AdobeNetworkHttpDataDownloadTask.class.getName(), "Error opening url connection", localIOException1);
          }
          catch (IOException localIOException2)
          {
            for (;;)
            {
              bool1 = bool2;
              _response.setStatusCode(_urlConnection.getResponseCode());
            }
          }
          _response.setStatusCode(600);
        }
        catch (IOException localIOException3)
        {
          AdobeLogger.log(Level.ERROR, AdobeNetworkHttpDataDownloadTask.class.getName(), "Error during io operation", localIOException3);
          if (!(localIOException3 instanceof SSLException)) {}
        }
      }
    }
    for (;;)
    {
      _response.setNetworkException(localIOException3);
      break;
      _response.setStatusCode(404);
    }
  }
  
  protected void captureData(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    int i = paramAdobeNetworkHttpResponse.getStatusCode();
    if ((i >= 200) && (i < 299)) {}
    for (;;)
    {
      InputStream localInputStream;
      try
      {
        localInputStream = _urlConnection.getInputStream();
        if (localInputStream != null)
        {
          paramAdobeNetworkHttpResponse.setData(ByteBuffer.wrap(IOUtils.toByteArray(localInputStream)));
          localInputStream.close();
        }
        return;
      }
      catch (IOException paramAdobeNetworkHttpResponse)
      {
        paramAdobeNetworkHttpResponse.printStackTrace();
        AdobeLogger.log(Level.ERROR, "NetworkService", "Error during io operation", paramAdobeNetworkHttpResponse);
        return;
      }
      try
      {
        localInputStream = _urlConnection.getErrorStream();
        if (localInputStream != null)
        {
          paramAdobeNetworkHttpResponse.setData(ByteBuffer.wrap(IOUtils.toByteArray(localInputStream)));
          localInputStream.close();
          return;
        }
      }
      catch (IOException paramAdobeNetworkHttpResponse)
      {
        paramAdobeNetworkHttpResponse.printStackTrace();
        AdobeLogger.log(Level.ERROR, "NetworkService", "Error during io operation", paramAdobeNetworkHttpResponse);
      }
    }
  }
  
  protected abstract void captureInputStream();
  
  protected boolean checkIfShouldRetry(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramAdobeNetworkHttpResponse != null)
    {
      int i = paramAdobeNetworkHttpResponse.getStatusCode();
      _numRetries += 1;
      bool1 = bool2;
      if (i > 499)
      {
        bool1 = bool2;
        if (i < 600)
        {
          bool1 = bool2;
          if (i != 507)
          {
            bool1 = bool2;
            if (_numRetries < retryOn5xxDelays.length) {
              bool1 = true;
            }
          }
        }
      }
    }
    try
    {
      Thread.sleep((retryOn5xxDelays[_numRetries] * 1000.0D));
      return bool1;
    }
    catch (InterruptedException paramAdobeNetworkHttpResponse)
    {
      AdobeLogger.log(Level.INFO, "NetworkService", "Retry connection for" + _urlConnection.toString(), paramAdobeNetworkHttpResponse);
    }
    return true;
  }
  
  public void init(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString, AdobeNetworkHttpResponseHandler paramAdobeNetworkHttpResponseHandler, AdobeNetworkHttpTaskHandle paramAdobeNetworkHttpTaskHandle)
  {
    _request = paramAdobeNetworkHttpRequest;
    _completionHandler = paramAdobeNetworkHttpResponseHandler;
    _requestHandler = paramAdobeNetworkHttpTaskHandle;
    _accessToken = paramString;
    _urlConnection = null;
    _numRetries = -1;
    _response = null;
  }
  
  protected void onPostExecute(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    if (_completionHandler != null) {
      _completionHandler.handleResponse(paramAdobeNetworkHttpResponse);
    }
  }
  
  protected void onProgressUpdate(Integer paramInteger)
  {
    _requestHandler.notifyProgress(paramInteger.intValue());
  }
  
  protected URLConnection openConnection(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest)
    throws IOException
  {
    URL localURL = paramAdobeNetworkHttpRequest.getUrl();
    String str = paramAdobeNetworkHttpRequest.getQueryString();
    Object localObject = localURL;
    if (str != null)
    {
      localObject = localURL;
      if (!str.isEmpty()) {
        if (paramAdobeNetworkHttpRequest.getRequestMethod() != AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET)
        {
          localObject = localURL;
          if (paramAdobeNetworkHttpRequest.getRequestMethod() != AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodHEAD) {}
        }
        else
        {
          localObject = new URL(paramAdobeNetworkHttpRequest.getUrl() + "?" + paramAdobeNetworkHttpRequest.getQueryString());
        }
      }
    }
    localObject = ((URL)localObject).openConnection();
    setHttpRequestParameters(paramAdobeNetworkHttpRequest, (URLConnection)localObject);
    return localObject;
  }
  
  protected void parseHttpHeaders(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    HashMap localHashMap = new HashMap();
    Map localMap = _urlConnection.getHeaderFields();
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      List localList = (List)localMap.get(str);
      ArrayList localArrayList = new ArrayList();
      int i = 0;
      while (i < localList.size())
      {
        localArrayList.add(getRFC2047DecodedValue((String)localList.get(i)));
        i += 1;
      }
      localHashMap.put(str, localArrayList);
    }
    paramAdobeNetworkHttpResponse.setHeaders(localHashMap);
  }
  
  protected void setHttpRequestParameters(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, URLConnection paramURLConnection)
  {
    paramAdobeNetworkHttpRequest = paramAdobeNetworkHttpRequest.getRequestProperties().entrySet().iterator();
    while (paramAdobeNetworkHttpRequest.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramAdobeNetworkHttpRequest.next();
      paramURLConnection.setRequestProperty((String)localEntry.getKey(), (String)localEntry.getValue());
    }
    if ((AdobeCSDKFoundation.getApplicationName() != null) && (!AdobeCSDKFoundation.getApplicationName().equals(""))) {
      setUserAgent(paramURLConnection);
    }
    paramURLConnection.setRequestProperty("Connection", "close");
  }
  
  protected void useAccessTokenInHeaders()
  {
    if (_accessToken != null) {
      _urlConnection.setRequestProperty("Authorization", "Bearer " + _accessToken);
    }
  }
  
  /* Error */
  protected void writeToOutputStream()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 10
    //   3: aconst_null
    //   4: astore 9
    //   6: aconst_null
    //   7: astore 8
    //   9: aload 9
    //   11: astore 6
    //   13: aload_0
    //   14: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   17: invokevirtual 160	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getRequestMethod	()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    //   20: getstatic 464	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod:AdobeNetworkHttpRequestMethodPOST	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    //   23: if_acmpne +658 -> 681
    //   26: aload 9
    //   28: astore 6
    //   30: aload_0
    //   31: getfield 45	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   34: iconst_1
    //   35: invokevirtual 468	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   38: aload 10
    //   40: astore 7
    //   42: aload 9
    //   44: astore 6
    //   46: aload_0
    //   47: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   50: invokevirtual 471	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getQueryParams	()Ljava/util/Map;
    //   53: ifnull +598 -> 651
    //   56: aload 9
    //   58: astore 6
    //   60: new 473	java/util/LinkedList
    //   63: dup
    //   64: invokespecial 474	java/util/LinkedList:<init>	()V
    //   67: astore 7
    //   69: aload 9
    //   71: astore 6
    //   73: aload_0
    //   74: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   77: invokevirtual 471	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getQueryParams	()Ljava/util/Map;
    //   80: invokeinterface 438 1 0
    //   85: invokeinterface 395 1 0
    //   90: astore 11
    //   92: aload 9
    //   94: astore 6
    //   96: aload 11
    //   98: invokeinterface 400 1 0
    //   103: ifeq +111 -> 214
    //   106: aload 9
    //   108: astore 6
    //   110: aload 11
    //   112: invokeinterface 403 1 0
    //   117: checkcast 440	java/util/Map$Entry
    //   120: astore 12
    //   122: aload 9
    //   124: astore 6
    //   126: aload 7
    //   128: new 476	org/apache/http/message/BasicNameValuePair
    //   131: dup
    //   132: aload 12
    //   134: invokeinterface 443 1 0
    //   139: checkcast 57	java/lang/String
    //   142: aload 12
    //   144: invokeinterface 446 1 0
    //   149: checkcast 57	java/lang/String
    //   152: invokespecial 478	org/apache/http/message/BasicNameValuePair:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   155: invokeinterface 424 2 0
    //   160: pop
    //   161: goto -69 -> 92
    //   164: astore 6
    //   166: aload 8
    //   168: astore 7
    //   170: aload 6
    //   172: astore 8
    //   174: aload 7
    //   176: astore 6
    //   178: aload 8
    //   180: invokevirtual 479	java/lang/Exception:printStackTrace	()V
    //   183: aload 7
    //   185: astore 6
    //   187: getstatic 180	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   190: ldc 2
    //   192: invokevirtual 262	java/lang/Class:getName	()Ljava/lang/String;
    //   195: ldc_w 269
    //   198: aload 8
    //   200: invokestatic 267	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   203: aload 7
    //   205: ifnull +8 -> 213
    //   208: aload 7
    //   210: invokevirtual 482	java/io/DataOutputStream:close	()V
    //   213: return
    //   214: aload 9
    //   216: astore 6
    //   218: aload 7
    //   220: ldc_w 484
    //   223: invokestatic 490	org/apache/http/client/utils/URLEncodedUtils:format	(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    //   226: astore 11
    //   228: aload 9
    //   230: astore 6
    //   232: aload 11
    //   234: invokevirtual 353	java/lang/String:isEmpty	()Z
    //   237: ifeq +40 -> 277
    //   240: aload 10
    //   242: astore 7
    //   244: aload 9
    //   246: astore 6
    //   248: aload_0
    //   249: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   252: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   255: ifnull +396 -> 651
    //   258: aload 10
    //   260: astore 7
    //   262: aload 9
    //   264: astore 6
    //   266: aload_0
    //   267: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   270: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   273: arraylength
    //   274: ifeq +377 -> 651
    //   277: aload 9
    //   279: astore 6
    //   281: new 481	java/io/DataOutputStream
    //   284: dup
    //   285: aload_0
    //   286: getfield 45	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   289: invokevirtual 498	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   292: invokespecial 501	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   295: astore 7
    //   297: aload 7
    //   299: astore 6
    //   301: aload 7
    //   303: astore 8
    //   305: aload 11
    //   307: invokevirtual 353	java/lang/String:isEmpty	()Z
    //   310: ifne +18 -> 328
    //   313: aload 7
    //   315: astore 6
    //   317: aload 7
    //   319: astore 8
    //   321: aload 7
    //   323: aload 11
    //   325: invokevirtual 504	java/io/DataOutputStream:writeBytes	(Ljava/lang/String;)V
    //   328: aload 7
    //   330: astore 6
    //   332: aload 7
    //   334: astore 8
    //   336: aload_0
    //   337: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   340: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   343: ifnull +295 -> 638
    //   346: aload 7
    //   348: astore 6
    //   350: aload 7
    //   352: astore 8
    //   354: aload_0
    //   355: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   358: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   361: arraylength
    //   362: ifeq +276 -> 638
    //   365: aload 7
    //   367: astore 6
    //   369: aload 7
    //   371: astore 8
    //   373: aload_0
    //   374: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   377: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   380: arraylength
    //   381: istore 4
    //   383: aload 7
    //   385: astore 6
    //   387: aload 7
    //   389: astore 8
    //   391: aload_0
    //   392: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   395: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   398: arraylength
    //   399: istore_1
    //   400: aload 7
    //   402: astore 6
    //   404: aload 7
    //   406: astore 8
    //   408: new 506	java/io/ByteArrayInputStream
    //   411: dup
    //   412: aload_0
    //   413: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   416: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   419: invokespecial 509	java/io/ByteArrayInputStream:<init>	([B)V
    //   422: astore 9
    //   424: aload 7
    //   426: astore 6
    //   428: aload 7
    //   430: astore 8
    //   432: iload_1
    //   433: sipush 4096
    //   436: invokestatic 515	java/lang/Math:min	(II)I
    //   439: istore_2
    //   440: aload 7
    //   442: astore 6
    //   444: aload 7
    //   446: astore 8
    //   448: iload_2
    //   449: newarray byte
    //   451: astore 10
    //   453: aload 7
    //   455: astore 6
    //   457: aload 7
    //   459: astore 8
    //   461: aload 9
    //   463: aload 10
    //   465: iconst_0
    //   466: iload_2
    //   467: invokevirtual 519	java/io/ByteArrayInputStream:read	([BII)I
    //   470: istore_2
    //   471: iconst_0
    //   472: istore_3
    //   473: iload_2
    //   474: ifle +135 -> 609
    //   477: aload 7
    //   479: astore 6
    //   481: aload 7
    //   483: astore 8
    //   485: aload_0
    //   486: getfield 41	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_requestHandler	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    //   489: invokevirtual 208	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle:isCancelled	()Z
    //   492: istore 5
    //   494: iload 5
    //   496: ifeq +35 -> 531
    //   499: aload 7
    //   501: ifnull +8 -> 509
    //   504: aload 7
    //   506: invokevirtual 482	java/io/DataOutputStream:close	()V
    //   509: return
    //   510: astore 6
    //   512: getstatic 180	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   515: ldc 2
    //   517: invokevirtual 262	java/lang/Class:getName	()Ljava/lang/String;
    //   520: ldc_w 269
    //   523: aload 6
    //   525: invokestatic 267	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   528: goto -19 -> 509
    //   531: aload 7
    //   533: astore 6
    //   535: aload 7
    //   537: astore 8
    //   539: aload 7
    //   541: aload 10
    //   543: iconst_0
    //   544: iload_2
    //   545: invokevirtual 523	java/io/DataOutputStream:write	([BII)V
    //   548: iload_3
    //   549: iload_2
    //   550: iadd
    //   551: istore_3
    //   552: iload_1
    //   553: iload_2
    //   554: isub
    //   555: istore_1
    //   556: aload 7
    //   558: astore 6
    //   560: aload 7
    //   562: astore 8
    //   564: aload 9
    //   566: aload 10
    //   568: iconst_0
    //   569: iload_1
    //   570: sipush 4096
    //   573: invokestatic 515	java/lang/Math:min	(II)I
    //   576: invokevirtual 519	java/io/ByteArrayInputStream:read	([BII)I
    //   579: istore_2
    //   580: aload 7
    //   582: astore 6
    //   584: aload 7
    //   586: astore 8
    //   588: aload_0
    //   589: iload_3
    //   590: i2f
    //   591: iload 4
    //   593: i2f
    //   594: fdiv
    //   595: ldc_w 524
    //   598: fmul
    //   599: f2i
    //   600: invokestatic 528	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   603: invokevirtual 530	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:onProgressUpdate	(Ljava/lang/Integer;)V
    //   606: goto -133 -> 473
    //   609: aload 7
    //   611: astore 6
    //   613: aload 7
    //   615: astore 8
    //   617: aload_0
    //   618: getfield 51	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   621: iload_3
    //   622: invokevirtual 533	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:setBytesSent	(I)V
    //   625: aload 7
    //   627: astore 6
    //   629: aload 7
    //   631: astore 8
    //   633: aload 9
    //   635: invokevirtual 534	java/io/ByteArrayInputStream:close	()V
    //   638: aload 7
    //   640: astore 6
    //   642: aload 7
    //   644: astore 8
    //   646: aload 7
    //   648: invokevirtual 537	java/io/DataOutputStream:flush	()V
    //   651: aload 7
    //   653: ifnull -440 -> 213
    //   656: aload 7
    //   658: invokevirtual 482	java/io/DataOutputStream:close	()V
    //   661: return
    //   662: astore 6
    //   664: getstatic 180	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   667: ldc 2
    //   669: invokevirtual 262	java/lang/Class:getName	()Ljava/lang/String;
    //   672: ldc_w 269
    //   675: aload 6
    //   677: invokestatic 267	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   680: return
    //   681: aload 10
    //   683: astore 7
    //   685: aload 9
    //   687: astore 6
    //   689: aload_0
    //   690: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   693: invokevirtual 160	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getRequestMethod	()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    //   696: getstatic 540	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod:AdobeNetworkHttpRequestMethodPUT	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    //   699: if_acmpne -48 -> 651
    //   702: aload 10
    //   704: astore 7
    //   706: aload 9
    //   708: astore 6
    //   710: aload_0
    //   711: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   714: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   717: ifnull -66 -> 651
    //   720: aload 10
    //   722: astore 7
    //   724: aload 9
    //   726: astore 6
    //   728: aload_0
    //   729: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   732: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   735: arraylength
    //   736: ifeq -85 -> 651
    //   739: aload 9
    //   741: astore 6
    //   743: aload_0
    //   744: getfield 45	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   747: iconst_1
    //   748: invokevirtual 468	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   751: aload 9
    //   753: astore 6
    //   755: aload_0
    //   756: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   759: invokevirtual 223	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getUrl	()Ljava/net/URL;
    //   762: invokevirtual 543	java/net/URL:getPath	()Ljava/lang/String;
    //   765: ldc_w 484
    //   768: invokestatic 548	java/net/URLDecoder:decode	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   771: invokestatic 552	org/apache/commons/io/FilenameUtils:getName	(Ljava/lang/String;)Ljava/lang/String;
    //   774: astore 7
    //   776: aload 9
    //   778: astore 6
    //   780: aload_0
    //   781: getfield 45	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   784: ldc_w 554
    //   787: aload 7
    //   789: invokevirtual 461	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   792: aload 9
    //   794: astore 6
    //   796: new 481	java/io/DataOutputStream
    //   799: dup
    //   800: aload_0
    //   801: getfield 45	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   804: invokevirtual 498	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   807: invokespecial 501	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   810: astore 7
    //   812: aload 7
    //   814: astore 6
    //   816: aload 7
    //   818: astore 8
    //   820: aload 7
    //   822: aload_0
    //   823: getfield 47	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   826: invokevirtual 494	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getBody	()[B
    //   829: invokevirtual 556	java/io/DataOutputStream:write	([B)V
    //   832: aload 7
    //   834: astore 6
    //   836: aload 7
    //   838: astore 8
    //   840: aload 7
    //   842: invokevirtual 537	java/io/DataOutputStream:flush	()V
    //   845: goto -194 -> 651
    //   848: astore 8
    //   850: aload 6
    //   852: astore 7
    //   854: aload 8
    //   856: astore 6
    //   858: aload 7
    //   860: ifnull +8 -> 868
    //   863: aload 7
    //   865: invokevirtual 482	java/io/DataOutputStream:close	()V
    //   868: aload 6
    //   870: athrow
    //   871: astore 6
    //   873: getstatic 180	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   876: ldc 2
    //   878: invokevirtual 262	java/lang/Class:getName	()Ljava/lang/String;
    //   881: ldc_w 269
    //   884: aload 6
    //   886: invokestatic 267	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   889: return
    //   890: astore 7
    //   892: getstatic 180	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   895: ldc 2
    //   897: invokevirtual 262	java/lang/Class:getName	()Ljava/lang/String;
    //   900: ldc_w 269
    //   903: aload 7
    //   905: invokestatic 267	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   908: goto -40 -> 868
    //   911: astore 8
    //   913: aload 6
    //   915: astore 7
    //   917: aload 8
    //   919: astore 6
    //   921: goto -63 -> 858
    //   924: astore 6
    //   926: aload 8
    //   928: astore 7
    //   930: aload 6
    //   932: astore 8
    //   934: goto -760 -> 174
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	937	0	this	AdobeNetworkHttpTask
    //   399	171	1	i	int
    //   439	141	2	j	int
    //   472	150	3	k	int
    //   381	211	4	m	int
    //   492	3	5	bool	boolean
    //   11	114	6	localByteArrayInputStream1	java.io.ByteArrayInputStream
    //   164	7	6	localException1	Exception
    //   176	304	6	localObject1	Object
    //   510	14	6	localIOException1	IOException
    //   533	108	6	localObject2	Object
    //   662	14	6	localIOException2	IOException
    //   687	182	6	localObject3	Object
    //   871	43	6	localIOException3	IOException
    //   919	1	6	localObject4	Object
    //   924	7	6	localException2	Exception
    //   40	824	7	localObject5	Object
    //   890	14	7	localIOException4	IOException
    //   915	14	7	localObject6	Object
    //   7	832	8	localObject7	Object
    //   848	7	8	localObject8	Object
    //   911	16	8	localObject9	Object
    //   932	1	8	localObject10	Object
    //   4	789	9	localByteArrayInputStream2	java.io.ByteArrayInputStream
    //   1	720	10	arrayOfByte	byte[]
    //   90	234	11	localObject11	Object
    //   120	23	12	localEntry	Map.Entry
    // Exception table:
    //   from	to	target	type
    //   13	26	164	java/lang/Exception
    //   30	38	164	java/lang/Exception
    //   46	56	164	java/lang/Exception
    //   60	69	164	java/lang/Exception
    //   73	92	164	java/lang/Exception
    //   96	106	164	java/lang/Exception
    //   110	122	164	java/lang/Exception
    //   126	161	164	java/lang/Exception
    //   218	228	164	java/lang/Exception
    //   232	240	164	java/lang/Exception
    //   248	258	164	java/lang/Exception
    //   266	277	164	java/lang/Exception
    //   281	297	164	java/lang/Exception
    //   689	702	164	java/lang/Exception
    //   710	720	164	java/lang/Exception
    //   728	739	164	java/lang/Exception
    //   743	751	164	java/lang/Exception
    //   755	776	164	java/lang/Exception
    //   780	792	164	java/lang/Exception
    //   796	812	164	java/lang/Exception
    //   504	509	510	java/io/IOException
    //   656	661	662	java/io/IOException
    //   305	313	848	finally
    //   321	328	848	finally
    //   336	346	848	finally
    //   354	365	848	finally
    //   373	383	848	finally
    //   391	400	848	finally
    //   408	424	848	finally
    //   432	440	848	finally
    //   448	453	848	finally
    //   461	471	848	finally
    //   485	494	848	finally
    //   539	548	848	finally
    //   564	580	848	finally
    //   588	606	848	finally
    //   617	625	848	finally
    //   633	638	848	finally
    //   646	651	848	finally
    //   820	832	848	finally
    //   840	845	848	finally
    //   208	213	871	java/io/IOException
    //   863	868	890	java/io/IOException
    //   13	26	911	finally
    //   30	38	911	finally
    //   46	56	911	finally
    //   60	69	911	finally
    //   73	92	911	finally
    //   96	106	911	finally
    //   110	122	911	finally
    //   126	161	911	finally
    //   178	183	911	finally
    //   187	203	911	finally
    //   218	228	911	finally
    //   232	240	911	finally
    //   248	258	911	finally
    //   266	277	911	finally
    //   281	297	911	finally
    //   689	702	911	finally
    //   710	720	911	finally
    //   728	739	911	finally
    //   743	751	911	finally
    //   755	776	911	finally
    //   780	792	911	finally
    //   796	812	911	finally
    //   305	313	924	java/lang/Exception
    //   321	328	924	java/lang/Exception
    //   336	346	924	java/lang/Exception
    //   354	365	924	java/lang/Exception
    //   373	383	924	java/lang/Exception
    //   391	400	924	java/lang/Exception
    //   408	424	924	java/lang/Exception
    //   432	440	924	java/lang/Exception
    //   448	453	924	java/lang/Exception
    //   461	471	924	java/lang/Exception
    //   485	494	924	java/lang/Exception
    //   539	548	924	java/lang/Exception
    //   564	580	924	java/lang/Exception
    //   588	606	924	java/lang/Exception
    //   617	625	924	java/lang/Exception
    //   633	638	924	java/lang/Exception
    //   646	651	924	java/lang/Exception
    //   820	832	924	java/lang/Exception
    //   840	845	924	java/lang/Exception
  }
}
