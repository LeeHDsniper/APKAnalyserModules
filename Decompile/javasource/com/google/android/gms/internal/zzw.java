package com.google.android.gms.internal;

import java.io.IOException;
import java.net.URI;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpOptions;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpTrace;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.params.HttpConnectionParams;

public class zzw
  implements zzy
{
  protected final HttpClient zzaD;
  
  public zzw(HttpClient paramHttpClient)
  {
    zzaD = paramHttpClient;
  }
  
  private static void zza(HttpEntityEnclosingRequestBase paramHttpEntityEnclosingRequestBase, zzk<?> paramZzk)
    throws zza
  {
    paramZzk = paramZzk.zzq();
    if (paramZzk != null) {
      paramHttpEntityEnclosingRequestBase.setEntity(new ByteArrayEntity(paramZzk));
    }
  }
  
  private static void zza(HttpUriRequest paramHttpUriRequest, Map<String, String> paramMap)
  {
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      paramHttpUriRequest.setHeader(str, (String)paramMap.get(str));
    }
  }
  
  static HttpUriRequest zzb(zzk<?> paramZzk, Map<String, String> paramMap)
    throws zza
  {
    switch (paramZzk.getMethod())
    {
    default: 
      throw new IllegalStateException("Unknown request method.");
    case -1: 
      paramMap = paramZzk.zzm();
      if (paramMap != null)
      {
        HttpPost localHttpPost = new HttpPost(paramZzk.getUrl());
        localHttpPost.addHeader("Content-Type", paramZzk.zzl());
        localHttpPost.setEntity(new ByteArrayEntity(paramMap));
        return localHttpPost;
      }
      return new HttpGet(paramZzk.getUrl());
    case 0: 
      return new HttpGet(paramZzk.getUrl());
    case 3: 
      return new HttpDelete(paramZzk.getUrl());
    case 1: 
      paramMap = new HttpPost(paramZzk.getUrl());
      paramMap.addHeader("Content-Type", paramZzk.zzp());
      zza(paramMap, paramZzk);
      return paramMap;
    case 2: 
      paramMap = new HttpPut(paramZzk.getUrl());
      paramMap.addHeader("Content-Type", paramZzk.zzp());
      zza(paramMap, paramZzk);
      return paramMap;
    case 4: 
      return new HttpHead(paramZzk.getUrl());
    case 5: 
      return new HttpOptions(paramZzk.getUrl());
    case 6: 
      return new HttpTrace(paramZzk.getUrl());
    }
    paramMap = new zza(paramZzk.getUrl());
    paramMap.addHeader("Content-Type", paramZzk.zzp());
    zza(paramMap, paramZzk);
    return paramMap;
  }
  
  public HttpResponse zza(zzk<?> paramZzk, Map<String, String> paramMap)
    throws IOException, zza
  {
    HttpUriRequest localHttpUriRequest = zzb(paramZzk, paramMap);
    zza(localHttpUriRequest, paramMap);
    zza(localHttpUriRequest, paramZzk.getHeaders());
    zza(localHttpUriRequest);
    paramMap = localHttpUriRequest.getParams();
    int i = paramZzk.zzt();
    HttpConnectionParams.setConnectionTimeout(paramMap, 5000);
    HttpConnectionParams.setSoTimeout(paramMap, i);
    return zzaD.execute(localHttpUriRequest);
  }
  
  protected void zza(HttpUriRequest paramHttpUriRequest)
    throws IOException
  {}
  
  public static final class zza
    extends HttpEntityEnclosingRequestBase
  {
    public zza() {}
    
    public zza(String paramString)
    {
      setURI(URI.create(paramString));
    }
    
    public String getMethod()
    {
      return "PATCH";
    }
  }
}
