package com.google.android.gms.internal;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

class zzqu
  implements zzqv
{
  private HttpURLConnection zzaUn;
  
  zzqu() {}
  
  private InputStream zzc(HttpURLConnection paramHttpURLConnection)
    throws IOException
  {
    int i = paramHttpURLConnection.getResponseCode();
    if (i == 200) {
      return paramHttpURLConnection.getInputStream();
    }
    paramHttpURLConnection = "Bad response: " + i;
    if (i == 404) {
      throw new FileNotFoundException(paramHttpURLConnection);
    }
    throw new IOException(paramHttpURLConnection);
  }
  
  private void zzd(HttpURLConnection paramHttpURLConnection)
  {
    if (paramHttpURLConnection != null) {
      paramHttpURLConnection.disconnect();
    }
  }
  
  public void close()
  {
    zzd(zzaUn);
  }
  
  public InputStream zzfs(String paramString)
    throws IOException
  {
    zzaUn = zzft(paramString);
    return zzc(zzaUn);
  }
  
  HttpURLConnection zzft(String paramString)
    throws IOException
  {
    paramString = (HttpURLConnection)new URL(paramString).openConnection();
    paramString.setReadTimeout(20000);
    paramString.setConnectTimeout(20000);
    return paramString;
  }
}
