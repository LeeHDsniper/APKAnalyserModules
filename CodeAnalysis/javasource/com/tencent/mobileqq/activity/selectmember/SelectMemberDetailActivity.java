package com.tencent.mobileqq.activity.selectmember;

import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SelectMemberDetailActivity
  extends BaseActivity
  implements View.OnClickListener
{
  public SelectMemberDetailActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    boolean bool = super.doOnCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(2130904784);
    paramBundle = (TextView)findViewById(2131297034);
    paramBundle.setText(2131371354);
    TextView localTextView = (TextView)findViewById(2131297035);
    localTextView.setText(2131369858);
    localTextView.setOnClickListener(this);
    ((TextView)findViewById(2131298879)).setText(Html.fromHtml(getString(2131369867)));
    if (AppSetting.i)
    {
      paramBundle.setContentDescription(getString(2131369878));
      localTextView.setContentDescription(getString(2131369877));
    }
    return bool;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    onBackPressed();
  }
}
