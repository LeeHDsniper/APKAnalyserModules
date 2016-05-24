package com.google.android.gms.internal;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;

public class zzz
  implements zzy
{
  private final zza zzaE;
  private final SSLSocketFactory zzaF;
  
  public zzz()
  {
    this(null);
  }
  
  public zzz(zza paramZza)
  {
    this(paramZza, null);
  }
  
  public zzz(zza paramZza, SSLSocketFactory paramSSLSocketFactory)
  {
    zzaE = paramZza;
    zzaF = paramSSLSocketFactory;
  }
  
  private HttpURLConnection zza(URL paramURL, zzk<?> paramZzk)
    throws IOException
  {
    HttpURLConnection localHttpURLConnection = zza(paramURL);
    int i = paramZzk.zzt();
    localHttpURLConnection.setConnectTimeout(i);
    localHttpURLConnection.setReadTimeout(i);
    localHttpURLConnection.setUseCaches(false);
    localHttpURLConnection.setDoInput(true);
    if (("https".equals(paramURL.getProtocol())) && (zzaF != null)) {
      ((HttpsURLConnection)localHttpURLConnection).setSSLSocketFactory(zzaF);
    }
    return localHttpURLConnection;
  }
  
  private static HttpEntity zza(HttpURLConnection paramHttpURLConnection)
  {
    BasicHttpEntity localBasicHttpEntity = new BasicHttpEntity();
    try
    {
      InputStream localInputStream1 = paramHttpURLConnection.getInputStream();
      localBasicHttpEntity.setContent(localInputStream1);
      localBasicHttpEntity.setContentLength(paramHttpURLConnection.getContentLength());
      localBasicHttpEntity.setContentEncoding(paramHttpURLConnection.getContentEncoding());
      localBasicHttpEntity.setContentType(paramHttpURLConnection.getContentType());
      return localBasicHttpEntity;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        InputStream localInputStream2 = paramHttpURLConnection.getErrorStream();
      }
    }
  }
  
  static void zza(HttpURLConnection paramHttpURLConnection, zzk<?> paramZzk)
    throws IOException, zza
  {
    switch (paramZzk.getMethod())
    {
    default: 
      throw new IllegalStateException("Unknown method type.");
    case -1: 
      byte[] arrayOfByte = paramZzk.zzm();
      if (arrayOfByte != null)
      {
        paramHttpURLConnection.setDoOutput(true);
        paramHttpURLConnection.setRequestMethod("POST");
        paramHttpURLConnection.addRequestProperty("Content-Type", paramZzk.zzl());
        paramHttpURLConnection = new DataOutputStream(paramHttpURLConnection.getOutputStream());
        paramHttpURLConnection.write(arrayOfByte);
        paramHttpURLConnection.close();
      }
      return;
    case 0: 
      paramHttpURLConnection.setRequestMethod("GET");
      return;
    case 3: 
      paramHttpURLConnection.setRequestMethod("DELETE");
      return;
    case 1: 
      paramHttpURLConnection.setRequestMethod("POST");
      zzb(paramHttpURLConnection, paramZzk);
      return;
    case 2: 
      paramHttpURLConnection.setRequestMethod("PUT");
      zzb(paramHttpURLConnection, paramZzk);
      return;
    case 4: 
      paramHttpURLConnection.setRequestMethod("HEAD");
      return;
    case 5: 
      paramHttpURLConnection.setRequestMethod("OPTIONS");
      return;
    case 6: 
      paramHttpURLConnection.setRequestMethod("TRACE");
      return;
    }
    paramHttpURLConnection.setRequestMethod("PATCH");
    zzb(paramHttpURLConnection, paramZzk);
  }
  
  private static void zzb(HttpURLConnection paramHttpURLConnection, zzk<?> paramZzk)
    throws IOException, zza
  {
    byte[] arrayOfByte = paramZzk.zzq();
    if (arrayOfByte != null)
    {
      paramHttpURLConnection.setDoOutput(true);
      paramHttpURLConnection.addRequestProperty("Content-Type", paramZzk.zzp());
      paramHttpURLConnection = new DataOutputStream(paramHttpURLConnection.getOutputStream());
      paramHttpURLConnection.write(arrayOfByte);
      paramHttpURLConnection.close();
    }
  }
  
  protected HttpURLConnection zza(URL paramURL)
    throws IOException
  {
    return (HttpURLConnection)paramURL.openConnection();
  }
  
  public HttpResponse zza(zzk<?> paramZzk, Map<String, String> paramMap)
    throws IOException, zza
  {
    Object localObject = paramZzk.getUrl();
    HashMap localHashMap = new HashMap();
    localHashMap.putAll(paramZzk.getHeaders());
    localHashMap.putAll(paramMap);
    String str;
    if (zzaE != null)
    {
      str = zzaE.zzh((String)localObject);
      paramMap = str;
      if (str == null) {
        throw new IOException("URL blocked by rewriter: " + (String)localObject);
      }
    }
    else
    {
      paramMap = (Map<String, String>)localObject;
    }
    paramMap = zza(new URL(paramMap), paramZzk);
    localObject = localHashMap.keySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      str = (String)((Iterator)localObject).next();
      paramMap.addRequestProperty(str, (String)localHashMap.get(str));
    }
    zza(paramMap, paramZzk);
    paramZzk = new ProtocolVersion("HTTP", 1, 1);
    if (paramMap.getResponseCode() == -1) {
      throw new IOException("Could not retrieve response code from HttpUrlConnection.");
    }
    paramZzk = new BasicHttpResponse(new BasicStatusLine(paramZzk, paramMap.getResponseCode(), paramMap.getResponseMessage()));
    paramZzk.setEntity(zza(paramMap));
    paramMap = paramMap.getHeaderFields().entrySet().iterator();
    while (paramMap.hasNext())
    {
      localObject = (Map.Entry)paramMap.next();
      if (((Map.Entry)localObject).getKey() != null) {
        paramZzk.addHeader(new BasicHeader((String)((Map.Entry)localObject).getKey(), (String)((List)((Map.Entry)localObject).getValue()).get(0)));
      }
    }
    return paramZzk;
  }
  
  public static abstract interface zza
  {
    public abstract String zzh(String paramString);
  }
}
