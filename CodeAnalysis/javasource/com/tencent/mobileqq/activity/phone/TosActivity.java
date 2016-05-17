package com.tencent.mobileqq.activity.phone;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ProtectedWebView;
import lzr;

public class TosActivity
  extends IphoneTitleBarActivity
{
  private static final int jdField_a_of_type_Int = 1;
  public static final String a = "frombusiness";
  private static final int jdField_b_of_type_Int = 2;
  private static final String jdField_b_of_type_JavaLangString = "key_file";
  private static final String c = "file:///android_asset/phone_tos.html";
  private static final String d = "file:///android_asset/business_tos.html";
  private static final String e = "file:///android_asset/phone_tos.html";
  private ProtectedWebView jdField_a_of_type_ComTencentWidgetProtectedWebView;
  
  public TosActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static void a(Context paramContext)
  {
    paramContext.startActivity(new Intent(paramContext, TosActivity.class));
  }
  
  public static void b(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, TosActivity.class);
    localIntent.putExtra("key_file", 2);
    paramContext.startActivity(localIntent);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    a = new ProtectedWebView(BaseApplicationImpl.a);
    a.setFadingEdgeLength(0);
    if (VersionUtils.c()) {
      a.setOverScrollMode(2);
    }
    setContentView(a);
    removeWebViewLayerType();
    setTitle("服务声明");
    if (getIntent().getIntExtra("key_file", 1) == 2) {}
    paramBundle = getIntent();
    if (paramBundle != null) {
      if (paramBundle.getIntExtra("frombusiness", 1) == 0) {
        a.loadUrl("file:///android_asset/business_tos.html");
      }
    }
    for (;;)
    {
      a.setOnLongClickListener(new lzr(this));
      return true;
      a.loadUrl("file:///android_asset/phone_tos.html");
      continue;
      a.loadUrl("file:///android_asset/phone_tos.html");
    }
  }
  
  protected void doOnDestroy()
  {
    setContentView(new TextView(this));
    try
    {
      a.stopLoading();
      try
      {
        a.clearView();
        try
        {
          a.destroy();
          super.doOnDestroy();
          return;
        }
        catch (Exception localException1)
        {
          for (;;) {}
        }
      }
      catch (Exception localException2)
      {
        for (;;) {}
      }
    }
    catch (Exception localException3)
    {
      for (;;) {}
    }
  }
}
