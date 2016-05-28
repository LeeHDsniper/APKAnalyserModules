package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.CredentialsUtils;
import com.adobe.creativesdk.aviary.internal.utils.CryptoUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;

public class CdsManifestDownloader
{
  public CdsManifestDownloader() {}
  
  private CdsManifestParser generateParser(InputStream paramInputStream)
    throws IOException, JSONException
  {
    CdsManifestParser localCdsManifestParser = new CdsManifestParser();
    if (localCdsManifestParser.parse(paramInputStream) != 0) {
      throw new JSONException(localCdsManifestParser.getStatus());
    }
    return localCdsManifestParser;
  }
  
  private List<NameValuePair> getManifestURLParams(Context paramContext, String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new BasicNameValuePair("apiKey", CredentialsUtils.getApiKey(paramContext)));
    localArrayList.add(new BasicNameValuePair("formFactor", CdsServiceParamsUtils.getInstance().getFormFactor(paramContext)));
    localArrayList.add(new BasicNameValuePair("osVersion", String.valueOf(Build.VERSION.SDK_INT)));
    localArrayList.add(new BasicNameValuePair("platform", "android"));
    localArrayList.add(new BasicNameValuePair("resolution", CdsServiceParamsUtils.getInstance().getResolution(paramContext)));
    localArrayList.add(new BasicNameValuePair("sdkVersion", "4.1.1"));
    localArrayList.add(new BasicNameValuePair("contentGroup", CdsServiceParamsUtils.getInstance().getContentGroup(paramContext)));
    if (CdsServiceParamsUtils.getInstance().hasCountryParam()) {
      localArrayList.add(new BasicNameValuePair("country", CdsServiceParamsUtils.getInstance().getCountry()));
    }
    if (CdsServiceParamsUtils.getInstance().hasLanguageParam()) {
      localArrayList.add(new BasicNameValuePair("language", CdsServiceParamsUtils.getInstance().getLanguage()));
    }
    if (!TextUtils.isEmpty(paramString)) {
      localArrayList.add(new BasicNameValuePair("versionKey", paramString));
    }
    return localArrayList;
  }
  
  private void throwIfNotWifiConnected(Context paramContext)
    throws IOException
  {
    if (!ConnectionUtils.isWifiConnected(paramContext)) {
      throw new IOException("NotConnected");
    }
  }
  
  public CdsManifestParser download(Context paramContext, String paramString, boolean paramBoolean)
    throws IOException, JSONException
  {
    String str = CdsServiceParamsUtils.getInstance().getServerUrl(paramContext) + "/manifest?";
    paramString = getManifestURLParams(paramContext, paramString);
    CryptoUtils.addSignature(paramString, CredentialsUtils.getApiSecret(paramContext));
    if (CdsServiceParamsUtils.getInstance().isDebug(paramContext)) {
      paramString.add(new BasicNameValuePair("staging", "2"));
    }
    if (paramBoolean) {
      throwIfNotWifiConnected(paramContext);
    }
    paramContext = IOUtils.download(str, paramString);
    try
    {
      paramString = generateParser(paramContext);
      return paramString;
    }
    finally
    {
      IOUtils.closeSilently(paramContext);
    }
  }
}
