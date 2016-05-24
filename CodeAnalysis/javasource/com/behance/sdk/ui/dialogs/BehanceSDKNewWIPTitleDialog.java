package com.behance.sdk.ui.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;

public class BehanceSDKNewWIPTitleDialog
  extends Dialog
  implements View.OnClickListener
{
  private Callbacks callbacks;
  private EditText wipTitleEditText;
  
  public BehanceSDKNewWIPTitleDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  public static BehanceSDKNewWIPTitleDialog getInstance(Context paramContext, Callbacks paramCallbacks)
  {
    paramContext = new BehanceSDKNewWIPTitleDialog(paramContext);
    paramContext.setCallbacks(paramCallbacks);
    return paramContext;
  }
  
  private void handleOKButtonClick()
  {
    String str = wipTitleEditText.getText().toString().trim();
    if (str.length() > 0)
    {
      if (callbacks != null) {
        callbacks.onNewWIPTitleDialogOKBtnClicked(str);
      }
      dismiss();
    }
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (i == R.id.bsdkNewWIPTitleDialogNotOKBtn) {
      dismiss();
    }
    while (i != R.id.bsdkNewWIPTitleDialogOKBtn) {
      return;
    }
    handleOKButtonClick();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(R.layout.bsdk_dialog_fragment_new_wip_title);
    setCancelable(true);
    wipTitleEditText = ((EditText)findViewById(R.id.bsdkNewWIPTitleDialogContentEditTxt));
    findViewById(R.id.bsdkNewWIPTitleDialogNotOKBtn).setOnClickListener(this);
    findViewById(R.id.bsdkNewWIPTitleDialogOKBtn).setOnClickListener(this);
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onNewWIPTitleDialogOKBtnClicked(String paramString);
  }
}
