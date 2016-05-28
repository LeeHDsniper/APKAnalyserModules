package com.adobe.creativesdk.aviary.dialogs;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;

public class FeedBackDialogFragment
  extends DialogFragment
  implements View.OnClickListener
{
  public FeedBackDialogFragment() {}
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == R.id.button1)
    {
      paramView = new Intent("android.intent.action.VIEW");
      paramView.setData(Uri.parse("http://support.aviary.com/"));
      startActivity(paramView);
      return;
    }
    dismiss();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(1, 0);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_feedback_dialog, paramViewGroup, false);
    paramLayoutInflater.findViewById(R.id.button1).setOnClickListener(this);
    ((TextView)paramLayoutInflater.findViewById(16908308)).setText(getString(R.string.feather_version) + " " + "4.1.1");
    return paramLayoutInflater;
  }
}
