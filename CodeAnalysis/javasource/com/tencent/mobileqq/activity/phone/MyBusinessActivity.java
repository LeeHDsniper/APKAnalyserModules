package com.tencent.mobileqq.activity.phone;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import android.widget.TextView;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.ui.TouchWebView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import lza;

public class MyBusinessActivity
  extends PublicAccountBrowser
{
  public static final int a = 2;
  public static final String a = "MyBusinessActivity_NeedRefreshPage";
  
  public MyBusinessActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static void a(Activity paramActivity, String paramString)
  {
    Intent localIntent = new Intent(paramActivity, MyBusinessActivity.class);
    localIntent.putExtra("hide_operation_bar", true);
    localIntent.putExtra("title", paramActivity.getString(2131370916));
    localIntent.putExtra("url", paramString);
    localIntent.putExtra("hideRightButton", true);
    paramActivity.startActivity(localIntent);
  }
  
  public static void i(boolean paramBoolean)
  {
    PreferenceManager.getDefaultSharedPreferences(BaseApplicationImpl.a()).edit().putBoolean("MyBusinessActivity_NeedRefreshPage", paramBoolean).commit();
  }
  
  public void h(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      rightViewText.setVisibility(0);
      rightViewText.setText("更改手机");
      rightViewText.setOnClickListener(new lza(this));
      return;
    }
    rightViewText.setVisibility(8);
    rightViewText.setText("");
    rightViewText.setOnClickListener(null);
  }
  
  public boolean isWrapContent()
  {
    return false;
  }
  
  protected void onRestart()
  {
    super.onRestart();
    if (PreferenceManager.getDefaultSharedPreferences(BaseApplicationImpl.a()).getBoolean("MyBusinessActivity_NeedRefreshPage", false))
    {
      if (a != null) {
        a.reload();
      }
      i(false);
    }
  }
}
