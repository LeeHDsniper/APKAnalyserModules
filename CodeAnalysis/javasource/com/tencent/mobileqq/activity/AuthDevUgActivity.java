package com.tencent.mobileqq.activity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.common.app.AppInterface;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.equipmentlock.DevlockPhoneStatus;
import com.tencent.mobileqq.equipmentlock.EquipLockWebEntrance;
import com.tencent.mobileqq.equipmentlock.EquipmentLockImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.qqconnect.wtlogin.AuthDevVerifyCodeActivity2;
import ich;
import mqq.app.MobileQQ;
import mqq.manager.VerifyDevLockManager.VerifyDevLockObserver;
import mqq.os.MqqHandler;
import oicq.wlogin_sdk.devicelock.DevlockInfo;

public class AuthDevUgActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener
{
  public static final int a = 0;
  public static final String a = "from_login";
  public static final int b = 1;
  public static final String b = "phone_num";
  public static final int c = 2;
  public static final String c = "country_code";
  public static final int d = 3;
  public static final String d = "auth_dev_open";
  public static final int e = 1001;
  public static final String e = "allow_set";
  public static final int f = 1002;
  public static final String f = "user_guide";
  public static final int g = 1003;
  public static final String g = "user_uin";
  public static final int h = 0;
  public static final String h = "seq";
  public static final int i = 1;
  public static final String i = "DevlockInfo";
  public static final int j = 2;
  public static final String j = "devlock_roam_sig";
  public static final String k = "devlock_need_broadcast";
  public static final String l = "devlock_open_source";
  public static final String m = "skip_guide_page";
  public static final String n = "auth_dev_open_cb_reason";
  private static final String o = "Q.devlock.AuthDevUgActivity";
  private Button jdField_a_of_type_AndroidWidgetButton;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private AppInterface jdField_a_of_type_ComTencentCommonAppAppInterface;
  VerifyDevLockManager.VerifyDevLockObserver jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver;
  private DevlockInfo jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo;
  private boolean jdField_a_of_type_Boolean;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private Button jdField_c_of_type_AndroidWidgetButton;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private int k;
  private String p;
  private String q;
  private String r;
  
