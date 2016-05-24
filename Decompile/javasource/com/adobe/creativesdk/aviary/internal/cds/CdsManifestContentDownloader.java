package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsJsonParser;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.CredentialsUtils;
import com.adobe.creativesdk.aviary.internal.utils.CryptoUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;

public abstract class CdsManifestContentDownloader<T extends CdsJsonParser>
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsManifestContentDownloader");
  private final boolean mDebugVersion;
  private final String mServerRoot;
  
  public CdsManifestContentDownloader(String paramString, boolean paramBoolean)
  {
    mServerRoot = paramString;
    mDebugVersion = paramBoolean;
  }
  
  private T downloadUrl(Context paramContext, boolean paramBoolean, String paramString)
    throws IOException, JSONException
  {
    Context localContext = null;
    if ((paramBoolean) && (!ConnectionUtils.isWifiConnected(paramContext))) {
      throw new IOException("Not connected");
    }
    try
    {
      paramContext = IOUtils.hunt(paramContext, paramString);
      if (paramContext == null)
      {
        localContext = paramContext;
        throw new IOException("Invalid Stream");
      }
    }
    finally
    {
      IOUtils.closeSilently(localContext);
    }
    localContext = paramContext;
    paramString = parseStream(paramContext);
    IOUtils.closeSilently(paramContext);
    return paramString;
  }
  
  private String getContentURL(Context paramContext, String paramString1, String paramString2)
  {
    List localList = getContentURLParams(paramContext);
    localList.add(new BasicNameValuePair("identifier", paramString1));
    localList.add(new BasicNameValuePair("formatListId", paramString2));
    CryptoUtils.addSignature(localList, CredentialsUtils.getApiSecret(paramContext));
    if (mDebugVersion) {
      localList.add(new BasicNameValuePair("staging", "2"));
    }
    return mServerRoot + "/content?" + URLEncodedUtils.format(localList, "utf-8");
  }
  
  T download(Context paramContext, String paramString1, String paramString2, boolean paramBoolean)
    throws IOException, JSONException
  {
    return downloadUrl(paramContext, paramBoolean, getContentURL(paramContext, paramString1, paramString2));
  }
  
  T download(Context paramContext, String paramString, boolean paramBoolean)
    throws IOException, JSONException
  {
    return downloadUrl(paramContext, paramBoolean, getContentURL(paramContext, paramString));
  }
  
  protected String getContentURL(Context paramContext, String paramString)
  {
    List localList = getContentURLParams(paramContext);
    localList.add(new BasicNameValuePair("versionKey", paramString));
    CryptoUtils.addSignature(localList, CredentialsUtils.getApiSecret(paramContext));
    if (mDebugVersion) {
      localList.add(new BasicNameValuePair("staging", "2"));
    }
    return mServerRoot + "/content?" + URLEncodedUtils.format(localList, "utf-8");
  }
  
  protected List<NameValuePair> getContentURLParams(Context paramContext)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new BasicNameValuePair("apiKey", CredentialsUtils.getApiKey(paramContext)));
    if (CdsServiceParamsUtils.getInstance().hasCountryParam()) {
      localArrayList.add(new BasicNameValuePair("country", CdsServiceParamsUtils.getInstance().getCountry()));
    }
    if (CdsServiceParamsUtils.getInstance().hasLanguageParam()) {
      localArrayList.add(new BasicNameValuePair("language", CdsServiceParamsUtils.getInstance().getLanguage()));
    }
    return localArrayList;
  }
  
  abstract T parseStream(InputStream paramInputStream)
    throws IOException, JSONException;
}
