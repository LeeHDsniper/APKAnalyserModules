package com.behance.sdk.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class BehanceSDKHTTPUtils
{
  public static HTTPResponse doHTTPDelete(HttpDelete paramHttpDelete)
    throws ClientProtocolException, IOException
  {
    return executeRequest(paramHttpDelete);
  }
  
  public static HTTPResponse doHTTPGet(HttpGet paramHttpGet)
    throws ClientProtocolException, IOException
  {
    return executeRequest(paramHttpGet);
  }
  
  public static HTTPResponse doHTTPPost(HttpPost paramHttpPost)
    throws ClientProtocolException, IOException
  {
    return executeRequest(paramHttpPost);
  }
  
  public static HTTPResponse doHTTPPut(HttpPut paramHttpPut)
    throws ClientProtocolException, IOException
  {
    return executeRequest(paramHttpPut);
  }
  
  private static HTTPResponse executeRequest(HttpUriRequest paramHttpUriRequest)
    throws ClientProtocolException, IOException
  {
    ClientConnectionManager localClientConnectionManager2 = null;
    ClientConnectionManager localClientConnectionManager1 = localClientConnectionManager2;
    try
    {
      HTTPResponse localHTTPResponse = new HTTPResponse();
      localClientConnectionManager1 = localClientConnectionManager2;
      Object localObject = getHttpClient();
      localClientConnectionManager1 = localClientConnectionManager2;
      localClientConnectionManager2 = ((HttpClient)localObject).getConnectionManager();
      localClientConnectionManager1 = localClientConnectionManager2;
      paramHttpUriRequest = ((HttpClient)localObject).execute(paramHttpUriRequest);
      localClientConnectionManager1 = localClientConnectionManager2;
      localObject = paramHttpUriRequest.getStatusLine();
      localClientConnectionManager1 = localClientConnectionManager2;
      int i = ((StatusLine)localObject).getStatusCode();
      localClientConnectionManager1 = localClientConnectionManager2;
      localHTTPResponse.setStatusCode(i);
      localClientConnectionManager1 = localClientConnectionManager2;
      localHTTPResponse.setReasonPhrase(((StatusLine)localObject).getReasonPhrase());
      if ((i == 200) || (i == 201))
      {
        localClientConnectionManager1 = localClientConnectionManager2;
        localHTTPResponse.setResponseString(getContentAsString(paramHttpUriRequest));
      }
      return localHTTPResponse;
    }
    finally
    {
      if (localClientConnectionManager1 != null) {
        localClientConnectionManager1.shutdown();
      }
    }
  }
  
  public static String getContentAsString(HttpResponse paramHttpResponse)
    throws IOException
  {
    String str = null;
    if (paramHttpResponse.getEntity() != null) {}
    for (paramHttpResponse = paramHttpResponse.getEntity().getContent();; paramHttpResponse = null)
    {
      if (paramHttpResponse != null)
      {
        paramHttpResponse = new InputStreamReader(paramHttpResponse);
        BufferedReader localBufferedReader = new BufferedReader(paramHttpResponse);
        str = localBufferedReader.readLine().trim();
        paramHttpResponse.close();
        localBufferedReader.close();
      }
      return str;
    }
  }
  
  public static HttpClient getHttpClient()
  {
    DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
    HttpParams localHttpParams = localDefaultHttpClient.getParams();
    HttpConnectionParams.setConnectionTimeout(localHttpParams, 60000);
    HttpConnectionParams.setSoTimeout(localHttpParams, 60000);
    HttpConnectionParams.setTcpNoDelay(localHttpParams, true);
    ConnManagerParams.setTimeout(localHttpParams, 60000L);
    return localDefaultHttpClient;
  }
}
