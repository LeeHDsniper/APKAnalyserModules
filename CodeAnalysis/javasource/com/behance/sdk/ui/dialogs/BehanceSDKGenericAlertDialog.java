package com.behance.sdk.ui.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.os.Bundle;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;

public class BehanceSDKGenericAlertDialog
  extends Dialog
  implements DialogInterface.OnDismissListener
{
  private int contentResourceId;
  private View.OnClickListener notOKBtnClickListener;
  private int notOKBtnLabelResourceId;
  private Button notOKButton;
  private View.OnClickListener okBtnClickListener;
  private int okBtnLabelResourceId;
  private Button okButton;
  private int titleResourceId;
  
  public BehanceSDKGenericAlertDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  public static BehanceSDKGenericAlertDialog getInstance(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramContext = new BehanceSDKGenericAlertDialog(paramContext);
    paramContext.setTitleResourceId(paramInt1);
    paramContext.setContentResourceId(paramInt2);
    paramContext.setOkBtnLabelResourceId(paramInt3);
    paramContext.setNotOKBtnLabelResourceId(paramInt4);
    return paramContext;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(R.layout.bsdk_dialog_generic_alert);
    paramBundle = (TextView)findViewById(R.id.bsdkGenericAlertDialogTitleTxtView);
    if (titleResourceId > 0) {
      paramBundle.setText(titleResourceId);
    }
    paramBundle = (TextView)findViewById(R.id.bsdkGenericAlertDialogBodyTxtView);
    if (contentResourceId > 0) {
      paramBundle.setText(contentResourceId);
    }
    notOKButton = ((Button)findViewById(R.id.bsdkGenericAlertDialogNotOKBtn));
    if (notOKBtnLabelResourceId > 0) {
      notOKButton.setText(notOKBtnLabelResourceId);
    }
    if (notOKBtnClickListener != null) {
      notOKButton.setOnClickListener(notOKBtnClickListener);
    }
    okButton = ((Button)findViewById(R.id.bsdkGenericAlertDialogOKBtn));
    if (okBtnLabelResourceId > 0) {
      okButton.setText(okBtnLabelResourceId);
    }
    if (okBtnClickListener != null) {
      okButton.setOnClickListener(okBtnClickListener);
    }
    setOnDismissListener(this);
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    notOKBtnClickListener = null;
    okBtnClickListener = null;
  }
  
  public void setContentResourceId(int paramInt)
  {
    contentResourceId = paramInt;
  }
  
  public void setNotOKBtnLabelResourceId(int paramInt)
  {
    notOKBtnLabelResourceId = paramInt;
  }
  
  public void setOkBtnLabelResourceId(int paramInt)
  {
    okBtnLabelResourceId = paramInt;
  }
  
  public void setOnNotOKBtnClickListener(View.OnClickListener paramOnClickListener)
  {
    if (notOKButton != null)
    {
      notOKButton.setOnClickListener(paramOnClickListener);
      return;
    }
    notOKBtnClickListener = paramOnClickListener;
  }
  
  public void setOnOKBtnClickListener(View.OnClickListener paramOnClickListener)
  {
    if (okButton != null)
    {
      okButton.setOnClickListener(paramOnClickListener);
      return;
    }
    okBtnClickListener = paramOnClickListener;
  }
  
  public void setTitleResourceId(int paramInt)
  {
    titleResourceId = paramInt;
  }
}
