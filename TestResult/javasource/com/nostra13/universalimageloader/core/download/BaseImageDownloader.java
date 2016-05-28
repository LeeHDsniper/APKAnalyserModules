package com.nostra13.universalimageloader.core.download;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.net.Uri;
import android.provider.ContactsContract.Contacts;
import com.nostra13.universalimageloader.core.assist.ContentLengthInputStream;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class BaseImageDownloader
  implements ImageDownloader
{
  protected final int connectTimeout;
  protected final Context context;
  protected final int readTimeout;
  
  public BaseImageDownloader(Context paramContext)
  {
    context = paramContext.getApplicationContext();
    connectTimeout = 5000;
    readTimeout = 20000;
  }
  
  protected HttpURLConnection createConnection(String paramString, Object paramObject)
    throws IOException
  {
    paramString = (HttpURLConnection)new URL(Uri.encode(paramString, "@#&=*+-_.,:!?()/~'%")).openConnection();
    paramString.setConnectTimeout(connectTimeout);
    paramString.setReadTimeout(readTimeout);
    return paramString;
  }
  
  public InputStream getStream(String paramString, Object paramObject)
    throws IOException
  {
    switch (1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[ImageDownloader.Scheme.ofUri(paramString).ordinal()])
    {
    default: 
      return getStreamFromOtherSource(paramString, paramObject);
    case 1: 
    case 2: 
      return getStreamFromNetwork(paramString, paramObject);
    case 3: 
      return getStreamFromFile(paramString, paramObject);
    case 4: 
      return getStreamFromContent(paramString, paramObject);
    case 5: 
      return getStreamFromAssets(paramString, paramObject);
    }
    return getStreamFromDrawable(paramString, paramObject);
  }
  
  protected InputStream getStreamFromAssets(String paramString, Object paramObject)
    throws IOException
  {
    paramString = ImageDownloader.Scheme.ASSETS.crop(paramString);
    return context.getAssets().open(paramString);
  }
  
  protected InputStream getStreamFromContent(String paramString, Object paramObject)
    throws FileNotFoundException
  {
    paramObject = context.getContentResolver();
    Uri localUri = Uri.parse(paramString);
    if (paramString.startsWith("content://com.android.contacts/")) {
      return ContactsContract.Contacts.openContactPhotoInputStream(paramObject, localUri);
    }
    return paramObject.openInputStream(localUri);
  }
  
  protected InputStream getStreamFromDrawable(String paramString, Object paramObject)
  {
    int i = Integer.parseInt(ImageDownloader.Scheme.DRAWABLE.crop(paramString));
    return context.getResources().openRawResource(i);
  }
  
  protected InputStream getStreamFromFile(String paramString, Object paramObject)
    throws IOException
  {
    paramString = ImageDownloader.Scheme.FILE.crop(paramString);
    return new ContentLengthInputStream(new BufferedInputStream(new FileInputStream(paramString), 32768), (int)new File(paramString).length());
  }
  
  protected InputStream getStreamFromNetwork(String paramString, Object paramObject)
    throws IOException
  {
    paramString = createConnection(paramString, paramObject);
    int i = 0;
    while ((paramString.getResponseCode() / 100 == 3) && (i < 5))
    {
      paramString = createConnection(paramString.getHeaderField("Location"), paramObject);
      i += 1;
    }
    try
    {
      paramObject = paramString.getInputStream();
      return new ContentLengthInputStream(new BufferedInputStream(paramObject, 32768), paramString.getContentLength());
    }
    catch (IOException paramObject)
    {
      IoUtils.readAndCloseStream(paramString.getErrorStream());
      throw paramObject;
    }
  }
  
  protected InputStream getStreamFromOtherSource(String paramString, Object paramObject)
    throws IOException
  {
    throw new UnsupportedOperationException(String.format("UIL doesn't support scheme(protocol) by default [%s]. You should implement this support yourself (BaseImageDownloader.getStreamFromOtherSource(...))", new Object[] { paramString }));
  }
}
