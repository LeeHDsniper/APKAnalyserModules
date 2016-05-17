package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextPaint;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class GuideBindPhoneActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener
{
  TextView jdField_a_of_type_AndroidWidgetTextView;
  String jdField_a_of_type_JavaLangString;
  TextView b;
  
  public GuideBindPhoneActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "http://kf.qq.com/touch/faq/120307IVnEni150407eEv2IF.html?platform=14&_wv=0";
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130903366);
    b = ((TextView)findViewById(2131298260));
    setTitle("手机通讯录", getString(2131369558));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298261));
    jdField_a_of_type_AndroidWidgetTextView.getPaint().setFlags(8);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    float f = FontSettingManager.a();
    if (f > 17.0F)
    {
      paramBundle = (ImageView)findViewById(2131298258);
      RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)paramBundle.getLayoutParams();
      topMargin /= (int)(f - 16.0F);
      paramBundle.setLayoutParams(localLayoutParams);
    }
    return true;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent(this, QQBrowserActivity.class);
    paramView.putExtra("hide_more_button", true);
    paramView.putExtra("hide_operation_bar", true);
    paramView.putExtra("url", jdField_a_of_type_JavaLangString);
    startActivity(paramView);
    ReportController.b(app, "CliOper", "", "", "0X80053DA", "0X80053DA", 0, 0, "", "", "", "");
  }
}
