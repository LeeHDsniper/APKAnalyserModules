package com.tencent.mobileqq.activity.selectmember;

import android.os.Bundle;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mnp;

public class SelectMemberForReadJoyActivity
  extends SelectMemberActivity
{
  public static final String a = "RESULT_UINS";
  
  public SelectMemberForReadJoyActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    TextView localTextView = (TextView)findViewById(2131297081);
    if (localTextView != null)
    {
      localTextView.setOnClickListener(null);
      localTextView.setOnClickListener(new mnp(this));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    c();
  }
}
