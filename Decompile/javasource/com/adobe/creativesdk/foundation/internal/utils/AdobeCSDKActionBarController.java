package com.adobe.creativesdk.foundation.internal.utils;

import android.view.View;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.auth.R.id;

public class AdobeCSDKActionBarController
{
  public static void changeTextColor(View paramView, int paramInt)
  {
    paramView = (TextView)paramView.findViewById(R.id.actionbar_title);
    if (paramView != null) {
      paramView.setTextColor(paramInt);
    }
  }
  
  public static View getTextView(View paramView)
  {
    return paramView.findViewById(R.id.actionbar_title);
  }
  
  public static void setTitle(View paramView, String paramString)
  {
    paramView = (TextView)paramView.findViewById(R.id.actionbar_title);
    if (paramView != null) {
      paramView.setText(paramString);
    }
  }
  
  public static void setTitleWithColor(View paramView, String paramString, int paramInt)
  {
    paramView = (TextView)paramView.findViewById(R.id.actionbar_title);
    if (paramView != null)
    {
      paramView.setTextColor(paramInt);
      paramView.setText(paramString);
    }
  }
}
