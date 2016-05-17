package com.tencent.mobileqq.activity.selectmember;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import com.tencent.av.utils.PstnUtils;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.qcall.PstnCardInfo;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.PstnObserver;
import com.tencent.mobileqq.search.model.ContactSearchModelCircleBuddy;
import com.tencent.mobileqq.search.model.ContactSearchModelDiscussionMember;
import com.tencent.mobileqq.search.model.ContactSearchModelFriend;
import com.tencent.mobileqq.search.model.ContactSearchModelPhoneContact;
import com.tencent.mobileqq.search.model.IContactSearchModel;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.TipsBar;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import mlf;
import mlg;
import mll;
import mlm;
import mln;
import mlo;
import mlp;
import mlq;

public class PhoneContactSelectActivity
  extends SelectMemberActivity
  implements View.OnClickListener
{
  public static final int a = 0;
  static final String jdField_a_of_type_JavaLangString = "PhoneContactSelectActivity";
  public static final int b = 1;
  public static final String b = "param_ip_pstn_enter_type";
  public static final int c = 2;
  public static final String c = "param_uin_create_list";
  static final int jdField_d_of_type_Int = 0;
  public static final String d = "param_uin_selected_list";
  static final int jdField_e_of_type_Int = 1;
  public static final String e = "param_uin_selected_default_contact";
  public static final int f = 2;
  public static final String f = "param_uin_selected_default_friends";
  public static final int g = 3;
  public static final String g = "param_uin_divider_list";
  public static final String h = "param_divider_title";
  public static final String i = "param_no_answer_list_default_selected";
  public static final String j = "param_ui_flag";
  public static final String k = "param_show_none_friends_in_contact";
  public static final String l = "param_phone_list";
  public PstnObserver a;
  TipsBar jdField_a_of_type_ComTencentMobileqqWidgetTipsBar;
  Thread jdField_a_of_type_JavaLangThread;
  public ArrayList a;
  public boolean a;
  TipsBar jdField_b_of_type_ComTencentMobileqqWidgetTipsBar;
  public ArrayList b;
  boolean jdField_b_of_type_Boolean;
  public ArrayList c;
  boolean c;
  public ArrayList d;
  boolean jdField_d_of_type_Boolean;
  public ArrayList e;
  boolean jdField_e_of_type_Boolean;
  public ArrayList f;
  boolean f;
  public ArrayList g;
  boolean g;
  int h;
  int i;
  public String m;
  
  public PhoneContactSelectActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_e_of_type_Boolean = false;
    jdField_f_of_type_Boolean = false;
    jdField_g_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqQcallPstnObserver = null;
    jdField_a_of_type_JavaLangThread = new mlq(this);
  }
  
  public static void a(Activity paramActivity, boolean paramBoolean)
  {
    if (paramActivity == null)
    {
      QLog.i("PhoneContactSelectActivity", 1, "=== openPhoneContactSelectActivity mActivity is null");
      return;
    }
    Intent localIntent = new Intent(paramActivity, PhoneContactSelectActivity.class);
    localIntent.putExtra("param_ui_flag", 0);
    localIntent.putExtra("param_type", 3000);
    localIntent.putExtra("param_subtype", 0);
    localIntent.putExtra("param_entrance", 10);
    localIntent.putExtra("param_from", 1003);
    localIntent.putExtra("param_done_button_wording", paramActivity.getString(2131368994));
    localIntent.putExtra("param_done_button_highlight_wording", paramActivity.getString(2131369876));
    localIntent.putExtra("param_max", 49);
    localIntent.putExtra("param_exit_animation", 1);
    localIntent.putExtra("param_back_button_side", 0);
    localIntent.putExtra("key_is_from_web", paramBoolean);
    localIntent.setFlags(603979776);
    paramActivity.startActivityForResult(localIntent, 1400);
    paramActivity.overridePendingTransition(2130968590, 2130968591);
  }
  
  private boolean e()
  {
    Iterator localIterator = j.iterator();
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
    } while (nextjdField_a_of_type_Int == 5);
    for (int n = 1;; n = 0)
    {
      if ((jdField_a_of_type_AndroidContentIntent != null) && (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("ShowJoinDiscTips", false)) && (n != 0))
      {
        DialogUtil.a(this, 230, getString(2131363425), getString(2131367976), 2131363432, 2131363433, new mlm(this), new mln(this)).show();
        return true;
      }
      return false;
    }
  }
  
  private boolean f()
  {
    boolean bool2 = true;
    if (j.size() == 0) {
      return false;
    }
    boolean bool1 = bool2;
    if (jdField_d_of_type_JavaUtilArrayList.size() <= j.size())
    {
      bool1 = bool2;
      if (Z != null)
      {
        Iterator localIterator = jdField_d_of_type_JavaUtilArrayList.iterator();
        for (bool1 = true; localIterator.hasNext(); bool1 = false)
        {
          ResultRecord localResultRecord = (ResultRecord)localIterator.next();
          bool1 = bool2;
          if (!j.contains(localResultRecord)) {
            break;
          }
        }
      }
    }
    return bool1;
  }
  
  private boolean g()
  {
    if (j.size() == 0) {}
    while (jdField_d_of_type_JavaUtilArrayList.size() != j.size()) {
      return false;
    }
    Iterator localIterator = jdField_d_of_type_JavaUtilArrayList.iterator();
    for (boolean bool = false;; bool = true)
    {
      if (!localIterator.hasNext()) {
        return bool;
      }
      ResultRecord localResultRecord = (ResultRecord)localIterator.next();
      if (!j.contains(localResultRecord)) {
        break;
      }
    }
    return bool;
  }
  
  protected ArrayList a()
  {
    ArrayList localArrayList = new ArrayList();
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)app.getManager(10);
    Iterator localIterator = j.iterator();
    while (localIterator.hasNext())
    {
      ResultRecord localResultRecord = (ResultRecord)localIterator.next();
      if (jdField_a_of_type_Int == 5)
      {
        if (jdField_a_of_type_JavaLangString.startsWith("pstn")) {
          jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaLangString.substring("pstn".length());
        }
        localArrayList.add(localResultRecord);
      }
      else
      {
        PhoneContact localPhoneContact = localPhoneContactManager.a(jdField_a_of_type_JavaLangString);
        if ((localPhoneContact != null) && (jdField_f_of_type_JavaUtilArrayList.contains(mobileNo))) {
          localArrayList.add(localResultRecord);
        }
      }
    }
    return localArrayList;
  }
  
  protected void a()
  {
    setContentView(2130903427);
  }
  
  public void a(View paramView)
  {
    IContactSearchModel localIContactSearchModel = (IContactSearchModel)paramView.getTag(2131296476);
    if (localIContactSearchModel == null) {}
    label732:
    for (;;)
    {
      return;
      Object localObject1 = localIContactSearchModel.a();
      paramView = localIContactSearchModel.a().toString();
      Object localObject2 = "";
      if ((localIContactSearchModel instanceof ContactSearchModelDiscussionMember)) {
        ((ContactSearchModelDiscussionMember)localIContactSearchModel).e();
      }
      Object localObject3;
      if ((localIContactSearchModel instanceof ContactSearchModelPhoneContact))
      {
        if (a())
        {
          DialogUtil.a(this, PstnUtils.a(app, 2), PstnUtils.b(app, 2), PstnUtils.c(app, 2), new mlo(this), getString(2131363870), new mlp(this)).show();
          return;
        }
        localObject2 = a;
        if (TextUtils.isEmpty(uin))
        {
          localObject1 = "pstn" + mobileNo;
          paramView = mobileNo;
          localObject3 = name;
          localObject2 = paramView;
          paramView = (View)localObject3;
        }
      }
      for (;;)
      {
        if (((jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.contains(localObject1))) || (a((String)localObject1)) || (d()) || (a((String)localObject1, paramView))) {
          break label732;
        }
        localObject3 = (ContactFriendInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView();
        if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 1) {
          if ((localIContactSearchModel instanceof ContactSearchModelDiscussionMember)) {
            j.add(a((String)localObject1, paramView, 2, ((ContactFriendInnerFrame)localObject3).a()));
          }
        }
        for (;;)
        {
          o();
          i();
          ((ContactFriendInnerFrame)localObject3).f();
          a(true);
          jdField_a_of_type_AndroidWidgetEditText.setText("");
          return;
          if (uin.equals("0"))
          {
            paramView = nationCode + mobileCode;
            localObject1 = paramView;
            break;
          }
          localObject1 = uin;
          paramView = mobileNo;
          break;
          if ((localIContactSearchModel instanceof ContactSearchModelFriend)) {
            j.add(a((String)localObject1, paramView, 0, "-1"));
          } else if ((localIContactSearchModel instanceof ContactSearchModelCircleBuddy)) {
            j.add(a((String)localObject1, paramView, 3, "-1"));
          } else if ((localIContactSearchModel instanceof ContactSearchModelPhoneContact)) {
            if ((((String)localObject1).startsWith("pstn")) && (b((String)localObject1, paramView, 5, "-1")))
            {
              j.add(a((String)localObject1, paramView, 5, "-1", (String)localObject2));
            }
            else if (((String)localObject1).startsWith("+"))
            {
              j.add(a((String)localObject1, paramView, 4, "-1"));
            }
            else
            {
              j.add(a((String)localObject1, paramView, 0, "-1"));
              continue;
              if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 2) {
                j.add(a((String)localObject1, paramView, 1, ((ContactFriendInnerFrame)localObject3).a()));
              } else if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 3) {
                j.add(a((String)localObject1, paramView, 2, ((ContactFriendInnerFrame)localObject3).a()));
              } else if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 0) {
                if ((localIContactSearchModel instanceof ContactSearchModelPhoneContact))
                {
                  if (((String)localObject1).startsWith("pstn"))
                  {
                    if (b((String)localObject1, paramView, 5, "-1")) {
                      j.add(a((String)localObject1, paramView, 5, "-1", (String)localObject2));
                    }
                  }
                  else if (((String)localObject1).startsWith("+")) {
                    j.add(a((String)localObject1, paramView, 4, "-1", (String)localObject2));
                  } else {
                    j.add(a((String)localObject1, paramView, 0, "-1", (String)localObject2));
                  }
                }
                else if ((localIContactSearchModel instanceof ContactSearchModelFriend)) {
                  j.add(a((String)localObject1, paramView, 0, "-1", (String)localObject2));
                }
              }
            }
          }
        }
      }
    }
  }
  
  public boolean a()
  {
    if (L == 10)
    {
      if ((jdField_f_of_type_Boolean) || (jdField_e_of_type_Boolean) || (h == 2)) {}
    }
    else {
      while (((L == 17) || (L == 20) || (L == 19) || (L == 18)) && (!jdField_f_of_type_Boolean) && (h != 2)) {
        return true;
      }
    }
    return false;
  }
  
  protected void b()
  {
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(this);
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.setAppIntf(app);
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
  }
  
  protected void c()
  {
    jdField_a_of_type_ComTencentMobileqqQcallPstnObserver = new mlf(this);
    if (app != null) {
      app.a(jdField_a_of_type_ComTencentMobileqqQcallPstnObserver);
    }
  }
  
  protected void d()
  {
    super.d();
    h = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_ui_flag", 0);
    jdField_a_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uins_selected_default");
    jdField_b_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uin_selected_default_contact");
    c = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uin_selected_default_friends");
    jdField_d_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getParcelableArrayListExtra("param_uin_selected_list");
    jdField_e_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getParcelableArrayListExtra("param_uin_create_list");
    jdField_f_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uin_divider_list");
    m = jdField_a_of_type_AndroidContentIntent.getStringExtra("param_divider_title");
    i = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_ip_pstn_enter_type", 2);
    jdField_a_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_no_answer_list_default_selected", true);
    jdField_b_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_show_none_friends_in_contact", true);
    jdField_g_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_phone_list");
    jdField_g_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("key_is_from_web", false);
    if (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("NEED_CLOSE_WHEN_PSTN_CLOSE", false)) {
      c();
    }
    if (h == 0)
    {
      Object localObject = (PstnManager)app.getManager(142);
      if (localObject != null)
      {
        localObject = ((PstnManager)localObject).a(app.a());
        if ((localObject != null) && (pstn_ever_c2c_vip == 0) && (pstn_ever_multi_vip == 0) && (!PstnUtils.a(app, 2)) && (!PstnUtils.a(app, 1))) {
          h = 2;
        }
      }
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    if (jdField_d_of_type_JavaUtilArrayList != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter.a(jdField_d_of_type_JavaUtilArrayList);
      a(true);
      o();
      i();
    }
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqQcallPstnObserver != null)
    {
      app.b(jdField_a_of_type_ComTencentMobileqqQcallPstnObserver);
      jdField_a_of_type_ComTencentMobileqqQcallPstnObserver = null;
    }
  }
  
  protected void e()
  {
    super.e();
    jdField_e_of_type_Boolean = PstnUtils.a(app, 1);
    jdField_f_of_type_Boolean = PstnUtils.a(app, 2);
    jdField_a_of_type_ComTencentMobileqqWidgetTipsBar = ((TipsBar)findViewById(2131298511));
    jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setOnClickListener(this);
    if (a()) {
      jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setVisibility(0);
    }
    for (;;)
    {
      jdField_b_of_type_ComTencentMobileqqWidgetTipsBar = ((TipsBar)findViewById(2131298510));
      jdField_b_of_type_ComTencentMobileqqWidgetTipsBar.a(false);
      return;
      jdField_a_of_type_ComTencentMobileqqWidgetTipsBar.setVisibility(8);
    }
  }
  
  protected void f()
  {
    super.f();
    jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(new mlg(this));
  }
  
  protected void g()
  {
    jdField_a_of_type_AndroidWidgetEditText.setOnFocusChangeListener(new mll(this));
  }
  
  public void h()
  {
    switch (I)
    {
    default: 
      jdField_a_of_type_AndroidContentIntent.putParcelableArrayListExtra("result_set", j);
      ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(getWindow().peekDecorView().getWindowToken(), 0);
      setResult(-1, jdField_a_of_type_AndroidContentIntent);
      finish();
      return;
    }
    Object localObject2;
    ResultRecord localResultRecord;
    if (s)
    {
      localObject1 = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (String)((Iterator)localObject1).next();
        localResultRecord = new ResultRecord();
        jdField_a_of_type_JavaLangString = ((String)localObject2);
        jdField_a_of_type_Int = 0;
        c = "-1";
        j.add(localResultRecord);
      }
    }
    if (jdField_e_of_type_JavaUtilArrayList != null)
    {
      localObject1 = jdField_e_of_type_JavaUtilArrayList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (ResultRecord)((Iterator)localObject1).next();
        if (!j.contains(localObject2)) {
          j.add(localObject2);
        }
      }
    }
    int i3 = j.size();
    Object localObject1 = j.iterator();
    int i2 = 0;
    int i1 = 0;
    label244:
    int n;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (ResultRecord)((Iterator)localObject1).next();
      if ((jdField_a_of_type_Int == 5) || (jdField_a_of_type_Int == 4) || (jdField_a_of_type_Int == 0))
      {
        if ((d == null) || (d.equals("")) || (i2 != 0)) {
          break label1032;
        }
        n = 1;
      }
    }
    for (;;)
    {
      i2 = n;
      break label244;
      if (i1 == 0)
      {
        n = i2;
        i1 = 1;
        continue;
        if (((J == 0) && (i3 == 1) && (L == 10)) || ((L == 17) && (i3 == 1)) || ((L == 18) && (i3 == 1) && (TextUtils.isEmpty(Z))))
        {
          if (QLog.isColorLevel()) {
            QLog.d("PhoneContactSelectActivity", 2, "start C2C audio");
          }
          localResultRecord = (ResultRecord)j.get(0);
          n = jdField_a_of_type_Int;
          localObject2 = null;
          if (jdField_a_of_type_Int == 0)
          {
            n = 0;
            localObject1 = localObject2;
            localObject2 = d;
            if ((i2 == 0) || ((PstnUtils.a(app, 2)) && (!PstnUtils.a(app, 1)))) {
              break label739;
            }
            if (QLog.isColorLevel()) {
              QLog.d("PhoneContactSelectActivity", 2, "start c2c call.");
            }
            if (!ChatActivityUtils.a(app, this, n, jdField_a_of_type_JavaLangString, b, (String)localObject2, true, (String)localObject1, true, true, jdField_a_of_type_AndroidOsHandler$Callback, null, 9, true)) {
              break;
            }
            if (!jdField_g_of_type_Boolean) {
              break label700;
            }
            ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 12, 0, "", "", "", "");
          }
          for (;;)
          {
            N = 2;
            finish();
            return;
            if (jdField_a_of_type_Int == 1)
            {
              n = 1000;
              localObject1 = a(j.get(0)).c);
              break;
            }
            if (jdField_a_of_type_Int == 2)
            {
              n = 1004;
              localObject1 = j.get(0)).c;
              break;
            }
            if (jdField_a_of_type_Int == 3)
            {
              n = 1021;
              localObject1 = localObject2;
              break;
            }
            localObject1 = localObject2;
            if (jdField_a_of_type_Int != 4) {
              break;
            }
            n = 1006;
            localObject1 = localObject2;
            break;
            label700:
            ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 1, 0, "", "", "", "");
          }
        }
        label739:
        if (L == 18)
        {
          if (g())
          {
            localObject1 = new Intent();
            ((Intent)localObject1).putExtra("audioType", 2);
            ((Intent)localObject1).putExtra("uinType", 3000);
            ((Intent)localObject1).putExtra("roomId", Z);
            ((Intent)localObject1).putExtra("qqPhoneUserList", jdField_g_of_type_JavaUtilArrayList);
            ((Intent)localObject1).putExtra("from", 3);
            ((Intent)localObject1).putExtra("callType", 2);
            setResult(-1, (Intent)localObject1);
            finish();
            return;
          }
          if (f()) {}
          for (n = 2131367972;; n = 2131367973)
          {
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getResources().getDimensionPixelSize(2131492908));
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(n);
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
            jdField_a_of_type_JavaLangThread.setName("PhoneContactSelectActivity_addDiscussion");
            ThreadManager.a(jdField_a_of_type_JavaLangThread, null, false);
            return;
          }
        }
        if ((J == 0) || (J == 1) || (i1 != 0)) {
          if (J != 0) {
            break label1025;
          }
        }
        label1025:
        for (n = 2131367972;; n = 2131367973)
        {
          jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getResources().getDimensionPixelSize(2131492908));
          jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(n);
          jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
          jdField_a_of_type_JavaLangThread.setName("SelectMemberActivity_addDiscussion");
          ThreadManager.a(jdField_a_of_type_JavaLangThread, null, false);
          if (J == 0) {
            break;
          }
          p();
          if (i1 != 0) {
            break;
          }
          finish();
          return;
        }
      }
      label1032:
      n = i2;
    }
  }
  
  protected boolean onBackEvent()
  {
    switch (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a())
    {
    default: 
      return true;
    case 0: 
      finish();
      return true;
    case 1: 
      n();
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
      return true;
    }
    n();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(1);
    return true;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131298512: 
    default: 
      return;
    case 2131298513: 
      startActivity(new Intent(this, SelectMemberDetailActivity.class));
      return;
    }
    PstnUtils.a(app, this, 2, 1);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
