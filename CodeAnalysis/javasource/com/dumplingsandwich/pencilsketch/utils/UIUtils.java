package com.dumplingsandwich.pencilsketch.utils;

import android.app.ProgressDialog;
import android.content.Context;

public class UIUtils
{
  public static ProgressDialog getLoadingIndicator(Context paramContext, String paramString, boolean paramBoolean)
  {
    paramContext = new ProgressDialog(paramContext);
    paramContext.setProgressStyle(0);
    paramContext.setMessage(paramString);
    paramContext.setCancelable(paramBoolean);
    return paramContext;
  }
}
