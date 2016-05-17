package com.tencent.biz.widgets;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.text.TextUtils;
import android.view.ViewGroup.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import hca;
import hcb;

public class ShareResultDialog
  extends Dialog
{
  private Context jdField_a_of_type_AndroidContentContext;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ShareResultDialog.IShareResultCallback jdField_a_of_type_ComTencentBizWidgetsShareResultDialog$IShareResultCallback;
  private boolean jdField_a_of_type_Boolean;
  private TextView b;
  private TextView c;
  private TextView d;
  private TextView e;
  
  public ShareResultDialog(Context paramContext)
  {
    super(paramContext, 2131558942);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentBizWidgetsShareResultDialog$IShareResultCallback = null;
    super.setContentView(2130903341);
    jdField_a_of_type_AndroidContentContext = paramContext;
    a();
  }
  
  private void a()
  {
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131297739));
    b = ((TextView)super.findViewById(2131297740));
    c = ((TextView)super.findViewById(2131298128));
    d = ((TextView)super.findViewById(2131298129));
    e = ((TextView)super.findViewById(2131298130));
  }
  
  private void b(boolean paramBoolean)
  {
    int j = 8;
    QLog.i("ShareToQZone", 2, "width:" + jdField_a_of_type_AndroidWidgetTextView.getLayoutParams().width);
    TextView localTextView;
    if (paramBoolean)
    {
      b.setVisibility(0);
      localTextView = d;
      if (!jdField_a_of_type_Boolean) {
        break label126;
      }
      i = 8;
      label65:
      localTextView.setVisibility(i);
      localTextView = c;
      if (!jdField_a_of_type_Boolean) {
        break label131;
      }
      i = 0;
      label86:
      localTextView.setVisibility(i);
      localTextView = e;
      if (!jdField_a_of_type_Boolean) {
        break label137;
      }
    }
    label126:
    label131:
    label137:
    for (int i = j;; i = 0)
    {
      localTextView.setVisibility(i);
      return;
      b.setVisibility(8);
      break;
      i = 0;
      break label65;
      i = 8;
      break label86;
    }
  }
  
  public void a(int paramInt)
  {
    if (d != null) {
      d.setText(paramInt);
    }
  }
  
  public void a(ShareResultDialog.IShareResultCallback paramIShareResultCallback)
  {
    jdField_a_of_type_ComTencentBizWidgetsShareResultDialog$IShareResultCallback = paramIShareResultCallback;
  }
  
  public void a(String paramString)
  {
    if ((d != null) && (!TextUtils.isEmpty(paramString))) {
      d.setText(paramString);
    }
  }
  
  public void a(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_AndroidWidgetTextView.setText(paramString);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(new hca(this, paramOnClickListener));
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public void b(int paramInt)
  {
    if (e != null)
    {
      if (paramInt != 0) {
        e.setText(paramInt);
      }
    }
    else {
      return;
    }
    e.setText("");
  }
  
  public void b(String paramString)
  {
    if ((e != null) && (!TextUtils.isEmpty(paramString))) {
      e.setText(paramString);
    }
  }
  
  public void b(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      b(false);
      return;
    }
    b(true);
    b.setText(paramString);
    b.setOnClickListener(new hcb(this, paramOnClickListener));
  }
  
  public void c(int paramInt)
  {
    if (c != null) {
      c.setText(paramInt);
    }
  }
  
  public void dismiss()
  {
    try
    {
      super.dismiss();
      return;
    }
    catch (Exception localException) {}
  }
  
  public void onBackPressed()
  {
    QLog.i("ShareResultDialog", 2, "onBackPressed");
    super.onBackPressed();
    ShareResultDialog.IShareResultCallback localIShareResultCallback;
    if (jdField_a_of_type_ComTencentBizWidgetsShareResultDialog$IShareResultCallback != null)
    {
      localIShareResultCallback = jdField_a_of_type_ComTencentBizWidgetsShareResultDialog$IShareResultCallback;
      if (b.getVisibility() == 0) {
        break label44;
      }
    }
    label44:
    for (boolean bool = true;; bool = false)
    {
      localIShareResultCallback.a(bool);
      return;
    }
  }
}
