package com.google.android.gms.appindexing;

import android.net.Uri;
import android.net.Uri.Builder;
import com.google.android.gms.common.internal.zzw;
import java.util.Iterator;
import java.util.List;

public final class AndroidAppUri
{
  private final Uri mUri;
  
  private AndroidAppUri(Uri paramUri)
  {
    mUri = paramUri;
  }
  
  public static AndroidAppUri newAndroidAppUri(String paramString, Uri paramUri)
  {
    paramString = new Uri.Builder().scheme("android-app").authority(paramString);
    if (paramUri != null)
    {
      paramString.appendPath(paramUri.getScheme());
      if (paramUri.getAuthority() != null) {
        paramString.appendPath(paramUri.getAuthority());
      }
      Iterator localIterator = paramUri.getPathSegments().iterator();
      while (localIterator.hasNext()) {
        paramString.appendPath((String)localIterator.next());
      }
      paramString.encodedQuery(paramUri.getEncodedQuery()).encodedFragment(paramUri.getEncodedFragment());
    }
    return new AndroidAppUri(paramString.build());
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof AndroidAppUri)) {
      return mUri.equals(mUri);
    }
    return false;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { mUri });
  }
  
  public String toString()
  {
    return mUri.toString();
  }
}
