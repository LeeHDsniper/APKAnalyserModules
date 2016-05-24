package com.adobe.creativesdk.foundation.internal.common;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.auth.R.id;
import com.adobe.creativesdk.foundation.auth.R.layout;

public class AdobeCommonErrorViewFragment
  extends Fragment
{
  ViewGroup _fragmentContainer = null;
  
  public AdobeCommonErrorViewFragment() {}
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_common_errorview, paramViewGroup, false);
    _fragmentContainer = paramViewGroup;
    return paramLayoutInflater;
  }
  
  public void setMessage(String paramString)
  {
    if (_fragmentContainer != null) {
      ((TextView)_fragmentContainer.findViewById(R.id.adobe_common_view_error_message)).setText(paramString.toCharArray(), 0, paramString.length());
    }
  }
}
