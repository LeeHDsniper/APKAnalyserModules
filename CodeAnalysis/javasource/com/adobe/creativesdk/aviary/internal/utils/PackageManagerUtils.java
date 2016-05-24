package com.adobe.creativesdk.aviary.internal.utils;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.Signature;
import android.net.Uri;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.cds.CdsProvider;
import java.io.ByteArrayInputStream;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import javax.security.auth.x500.X500Principal;

public final class PackageManagerUtils
{
  private static final X500Principal DEBUG_DN = new X500Principal("CN=Android Debug,O=Android,C=");
  private static boolean isDebugVersionChecked;
  private static final Object isDebugVersionLock = new Object();
  private static boolean isDebugVersionValue;
  private static ApplicationInfo mInfo;
  private static PackageInfo mPackageInfo;
  private static String sCdsAuthority;
  private static String sCdsProviderContentUri;
  
  public static ApplicationInfo getApplicationInfo(Context paramContext)
  {
    PackageManager localPackageManager;
    if (mInfo == null) {
      localPackageManager = paramContext.getPackageManager();
    }
    try
    {
      mInfo = localPackageManager.getApplicationInfo(paramContext.getPackageName(), 128);
      return mInfo;
    }
    catch (Exception paramContext)
    {
      for (;;) {}
    }
  }
  
  public static String getCDSProviderAuthority(Context paramContext)
  {
    if (sCdsAuthority == null) {
      sCdsAuthority = paramContext.getPackageName() + "." + CdsProvider.class.getSimpleName();
    }
    return sCdsAuthority;
  }
  
  public static Uri getCDSProviderContentUri(Context paramContext, String paramString)
  {
    if (paramString == null) {
      return Uri.parse(getCDSProviderContentUrl(paramContext));
    }
    return Uri.withAppendedPath(Uri.parse(getCDSProviderContentUrl(paramContext)), paramString);
  }
  
  public static String getCDSProviderContentUrl(Context paramContext)
  {
    if (sCdsProviderContentUri == null) {
      sCdsProviderContentUri = "content://" + getCDSProviderAuthority(paramContext);
    }
    return sCdsProviderContentUri;
  }
  
  public static PackageInfo getPackageInfo(Context paramContext)
  {
    PackageManager localPackageManager;
    if ((mPackageInfo == null) && (paramContext != null)) {
      localPackageManager = paramContext.getPackageManager();
    }
    try
    {
      mPackageInfo = localPackageManager.getPackageInfo(paramContext.getPackageName(), 0);
      return mPackageInfo;
    }
    catch (Exception paramContext)
    {
      for (;;) {}
    }
  }
  
  public static boolean isDebugVersion(Context paramContext)
  {
    boolean bool = true;
    synchronized (isDebugVersionLock)
    {
      if (!isDebugVersionChecked)
      {
        if (!isSignedReleaseVersion(paramContext))
        {
          isDebugVersionValue = bool;
          isDebugVersionChecked = true;
        }
      }
      else
      {
        Log.v("TAG", "isDebugVersionValue: " + isDebugVersionValue);
        return isDebugVersionValue;
      }
      bool = false;
    }
  }
  
  private static boolean isSignedReleaseVersion(Context paramContext)
  {
    boolean bool2 = false;
    int n = 0;
    int i1 = 0;
    boolean bool1 = false;
    k = n;
    m = i1;
    for (;;)
    {
      try
      {
        paramContext = getPackageManagergetPackageInfogetPackageName64signatures;
        k = n;
        m = i1;
        CertificateFactory localCertificateFactory = CertificateFactory.getInstance("X.509");
        k = n;
        m = i1;
        int j = paramContext.length;
        i = 0;
        k = bool1;
        if (i < j)
        {
          k = bool1;
          m = bool1;
          X509Certificate localX509Certificate = (X509Certificate)localCertificateFactory.generateCertificate(new ByteArrayInputStream(paramContext[i].toByteArray()));
          k = bool1;
          m = bool1;
          Log.v("PackageManagerUtils", localX509Certificate.getSubjectX500Principal().getName());
          k = bool1;
          m = bool1;
          bool1 = localX509Certificate.getSubjectX500Principal().getName().startsWith(DEBUG_DN.getName());
          if (!bool1) {
            continue;
          }
          k = bool1;
        }
      }
      catch (CertificateException paramContext)
      {
        int i;
        continue;
      }
      catch (PackageManager.NameNotFoundException paramContext)
      {
        k = m;
        continue;
      }
      bool1 = bool2;
      if (k == 0) {
        bool1 = true;
      }
      return bool1;
      i += 1;
    }
  }
  
  public static boolean isStandalone(Context paramContext)
  {
    return "com.aviary.android.feather".equals(paramContext.getPackageName());
  }
}
