package com.tencent.mobileqq.activity.discussion;

import android.content.res.Resources;
import android.view.View;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import luj;

public class LinkShareActionSheetBuilder
{
  public static final int a = -1;
  private static final String jdField_a_of_type_JavaLangString = "LinkShareDialogBuilder";
  public static final int b = 3;
  public static final int c = 2;
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 4;
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  
  public LinkShareActionSheetBuilder(BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramBaseActivity;
  }
  
  public ActionSheet a(AdapterView.OnItemClickListener paramOnItemClickListener)
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(a, null);
    GridView localGridView = (GridView)View.inflate(a, 2130904892, null);
    localGridView.setBackgroundDrawable(a.getResources().getDrawable(2130837523));
    localGridView.setAdapter(new luj(this, null));
    localGridView.setOnItemClickListener(paramOnItemClickListener);
    localActionSheet.a(localGridView);
    localActionSheet.d(2131366996);
    return localActionSheet;
  }
}
