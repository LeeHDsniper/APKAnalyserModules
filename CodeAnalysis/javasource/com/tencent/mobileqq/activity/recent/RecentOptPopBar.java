package com.tencent.mobileqq.activity.recent;

import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;
import com.dataline.activities.LiteActivity;
import com.tencent.av.camera.QavCameraUsage;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.biz.qrcode.activity.ScannerActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.PopupMenuDialog;
import com.tencent.widget.PopupMenuDialog.MenuItem;
import cooperation.qlink.QQProxyForQlink;
import java.util.ArrayList;
import java.util.List;
import mha;

public class RecentOptPopBar
  implements View.OnClickListener
{
  private static final int jdField_a_of_type_Int = 8;
  private static final String jdField_a_of_type_JavaLangString = "RecentOptPopBar";
  private static final int[] jdField_a_of_type_ArrayOfInt = { 2131370061, 2131370066, 2131370063, 2131370067, 2131370069, 2131370070 };
  private static final int[] b = { 2130838269, 2130838264, 2130838270, 2130838283, 2130838244, 2130838267 };
  private static final int[] c = { 2131362032, 2131362036, 2131362035, 2131362037, 2131362039, 2131362040 };
  public BaseActivity a;
  private PopupMenuDialog jdField_a_of_type_ComTencentWidgetPopupMenuDialog;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public RecentOptPopBar(BaseActivity paramBaseActivity)
  {
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
  }
  
  public void a()
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < jdField_a_of_type_ArrayOfInt.length)
    {
      PopupMenuDialog.MenuItem localMenuItem = new PopupMenuDialog.MenuItem();
      jdField_a_of_type_Int = i;
      jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getString(jdField_a_of_type_ArrayOfInt[i]);
      jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getString(c[i]);
      jdField_b_of_type_Int = b[i];
      localArrayList.add(localMenuItem);
      i += 1;
    }
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog = PopupMenuDialog.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, localArrayList, new mha(this));
  }
  
  public void a(int paramInt)
  {
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, JumpActivity.class);
    localIntent.setData(Uri.parse("mqqapi://wallet/open?src_type=web&viewtype=0&version=1&view=" + paramInt));
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivityForResult(localIntent, -1);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8005ED3", "0X8005ED3", 0, 0, "", "", "", "");
  }
  
  public void a(View paramView, int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_ComTencentWidgetPopupMenuDialog == null) {
      a();
    }
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog.showAsDropDown(paramView, paramInt1, paramInt2);
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentWidgetPopupMenuDialog != null) && (jdField_a_of_type_ComTencentWidgetPopupMenuDialog.isShowing());
  }
  
  public void b()
  {
    if (a()) {
      jdField_a_of_type_ComTencentWidgetPopupMenuDialog.dismiss();
    }
  }
  
  public void c()
  {
    if (QavCameraUsage.b(BaseApplicationImpl.getContext())) {
      return;
    }
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, ScannerActivity.class);
    localIntent.putExtra("from", "Conversation");
    localIntent.putExtra("leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    localIntent.putExtra("selfSet_leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    localIntent.setFlags(67108864);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity(localIntent);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8004077", "0X8004077", 0, 0, "", "", "", "");
  }
  
  protected void d()
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8004075", "0X8004075", 0, 0, "", "", "", "");
    if ((jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.d()) && (jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app.a().g() != 3))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2131363375, 1).b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getResources().getDimensionPixelSize(2131492908));
      return;
    }
    h();
  }
  
  public void e()
  {
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, AddContactsActivity.class);
    localIntent.putExtra("leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    localIntent.putExtra("selfSet_leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity(localIntent);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8004839", "0X8004839", 0, 0, "", "", "", "");
  }
  
  public void f()
  {
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, LiteActivity.class);
    localIntent.putExtra("leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    localIntent.putExtra("selfSet_leftViewText", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367694));
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity(localIntent);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X800483A", "0X800483A", 0, 0, "", "", "", "");
  }
  
  public void g()
  {
    QQProxyForQlink.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 8, null);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X80053AD", "0X80053AD", 0, 0, "", "", "", "");
  }
  
  protected void h()
  {
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, SelectMemberActivity.class);
    localIntent.putExtra("param_type", 3000);
    localIntent.putExtra("param_subtype", 0);
    localIntent.putExtra("param_from", 1003);
    localIntent.putExtra("param_title", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370062));
    localIntent.putExtra("param_done_button_wording", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131368994));
    localIntent.putExtra("param_done_button_highlight_wording", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131369876));
    localIntent.putExtra("param_entrance", 10);
    localIntent.putExtra("param_max", 49);
    localIntent.putExtra("param_exit_animation", 1);
    localIntent.putExtra("param_back_button_side", 0);
    localIntent.setFlags(603979776);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivityForResult(localIntent, 1400);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.overridePendingTransition(2130968590, 2130968591);
  }
  
  public void i()
  {
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, SelectMemberActivity.class);
    localIntent.putExtra("param_type", 3000);
    localIntent.putExtra("param_subtype", 0);
    localIntent.putExtra("param_from", 1003);
    localIntent.putExtra("param_title", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131370061));
    localIntent.putExtra("param_done_button_wording", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131369840));
    localIntent.putExtra("param_done_button_highlight_wording", jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131369841));
    localIntent.putExtra("param_max", 49);
    localIntent.putExtra("multi_chat", true);
    localIntent.putExtra("param_exit_animation", 0);
    localIntent.putExtra("param_back_button_side", 0);
    localIntent.setFlags(603979776);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivityForResult(localIntent, 1300);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.overridePendingTransition(2130968592, 2130968593);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppBaseActivity.app, "CliOper", "", "", "0X8004074", "0X8004074", 0, 0, "", "", "", "");
  }
  
  public void j()
  {
    if (jdField_a_of_type_ComTencentWidgetPopupMenuDialog != null) {
      jdField_a_of_type_ComTencentWidgetPopupMenuDialog.a();
    }
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog.dismiss();
  }
}
