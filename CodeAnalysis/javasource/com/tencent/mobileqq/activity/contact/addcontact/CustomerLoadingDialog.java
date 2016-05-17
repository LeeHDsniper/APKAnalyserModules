package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CustomerLoadingDialog
  extends Dialog
{
  public CustomerLoadingDialog(Context paramContext)
  {
    super(paramContext, 2131558959);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Object localObject = LayoutInflater.from(getContext()).inflate(2130904316, null);
    paramBundle = getWindow();
    paramBundle.setContentView((View)localObject);
    localObject = paramBundle.getAttributes();
    width = -2;
    height = -2;
    gravity = 48;
    y += getContext().getResources().getDimensionPixelOffset(2131493426);
    paramBundle.setAttributes((WindowManager.LayoutParams)localObject);
    setCanceledOnTouchOutside(false);
  }
}