  public AuthDevUgActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_AndroidWidgetButton = null;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo = null;
    jdField_a_of_type_ComTencentCommonAppAppInterface = null;
    jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver = new ich(this);
  }
  
  private void a()
  {
    String str;
    if (jdField_a_of_type_Boolean) {
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (!TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.VerifyReason)))
      {
        jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.VerifyReason);
        if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
        {
          str = getString(2131370342) + ":" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile;
          jdField_c_of_type_AndroidWidgetTextView.setText(str);
        }
        jdField_b_of_type_AndroidWidgetButton.setText(getString(2131370362));
        if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.BakMobileState == 2))
        {
          jdField_c_of_type_AndroidWidgetButton.setVisibility(0);
          if (AppSetting.i) {
            jdField_c_of_type_AndroidWidgetButton.setContentDescription(getString(2131370406));
          }
        }
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        leftView.setVisibility(4);
        setRightButton(2131366996, this);
        if (AppSetting.i)
        {
          jdField_a_of_type_AndroidWidgetButton.setContentDescription(getString(2131370360));
          jdField_b_of_type_AndroidWidgetButton.setContentDescription(getString(2131370362));
        }
      }
    }
    label420:
    do
    {
      return;
      jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131370361));
      break;
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (!TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.ProtectIntro))) {
        jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.ProtectIntro);
      }
      for (;;)
      {
        if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo == null) || (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideType != 2)) {
          break label420;
        }
        str = getString(2131370342) + ":" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile;
        jdField_c_of_type_AndroidWidgetTextView.setText(str);
        jdField_b_of_type_AndroidWidgetButton.setText(getString(2131370338));
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
        if (!AppSetting.i) {
          break;
        }
        jdField_a_of_type_AndroidWidgetButton.setContentDescription(getString(2131370360));
        jdField_b_of_type_AndroidWidgetButton.setContentDescription(getString(2131370338));
        return;
        jdField_a_of_type_AndroidWidgetTextView.setText(getString(2131370361));
      }
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (!TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideMsg))) {
        jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideMsg);
      }
      jdField_b_of_type_AndroidWidgetButton.setText(getString(2131370338));
    } while (!AppSetting.i);
    jdField_a_of_type_AndroidWidgetButton.setContentDescription(getString(2131370360));
    jdField_b_of_type_AndroidWidgetButton.setContentDescription(getString(2131370338));
  }
  
  public void a(int paramInt, Intent paramIntent)
  {
    setResult(paramInt, paramIntent);
    finish();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    paramBundle = getIntent();
    if (paramBundle == null)
    {
      finish();
      return true;
    }
    paramBundle = paramBundle.getExtras();
    if (paramBundle == null)
    {
      finish();
      return true;
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_Boolean = paramBundle.getBoolean("from_login");
        k = paramBundle.getInt("seq");
        Object localObject = paramBundle.get("DevlockInfo");
        if ((localObject instanceof DevlockInfo)) {
          jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo = ((DevlockInfo)localObject);
        }
        p = paramBundle.getString("uin");
        q = paramBundle.getString("from_where");
        r = paramBundle.getString("mainaccount");
        if (QLog.isColorLevel())
        {
          QLog.d("Q.devlock.AuthDevUgActivity", 2, "onCreate mIsFromLogin = " + jdField_a_of_type_Boolean + " mVerifySeq=" + k + " mUin=" + p + " mFromWhere=" + q + " mMainAccount=" + r);
          if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
          {
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "onCreate DevlockInfo devSetup:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.DevSetup + " countryCode:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.CountryCode + " mobile:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile + " MbItemSmsCodeStatus:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbItemSmsCodeStatus + " TimeLimit:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.TimeLimit + " AvailableMsgCount:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.AvailableMsgCount + " AllowSet:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.AllowSet);
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "DevlockInfo.ProtectIntro:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.ProtectIntro + "  info.MbGuideType:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideType);
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "DevlockInfo.MbGuideMsg:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideMsg);
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "DevlockInfo.MbGuideInfoType:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideInfoType);
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "DevlockInfo.MbGuideInfo:" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideInfo);
          }
        }
        super.getWindow().setFormat(-3);
        if (jdField_a_of_type_Boolean) {
          setTheme(2131559115);
        }
        super.setContentView(2130904109);
        if (jdField_a_of_type_Boolean)
        {
          super.setTitle(2131370336);
          jdField_a_of_type_ComTencentCommonAppAppInterface = app;
          if (jdField_a_of_type_ComTencentCommonAppAppInterface == null) {
            jdField_a_of_type_ComTencentCommonAppAppInterface = ((AppInterface)getAppRuntime());
          }
          if (jdField_a_of_type_ComTencentCommonAppAppInterface != null) {
            break;
          }
          super.finish();
          return true;
        }
      }
      catch (Exception paramBundle)
      {
        paramBundle.printStackTrace();
        finish();
        return true;
      }
      super.setTitle(2131370335);
    }
    if (jdField_a_of_type_Boolean)
    {
      paramBundle = jdField_a_of_type_ComTencentCommonAppAppInterface.a(LoginActivity.class);
      if (paramBundle != null) {
        paramBundle.sendEmptyMessage(20140107);
      }
      paramBundle = jdField_a_of_type_ComTencentCommonAppAppInterface.a(SubLoginActivity.class);
      if (paramBundle != null) {
        paramBundle.sendEmptyMessage(20140107);
      }
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo == null) || (TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideInfo))) {
        break label787;
      }
      EquipmentLockImpl.a().a(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.MbGuideInfo);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131301346));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131301347));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131298558));
      jdField_a_of_type_AndroidWidgetButton = ((Button)super.findViewById(2131301348));
      jdField_b_of_type_AndroidWidgetButton = ((Button)super.findViewById(2131301339));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_c_of_type_AndroidWidgetButton = ((Button)super.findViewById(2131301349));
      jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
      a();
      jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver.setSeq(k);
      return true;
      label787:
      finish();
      overridePendingTransition(0, 0);
      QQToast.a(this, 1, getString(2131367212), 0).a();
    }
  }
  
  protected boolean isWrapContent()
  {
    return !jdField_a_of_type_Boolean;
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt1 == 1001) {
      if (paramInt2 == -1)
      {
        paramIntent = new Intent(this, AuthDevActivity.class);
        if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
        {
          paramIntent.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile);
          paramIntent.putExtra("country_code", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.CountryCode);
        }
        paramIntent.putExtra("auth_dev_open", true);
        startActivity(paramIntent);
        paramIntent = new Intent();
        paramIntent.putExtra("auth_dev_open", true);
        paramIntent.putExtra("allow_set", true);
        if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) {
          paramIntent.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile);
        }
        a(-1, paramIntent);
      }
    }
    label667:
    do
    {
      do
      {
        do
        {
          do
          {
            boolean bool;
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      return;
                      if (paramInt1 != 1002) {
                        break;
                      }
                    } while (paramInt2 != -1);
                    setResult(paramInt2, paramIntent);
                    finish();
                    return;
                  } while (paramInt1 != 1003);
                  if (paramInt2 != -1) {
                    break;
                  }
                } while ((paramIntent == null) || (paramIntent.getExtras() == null));
                paramInt1 = paramIntent.getExtras().getInt("resultState", 1);
                if (QLog.isColorLevel()) {
                  QLog.d("Q.devlock.AuthDevUgActivity", 2, "onActivityResult.resultCode= RESULT_OK  resultState =" + paramInt1);
                }
              } while (paramInt1 != 2);
              str = paramIntent.getExtras().getString("resultMobileMask");
              bool = paramIntent.getExtras().getBoolean("resultSetMobile");
              if (QLog.isColorLevel()) {
                QLog.d("Q.devlock.AuthDevUgActivity", 2, "onActivityResult.resultCode= RESULT_OK  resultMobileMask =" + str + " openSuccess=" + bool);
              }
              if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
              {
                jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile = str;
                if (!TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile))
                {
                  localObject = getString(2131370342) + ":" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile;
                  jdField_c_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
                  jdField_b_of_type_AndroidWidgetButton.setText(getString(2131370338));
                  jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
                  jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
                  jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
                }
              }
            } while (!bool);
            EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentCommonAppAppInterface, this, jdField_a_of_type_ComTencentCommonAppAppInterface.a(), true);
            Object localObject = new Intent(this, AuthDevActivity.class);
            ((Intent)localObject).putExtra("phone_num", str);
            if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) {
              ((Intent)localObject).putExtra("country_code", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.CountryCode);
            }
            String str = paramIntent.getExtras().getString("emergency_phone_mask");
            if (!TextUtils.isEmpty(str))
            {
              paramInt1 = paramIntent.getExtras().getInt("emergency_phone_state");
              if (QLog.isColorLevel()) {
                QLog.d("Q.devlock.AuthDevUgActivity", 2, "emergency phone:" + str + " state=" + paramInt1);
              }
              DevlockPhoneStatus.a().a(str);
              paramIntent = DevlockPhoneStatus.a();
              if (paramInt1 != 1) {
                break label667;
              }
            }
            for (paramInt1 = DevlockPhoneStatus.f;; paramInt1 = DevlockPhoneStatus.j)
            {
              paramIntent.b(paramInt1);
              ((Intent)localObject).putExtra("auth_dev_open", true);
              startActivity((Intent)localObject);
              QQToast.a(getApplicationContext(), 2, getString(2131370341), 0).b(getTitleBarHeight());
              paramIntent = new Intent();
              paramIntent.putExtra("auth_dev_open", true);
              paramIntent.putExtra("allow_set", true);
              if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) {
                paramIntent.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile);
              }
              a(-1, paramIntent);
              return;
            }
          } while ((paramInt2 != 0) || (paramIntent == null) || (paramIntent.getExtras() == null));
          paramInt1 = paramIntent.getExtras().getInt("resultState", 1);
          if (QLog.isColorLevel()) {
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "onActivityResult.resultCode= RESULT_CANCELED resultState =" + paramInt1);
          }
        } while (paramInt1 != 2);
        paramIntent = paramIntent.getExtras().getString("resultMobileMask");
        if (QLog.isColorLevel()) {
          QLog.d("Q.devlock.AuthDevUgActivity", 2, "onActivityResult.resultCode= RESULT_CANCELED resultMobileMask =" + paramIntent);
        }
        if (!TextUtils.isEmpty(paramIntent)) {
          EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentCommonAppAppInterface, jdField_a_of_type_ComTencentCommonAppAppInterface.a(), null);
        }
      } while (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo == null);
      jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile = paramIntent;
    } while (TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile));
    paramIntent = getString(2131370342) + ":" + jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile;
    jdField_c_of_type_AndroidWidgetTextView.setText(paramIntent);
    jdField_b_of_type_AndroidWidgetButton.setText(getString(2131370338));
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
  }
  
  protected boolean onBackEvent()
  {
    if (jdField_a_of_type_Boolean)
    {
      if (QLog.isColorLevel())
      {
        localObject = new StringBuilder().append("onBackEvent.cancelVerifyCode mVerifyObserver.seq=");
        if (jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver == null) {
          break label95;
        }
      }
      label95:
      for (int i1 = jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver.getSeq();; i1 = 0)
      {
        QLog.d("Q.devlock.AuthDevUgActivity", 2, i1);
        setResult(0);
        EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentCommonAppAppInterface, jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver);
        jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver = null;
        finish();
        overridePendingTransition(0, 2130968593);
        return false;
      }
    }
    Intent localIntent = new Intent();
    localIntent.putExtra("auth_dev_open", false);
    String str = "";
    Object localObject = str;
    if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
    {
      localObject = str;
      if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile != null) {
        localObject = jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile;
      }
    }
    localIntent.putExtra("phone_num", (String)localObject);
    a(0, localIntent);
    return false;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    label605:
    do
    {
      return;
      jdField_a_of_type_ComTencentCommonAppAppInterface.sendWirelessMeibaoReq(1);
      if (mAppForground)
      {
        if ((!TextUtils.isEmpty(q)) && (q.equals("subaccount")))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "subaccount enter webview mUin=" + p + " mMainAccount=" + r);
          }
          if ((TextUtils.isEmpty(p)) && (QLog.isColorLevel())) {
            QLog.d("Q.devlock.AuthDevUgActivity", 2, "mUin is empty.");
          }
          EquipLockWebEntrance.a(this, r, p, EquipLockWebEntrance.a);
          return;
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.devlock.AuthDevUgActivity", 2, "mainaccount enter webview mUin=" + p);
        }
        if ((TextUtils.isEmpty(p)) && (QLog.isColorLevel())) {
          QLog.d("Q.devlock.AuthDevUgActivity", 2, "mUin is empty.");
        }
        EquipLockWebEntrance.a(this, jdField_a_of_type_ComTencentCommonAppAppInterface.a(), p, EquipLockWebEntrance.a);
        return;
      }
      EquipLockWebEntrance.a(this, jdField_a_of_type_ComTencentCommonAppAppInterface, EquipLockWebEntrance.a);
      return;
      if (jdField_a_of_type_Boolean)
      {
        if ("com.tencent.mobileqq:openSdk".equals(jdField_a_of_type_ComTencentCommonAppAppInterface.getApplication().getProcessName())) {}
        for (paramView = new Intent(this, AuthDevVerifyCodeActivity2.class);; paramView = new Intent(this, AuthDevVerifyCodeActivity.class))
        {
          if (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null)
          {
            paramView.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile);
            paramView.putExtra("country_code", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.CountryCode);
            paramView.putExtra("mobile_type", 0);
          }
          paramView.putExtra("from_login", jdField_a_of_type_Boolean);
          paramView.putExtra("uin", p);
          paramView.putExtra("seq", k);
          startActivityForResult(paramView, 1002);
          return;
        }
      }
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (!TextUtils.isEmpty(jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile)))
      {
        ReportController.b(null, "CliOper", "", "", "My_eq_lock", "My_eq_lock_open", 0, 0, "1", "", "", "");
        paramView = new Intent(this, AuthDevVerifyCodeActivity.class);
        paramView.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.Mobile);
        paramView.putExtra("country_code", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.CountryCode);
        startActivityForResult(paramView, 1001);
        return;
      }
      EquipLockWebEntrance.a(this, jdField_a_of_type_ComTencentCommonAppAppInterface, EquipLockWebEntrance.a, 1003, null);
      return;
      if (QLog.isColorLevel())
      {
        paramView = new StringBuilder().append("onClick.cancelVerifyCode mVerifyObserver.seq=");
        if (jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver == null) {
          break label605;
        }
      }
      for (int i1 = jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver.getSeq();; i1 = 0)
      {
        QLog.d("Q.devlock.AuthDevUgActivity", 2, i1);
        EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentCommonAppAppInterface, jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver);
        jdField_a_of_type_MqqManagerVerifyDevLockManager$VerifyDevLockObserver = null;
        finish();
        overridePendingTransition(0, 2130968593);
        return;
      }
    } while (!jdField_a_of_type_Boolean);
    if ("com.tencent.mobileqq:openSdk".equals(jdField_a_of_type_ComTencentCommonAppAppInterface.getApplication().getProcessName())) {}
    for (paramView = new Intent(this, AuthDevVerifyCodeActivity2.class);; paramView = new Intent(this, AuthDevVerifyCodeActivity.class))
    {
      if ((jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo != null) && (jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.BakMobileState == 2))
      {
        paramView.putExtra("phone_num", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.BakMobile);
        paramView.putExtra("country_code", jdField_a_of_type_OicqWlogin_sdkDevicelockDevlockInfo.BakCountryCode);
        paramView.putExtra("mobile_type", 1);
      }
      paramView.putExtra("from_login", jdField_a_of_type_Boolean);
      paramView.putExtra("uin", p);
      paramView.putExtra("seq", k);
      startActivityForResult(paramView, 1002);
      return;
    }
  }
}
