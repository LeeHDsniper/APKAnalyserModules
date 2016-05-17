package com.tencent.mobileqq.activity.phone;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PhoneFrame
  extends PhoneInnerFrame
{
  private BaseActivityView.IPhoneContext a;
  
  public PhoneFrame(Context paramContext)
  {
    super(paramContext);
  }
  
  public PhoneFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public PhoneFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected BaseActivityView.IPhoneContext a()
  {
    return a;
  }
  
  public void f()
  {
    a().finish();
  }
  
  public void setPhoneContext(BaseActivityView.IPhoneContext paramIPhoneContext)
  {
    a = paramIPhoneContext;
  }
}
