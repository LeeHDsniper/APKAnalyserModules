package com.tencent.mobileqq.activity.recent;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.ClipData;
import android.content.ClipData.Item;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.gaudio.AVPhoneUserInfo;
import com.tencent.av.gaudio.AVPhoneUserInfo.TelInfo;
import com.tencent.av.utils.PstnUtils;
import com.tencent.mobileqq.activity.C2CCallToGroupCall;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phone.PhoneNumberUtil;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.t9search.T9KeyBoard;
import com.tencent.mobileqq.t9search.T9KeyBoard.onKeyClickListener;
import com.tencent.mobileqq.t9search.T9SearchResultAdapter;
import com.tencent.mobileqq.t9search.T9SearchableData;
import com.tencent.mobileqq.utils.CustomHandler;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.ListView;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mhb;
import mhc;
import mhd;
import mhe;
import mhf;
import mhg;
import mhh;
import mhi;
import mhj;
import mqq.os.MqqHandler;

public class RecentT9SearchActivity
  extends FragmentActivity
  implements View.OnClickListener, T9KeyBoard.onKeyClickListener, AbsListView.OnScrollListener
{
  public static final int a = 10;
  public static final String a = "key_is_from_try";
  private static final int jdField_b_of_type_Int = 0;
  public static final String b = "key_is_from_web";
  private static final int jdField_c_of_type_Int = 1;
  private static final String f = "RecentT9SearchActivity";
  protected Handler.Callback a;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private C2CCallToGroupCall jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall;
  private T9KeyBoard jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard;
  public T9SearchResultAdapter a;
  private ListView jdField_a_of_type_ComTencentWidgetListView;
  public List a;
  public MqqHandler a;
  private boolean jdField_a_of_type_Boolean;
  protected Handler.Callback b;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private boolean jdField_b_of_type_Boolean;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  public String c;
  private TextView d;
  public String d;
  private TextView e;
  public String e;
  private String g;
  
  public RecentT9SearchActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler$Callback = new mhb(this);
    jdField_b_of_type_AndroidOsHandler$Callback = new mhc(this);
    jdField_a_of_type_MqqOsMqqHandler = new CustomHandler(Looper.getMainLooper(), jdField_a_of_type_AndroidOsHandler$Callback);
    jdField_a_of_type_AndroidViewView$OnClickListener = new mhd(this);
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  private int a(String paramString)
  {
    switch (PstnUtils.a(paramString, true))
    {
    case 0: 
    default: 
      return 0;
    case -1: 
      return 2131369869;
    case 1: 
      return 2131369870;
    case 2: 
      return 2131369871;
    case 3: 
      return 2131369872;
    case 4: 
      return 2131369873;
    case 5: 
      return 2131369874;
    }
    return 2131369875;
  }
  
  private String a(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 0;
      if (i < paramString.length())
      {
        if ((i == 0) && (paramString.charAt(0) == '+')) {
          localStringBuilder.append('+');
        }
        for (;;)
        {
          i += 1;
          break;
          if (Character.isDigit(paramString.charAt(i))) {
            localStringBuilder.append(paramString.charAt(i));
          }
        }
      }
      return localStringBuilder.toString();
    }
    return "";
  }
  
  private void a(View paramView)
  {
    ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
  }
  
  private void a(T9SearchableData paramT9SearchableData)
  {
    if (paramT9SearchableData == null) {}
    label511:
    label591:
    label768:
    label879:
    for (;;)
    {
      return;
      boolean bool2 = true;
      if (QLog.isColorLevel()) {
        QLog.d("RecentT9SearchActivity", 2, "startCall|" + paramT9SearchableData);
      }
      g = e;
      boolean bool1;
      if (o == 0)
      {
        bool1 = ChatActivityUtils.a(app, this, 0, h, paramT9SearchableData.b(), e, true, null, true, true, jdField_b_of_type_AndroidOsHandler$Callback, null, 5, true);
        if (jdField_b_of_type_Boolean)
        {
          ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 13, 0, "", "", "", "");
          if (j == 4) {
            b(jdField_a_of_type_AndroidWidgetEditText.getText().toString());
          }
          if (bool1)
          {
            if (!TextUtils.isEmpty(g)) {
              SharedPreUtils.c(this, app.a(), g);
            }
            jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.a();
          }
          if (j != 1) {
            break label768;
          }
          ReportController.b(app, "CliOper", "", "", "0X80063F2", "0X80063F2", 3, 0, "", "", "", "");
        }
      }
      for (;;)
      {
        if (!jdField_b_of_type_Boolean) {
          break label879;
        }
        finish();
        return;
        ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 8, 0, "", "", "", "");
        break;
        Object localObject1;
        Object localObject2;
        if ((o == 1006) || (o == 56938) || (o == 2016))
        {
          localObject1 = new PstnSessionInfo();
          jdField_a_of_type_Int = o;
          jdField_a_of_type_JavaLangString = paramT9SearchableData.a();
          b = e;
          if ((b == null) && (jdField_a_of_type_JavaLangString != null) && (a(jdField_a_of_type_JavaLangString) == 0)) {
            b = jdField_a_of_type_JavaLangString;
          }
          jdField_d_of_type_JavaLangString = paramT9SearchableData.b();
          localObject2 = ((PhoneContactManager)app.getManager(10)).a();
          jdField_c_of_type_JavaLangString = (nationCode + mobileNo);
          if ((!PstnUtils.a(app, 1)) && (PstnUtils.a(app, 2)))
          {
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall = new C2CCallToGroupCall();
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall.a(app, this, getIntent(), getActivity(), jdField_c_of_type_JavaLangString, jdField_a_of_type_JavaLangString, jdField_d_of_type_JavaLangString, jdField_a_of_type_Int, b, 4);
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall.a(this, true);
            bool1 = true;
            if (!jdField_b_of_type_Boolean) {
              break label591;
            }
            ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 13, 0, "", "", "", "");
          }
          for (;;)
          {
            ReportController.b(app, "CliOper", "", "", "0X80063F2", "0X80063F2", 3, 0, "", "", "", "");
            break;
            bool1 = ChatActivityUtils.a(app, this, (PstnSessionInfo)localObject1, 5);
            break label511;
            ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 8, 0, "", "", "", "");
          }
        }
        bool1 = bool2;
        if (o != 3000) {
          break;
        }
        if (!TextUtils.isEmpty(i))
        {
          localObject1 = new ArrayList();
          localObject2 = PstnUtils.a(i);
          if (localObject2 != null)
          {
            localObject2 = ((ArrayList)localObject2).iterator();
            while (((Iterator)localObject2).hasNext()) {
              ((ArrayList)localObject1).add(nexttelInfo.mobile);
            }
          }
          ChatActivityUtils.a(app, this, o, h, true, true, true, null, (ArrayList)localObject1, 2, 3);
          bool1 = bool2;
          break;
        }
        ChatActivityUtils.a(app, this, o, h, true, true, true, null, null, 2, 3);
        bool1 = bool2;
        break;
        if (j == 3)
        {
          if (o == 0) {
            ReportController.b(app, "CliOper", "", "", "0X80063F2", "0X80063F2", 2, 0, "", "", "", "");
          } else {
            ReportController.b(app, "CliOper", "", "", "0X80063F2", "0X80063F2", 1, 0, "", "", "", "");
          }
        }
        else if (j == 2) {
          ReportController.b(app, "CliOper", "", "", "0X80063F2", "0X80063F2", 4, 0, "", "", "", "");
        }
      }
    }
  }
  
  private void b(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      paramString = SharedPreUtils.a(this, app.a());
      if (!TextUtils.isEmpty(paramString)) {
        jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setString(paramString);
      }
      if (QLog.isColorLevel()) {
        QLog.d("RecentT9SearchActivity", 2, "startCall|phoneNumber is empty.");
      }
    }
    for (;;)
    {
      return;
      paramString = paramString.replace("-", "").replace(" ", "");
      int i = a(paramString);
      if (QLog.isColorLevel()) {
        QLog.d("RecentT9SearchActivity", 2, "startCall|result:" + i);
      }
      if (i != 0) {
        QQToast.a(this, 0, i, 0).a();
      }
      while (jdField_b_of_type_Boolean)
      {
        finish();
        return;
        Object localObject = (PhoneContactManager)app.getManager(10);
        PstnSessionInfo localPstnSessionInfo = new PstnSessionInfo();
        RespondQueryQQBindingStat localRespondQueryQQBindingStat = ((PhoneContactManager)localObject).a();
        if (localRespondQueryQQBindingStat != null) {
          jdField_c_of_type_JavaLangString = (nationCode + mobileNo);
        }
        if (((jdField_c_of_type_JavaLangString != null) && (jdField_c_of_type_JavaLangString.equals(paramString))) || ((localRespondQueryQQBindingStat != null) && (mobileNo.equals(paramString))))
        {
          QQToast.a(this, 2131363895, 0).b(getResources().getDimensionPixelSize(2131492908));
          return;
        }
        localObject = ((PhoneContactManager)localObject).b(paramString);
        if (localObject != null) {
          if ((!TextUtils.isEmpty(uin)) && (!"0".equals(uin)))
          {
            jdField_a_of_type_Int = 0;
            label307:
            jdField_a_of_type_JavaLangString = uin;
            b = mobileNo;
            jdField_d_of_type_JavaLangString = name;
            label337:
            if ((TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) || (jdField_a_of_type_JavaLangString.equals("0"))) {
              jdField_a_of_type_JavaLangString = paramString;
            }
            if ((PstnUtils.a(app, 1)) || (!PstnUtils.a(app, 2))) {
              break label603;
            }
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall = new C2CCallToGroupCall();
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall.a(app, this, getIntent(), getActivity(), jdField_c_of_type_JavaLangString, jdField_a_of_type_JavaLangString, jdField_d_of_type_JavaLangString, jdField_a_of_type_Int, b, 4);
            jdField_a_of_type_ComTencentMobileqqActivityC2CCallToGroupCall.a(this, true);
          }
        }
        label603:
        for (boolean bool = true;; bool = ChatActivityUtils.a(app, this, localPstnSessionInfo, 4))
        {
          if (QLog.isColorLevel()) {
            QLog.d("RecentT9SearchActivity", 2, "startCall|ret=" + bool + " sessionInfo=" + localPstnSessionInfo);
          }
          if (bool)
          {
            SharedPreUtils.c(this, app.a(), paramString);
            jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.a();
          }
          if (!jdField_b_of_type_Boolean) {
            break label618;
          }
          ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 11, 0, "", "", "", "");
          break;
          jdField_a_of_type_Int = 56938;
          break label307;
          jdField_a_of_type_JavaLangString = paramString;
          b = paramString;
          jdField_a_of_type_Int = 2016;
          jdField_d_of_type_JavaLangString = paramString;
          break label337;
        }
        label618:
        ReportController.b(app, "CliOper", "", "", "0X8006406", "0X8006406", 10, 0, "", "", "", "");
      }
    }
  }
  
  private void d()
  {
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard = ((T9KeyBoard)findViewById(2131299243));
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131299230));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299231));
    e = ((TextView)findViewById(2131299237));
    if (jdField_b_of_type_Boolean) {
      e.setText(getString(2131372019));
    }
    jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131299229));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299233));
    jdField_d_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299234));
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131299236));
    jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131299240));
    jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetRelativeLayout.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_d_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetListView = ((ListView)findViewById(2131299239));
    jdField_a_of_type_ComTencentMobileqqT9searchT9SearchResultAdapter = new T9SearchResultAdapter(this, app, jdField_a_of_type_ComTencentWidgetListView, jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_ComTencentWidgetListView.setAdapter(jdField_a_of_type_ComTencentMobileqqT9searchT9SearchResultAdapter);
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131299235));
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setAttachEditText(jdField_a_of_type_AndroidWidgetEditText);
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setOnKeyClickListener(this);
    jdField_a_of_type_ComTencentWidgetListView.setOnScrollListener(this);
    f();
    if (jdField_a_of_type_Boolean)
    {
      jdField_d_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
      jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
      jdField_a_of_type_ComTencentWidgetListView.setVisibility(8);
      return;
    }
    jdField_d_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(0);
    jdField_a_of_type_ComTencentWidgetListView.setVisibility(0);
  }
  
  private void e()
  {
    if (!PstnUtils.a(app, this))
    {
      Intent localIntent = new Intent(this, PhoneContactSelectActivity.class);
      localIntent.putExtra("param_ui_flag", 1);
      localIntent.putExtra("param_type", 3000);
      localIntent.putExtra("param_subtype", 0);
      localIntent.putExtra("param_entrance", 10);
      localIntent.putExtra("param_from", 1003);
      localIntent.putExtra("param_done_button_wording", getString(2131368994));
      localIntent.putExtra("param_done_button_highlight_wording", getString(2131369876));
      localIntent.putExtra("param_max", 49);
      localIntent.putExtra("param_exit_animation", 1);
      localIntent.putExtra("param_back_button_side", 0);
      localIntent.putExtra("key_is_from_web", jdField_b_of_type_Boolean);
      localIntent.setFlags(603979776);
      startActivityForResult(localIntent, 1400);
      overridePendingTransition(2130968590, 2130968591);
    }
  }
  
  private void f()
  {
    jdField_a_of_type_AndroidWidgetEditText.setOnClickListener(new mhf(this));
    jdField_a_of_type_AndroidWidgetEditText.setOnFocusChangeListener(new mhg(this));
    jdField_a_of_type_AndroidWidgetEditText.setOnTouchListener(new mhh(this));
    if (VersionUtils.e()) {
      jdField_a_of_type_AndroidWidgetEditText.setTextIsSelectable(true);
    }
    jdField_a_of_type_AndroidWidgetEditText.setImeOptions(268435456);
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setAttachEditText(jdField_a_of_type_AndroidWidgetEditText);
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new mhi(this));
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 2130842825, 0, 0);
  }
  
  public void a(char paramChar) {}
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if (paramAbsListView == null) {}
    while ((paramInt != 0) && (paramInt != 1)) {
      return;
    }
    a();
  }
  
  public void a(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void a(String paramString)
  {
    jdField_c_of_type_JavaLangString = paramString;
    jdField_d_of_type_JavaLangString = PhoneNumberUtil.a(paramString);
    if (TextUtils.isEmpty(jdField_c_of_type_JavaLangString))
    {
      if (jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
        jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
        jdField_a_of_type_ComTencentWidgetListView.setVisibility(8);
        return;
      }
      jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
      jdField_b_of_type_AndroidViewViewGroup.setVisibility(0);
      jdField_a_of_type_ComTencentWidgetListView.setVisibility(0);
      jdField_a_of_type_ComTencentMobileqqT9searchT9SearchResultAdapter.a();
      return;
    }
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_a_of_type_ComTencentWidgetListView.setVisibility(0);
    new mhj(this, null).execute(new String[] { jdField_c_of_type_JavaLangString, jdField_d_of_type_JavaLangString });
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    ReportController.b(app, "CliOper", "", "", "0X80063F0", "0X80063F0", 0, 0, "", "", "", "");
    if (paramString.equals("PASTE")) {
      c();
    }
    while (!paramBoolean) {
      return;
    }
    a(paramString);
  }
  
  public void a(boolean paramBoolean)
  {
    ThreadManager.a(new mhe(this, paramBoolean), 5, null, false);
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 2130842826, 0, 0);
  }
  
  public void c()
  {
    Object localObject2 = null;
    Object localObject1;
    if (VersionUtils.e())
    {
      localObject1 = (android.content.ClipboardManager)getSystemService("clipboard");
      if (!((android.content.ClipboardManager)localObject1).hasPrimaryClip()) {
        break label162;
      }
      localObject1 = ((android.content.ClipboardManager)localObject1).getPrimaryClip().getItemAt(0).getText();
      if (localObject1 == null) {
        break label162;
      }
      localObject1 = ((CharSequence)localObject1).toString();
    }
    for (;;)
    {
      if ((TextUtils.isEmpty((CharSequence)localObject1)) || (TextUtils.isEmpty(((String)localObject1).trim())))
      {
        QQToast.a(this, 2131372024, 0).a();
        return;
        android.text.ClipboardManager localClipboardManager = (android.text.ClipboardManager)getSystemService("clipboard");
        localObject1 = localObject2;
        if (localClipboardManager.hasText())
        {
          localObject1 = localObject2;
          if (localClipboardManager.getText() != null) {
            localObject1 = localClipboardManager.getText().toString();
          }
        }
      }
      else
      {
        localObject1 = PhoneNumberUtil.b((String)localObject1);
        if (TextUtils.isEmpty((CharSequence)localObject1))
        {
          QQToast.a(this, 2131372024, 0).a();
          return;
        }
        jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.a(jdField_a_of_type_AndroidWidgetEditText.getSelectionEnd(), (String)localObject1);
        return;
        label162:
        localObject1 = null;
      }
    }
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt1 == 1400) && (paramInt2 == -1))
    {
      String str = paramIntent.getStringExtra("roomId");
      ArrayList localArrayList = paramIntent.getStringArrayListExtra("qqPhoneUserList");
      paramInt1 = paramIntent.getIntExtra("callType", 2);
      paramInt2 = paramIntent.getIntExtra("from", 6);
      ChatActivityUtils.a(app, this, 3000, str, true, true, true, null, localArrayList, paramInt1, paramInt2);
    }
    for (;;)
    {
      if (jdField_b_of_type_Boolean) {
        finish();
      }
      return;
      if ((paramInt1 == 2002) && (paramInt2 == -1)) {
        a(true);
      }
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    jdField_a_of_type_Boolean = getIntent().getBooleanExtra("key_is_from_try", true);
    jdField_b_of_type_Boolean = getIntent().getBooleanExtra("key_is_from_web", false);
    super.doOnCreate(paramBundle);
    if (ImmersiveUtils.a()) {
      ImmersiveUtils.a(getWindow(), true);
    }
    setContentView(2130903579);
    paramBundle = (ViewGroup)findViewById(2131299226);
    if ((Build.VERSION.SDK_INT >= 14) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      paramBundle.setFitsSystemWindows(true);
      paramBundle.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    d();
    a(PstnUtils.a(app));
    return true;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (((PstnManager)app.getManager(142)).b() != 1) {
      finish();
    }
    if (mSystemBarComp != null)
    {
      int i = getResources().getColor(2131427695);
      mSystemBarComp.a(i);
      mSystemBarComp.b(i);
    }
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(2130968589, 2130968593);
  }
  
  protected boolean isWrapContent()
  {
    return false;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131299231: 
    case 2131299232: 
    default: 
      return;
    case 2131299230: 
      if (jdField_a_of_type_ComTencentMobileqqT9searchT9KeyBoard.getVisibility() == 0)
      {
        a();
        return;
      }
      b();
      return;
    case 2131299229: 
      ReportController.b(app, "CliOper", "", "", "0X80063F1", "0X80063F1", 0, 0, "", "", "", "");
      if (jdField_a_of_type_ComTencentMobileqqT9searchT9SearchResultAdapter.getCount() > 0)
      {
        paramView = jdField_a_of_type_ComTencentMobileqqT9searchT9SearchResultAdapter.a(0);
        if (jdField_a_of_type_Boolean)
        {
          a(paramView);
          return;
        }
      }
      b(jdField_a_of_type_AndroidWidgetEditText.getText().toString());
      return;
    case 2131299233: 
      finish();
      return;
    }
    e();
  }
}
