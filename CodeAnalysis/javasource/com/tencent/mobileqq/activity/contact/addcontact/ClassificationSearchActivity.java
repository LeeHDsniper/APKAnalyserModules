package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.os.MessageQueue;
import android.text.Editable;
import android.text.TextUtils;
import android.widget.EditText;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.activity.GroupSearchActivity;
import lqa;
import lqb;

public class ClassificationSearchActivity
  extends SearchBaseActivity
{
  private static SearchResult a;
  
  public ClassificationSearchActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static void a(Activity paramActivity, Intent paramIntent, SearchResult paramSearchResult)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult = paramSearchResult;
    paramActivity.startActivityForResult(paramIntent, 1);
  }
  
  protected SearchBaseFragment a()
  {
    return ClassificationSearchFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult);
  }
  
  protected void a()
  {
    super.a();
    String str;
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult != null)
    {
      str = "";
      switch (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResulta)
      {
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetEditText.setHint(str);
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new lqb(this));
      if (AppSetting.i) {
        jdField_a_of_type_AndroidWidgetEditText.setContentDescription("搜索栏" + d);
      }
      return;
      str = "网络查找人";
      continue;
      str = "网络查找群";
      continue;
      if (GroupSearchActivity.e == 12)
      {
        str = "网络查找" + PublicAccountConfigUtil.a(app, getApplicationContext());
      }
      else
      {
        str = "网络查找公众号";
        continue;
        str = "网络查找相关文章";
      }
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    boolean bool = super.doOnCreate(paramBundle);
    jdField_a_of_type_AndroidWidgetEditText.setText(d);
    if (!TextUtils.isEmpty(d)) {
      jdField_a_of_type_AndroidWidgetEditText.setSelection(jdField_a_of_type_AndroidWidgetEditText.getText().length() - 1);
    }
    return bool;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (((ClassificationSearchFragment)jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment).a())
    {
      Looper.myQueue().addIdleHandler(new lqa(this));
      ((ClassificationSearchFragment)jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment).a(false);
    }
  }
  
  protected void doOnStop()
  {
    super.doOnStop();
    if (((ClassificationSearchFragment)jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment).a()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchBaseFragment.g();
    }
  }
}
