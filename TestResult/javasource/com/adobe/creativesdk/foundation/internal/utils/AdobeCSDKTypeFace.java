package com.adobe.creativesdk.foundation.internal.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import com.adobe.creativesdk.foundation.auth.R.raw;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;

public class AdobeCSDKTypeFace
{
  private static Typeface _csdkadobeCleanFont = null;
  
  public static Typeface getTypeface(Context paramContext)
  {
    if (_csdkadobeCleanFont == null) {}
    try
    {
      paramContext = paramContext.getResources().openRawResource(R.raw.adobecleanlight);
      File localFile = File.createTempFile("temp", null);
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      IOUtils.copy(paramContext, localFileOutputStream);
      localFileOutputStream.close();
      _csdkadobeCleanFont = Typeface.createFromFile(localFile);
      return _csdkadobeCleanFont;
    }
    catch (IOException paramContext)
    {
      for (;;)
      {
        _csdkadobeCleanFont = Typeface.create("sans-serif", 0);
      }
    }
  }
}
