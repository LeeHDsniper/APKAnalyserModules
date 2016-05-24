package com.adobe.creativesdk.foundation.internal.storage.model.services;

import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequest;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpRequestMethod;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpResponse;
import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpService;
import com.adobe.creativesdk.foundation.network.AdobeNetworkException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageAsyncResponseHandler
{
  IAdobeStorageAsyncResponseHandlerCallback callback;
  long secondsToRetry;
  AdobeStorageSession session;
  
  protected AdobeStorageAsyncResponseHandler(long paramLong, AdobeStorageSession paramAdobeStorageSession, IAdobeStorageAsyncResponseHandlerCallback paramIAdobeStorageAsyncResponseHandlerCallback)
  {
    secondsToRetry = paramLong;
    callback = paramIAdobeStorageAsyncResponseHandlerCallback;
    session = paramAdobeStorageSession;
  }
  
  private void poll(String paramString, final long paramLong, final Handler paramHandler)
  {
    try
    {
      AdobeStorageSession localAdobeStorageSession = session;
      Object localObject = localAdobeStorageSession.getServiceForSchemaId("files");
      localObject = new URI(((AdobeNetworkHttpService)localObject).baseURL().toString() + paramString).toURL();
      AdobeNetworkHttpRequest localAdobeNetworkHttpRequest = new AdobeNetworkHttpRequest();
      localAdobeNetworkHttpRequest.setUrl((URL)localObject);
      localAdobeNetworkHttpRequest.setRequestMethod(AdobeNetworkHttpRequestMethod.AdobeNetworkHttpRequestMethodGET);
      localAdobeStorageSession.getResponseFor(localAdobeNetworkHttpRequest, null, null, new AdobeStorageSession.IStorageResponseCallback()
      {
        public void onComplete(AdobeNetworkHttpResponse paramAnonymousAdobeNetworkHttpResponse)
        {
          switch (paramAnonymousAdobeNetworkHttpResponse.getStatusCode())
          {
          case 201: 
          default: 
            return;
          case 200: 
            Object localObject = paramAnonymousAdobeNetworkHttpResponse.getDataString();
            localObject = ((String)localObject).substring(((String)localObject).indexOf(" ") + 1);
            localObject = Pattern.compile("^([0-9]+)").matcher((CharSequence)localObject);
            int i = 0;
            if (((Matcher)localObject).find())
            {
              try
              {
                int j = Integer.parseInt(((Matcher)localObject).group(0));
                i = j;
              }
              catch (Exception localException)
              {
                for (;;)
                {
                  localException.printStackTrace();
                }
                callback.onError(paramAnonymousAdobeNetworkHttpResponse);
                return;
              }
              if ((i == 200) || (i == 201))
              {
                callback.onComplete(paramAnonymousAdobeNetworkHttpResponse);
                return;
              }
            }
            callback.onError(paramAnonymousAdobeNetworkHttpResponse);
            return;
          }
          try
          {
            Thread.sleep(paramLong);
            AdobeStorageAsyncResponseHandler.this.poll(paramHandler, paramLong, val$callbackRequiredForHandler);
            return;
          }
          catch (InterruptedException paramAnonymousAdobeNetworkHttpResponse)
          {
            for (;;)
            {
              paramAnonymousAdobeNetworkHttpResponse.printStackTrace();
            }
          }
        }
        
        public void onError(AdobeNetworkException paramAnonymousAdobeNetworkException)
        {
          callback.onError(paramAnonymousAdobeNetworkException);
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      }, paramHandler);
      return;
    }
    catch (MalformedURLException paramString)
    {
      paramString.printStackTrace();
      return;
    }
    catch (URISyntaxException paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void startMonitoringServiceEndPoint(AdobeNetworkHttpResponse paramAdobeNetworkHttpResponse)
  {
    try
    {
      String str = new JSONObject(paramAdobeNetworkHttpResponse.getDataString()).getString("href");
      try
      {
        paramAdobeNetworkHttpResponse = new Handler();
        poll(str, secondsToRetry, paramAdobeNetworkHttpResponse);
        return;
      }
      catch (Exception paramAdobeNetworkHttpResponse)
      {
        for (;;)
        {
          paramAdobeNetworkHttpResponse = null;
        }
      }
      return;
    }
    catch (JSONException paramAdobeNetworkHttpResponse)
    {
      paramAdobeNetworkHttpResponse.printStackTrace();
    }
  }
}
