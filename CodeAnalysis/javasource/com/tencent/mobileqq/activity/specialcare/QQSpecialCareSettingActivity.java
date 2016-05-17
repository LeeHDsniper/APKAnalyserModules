package com.tencent.mobileqq.activity.specialcare;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.Toast;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.data.SpecialCareInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.FormSimpleItem;
import com.tencent.mobileqq.widget.FormSwitchItem;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.qphone.base.util.QLog;
import mps;
import mpt;
import mpu;
import mpv;

public class QQSpecialCareSettingActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener, CompoundButton.OnCheckedChangeListener
{
  private static final int jdField_a_of_type_Int = 1;
  public static final String a = "key_friend_uin";
  private static final int jdField_b_of_type_Int = 0;
  public static final String b = "key_is_from_management_activity";
  private static final int jdField_c_of_type_Int = 8193;
  private static final String jdField_c_of_type_JavaLangString = "QQSpecialCareSettingActivity";
  private static final int jdField_d_of_type_Int = 8194;
  private static final int e = 8195;
  public final Handler a;
  private View jdField_a_of_type_AndroidViewView;
  private Toast jdField_a_of_type_AndroidWidgetToast;
  private QvipSpecialSoundManager jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager;
  private FriendListHandler jdField_a_of_type_ComTencentMobileqqAppFriendListHandler;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private QvipSpecialCareObserver jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver;
  private SpecialCareInfo jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo;
  private FormSimpleItem jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
  private FormSwitchItem jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
  private QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  private View jdField_b_of_type_AndroidViewView;
  private FormSwitchItem jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
  private FormSwitchItem jdField_c_of_type_ComTencentMobileqqWidgetFormSwitchItem;
  private String jdField_d_of_type_JavaLangString;
  
  public QQSpecialCareSettingActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = new mpt(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mpu(this);
    jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver = new mpv(this);
  }
  
  private void a()
  {
    boolean bool2 = true;
    int j = 0;
    jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(d);
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "showItems mSpecInfo: " + jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo);
    }
    if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo == null)
    {
      if (!jdField_a_of_type_ComTencentMobileqqAppFriendsManager.e())
      {
        jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(8);
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(8);
        c.setVisibility(8);
        jdField_b_of_type_AndroidViewView.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setVisibility(8);
        return;
      }
      jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(0);
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(8);
      c.setVisibility(8);
      jdField_b_of_type_AndroidViewView.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setChecked(false);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(0);
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    Object localObject = jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
    boolean bool1;
    if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo.globalSwitch == 0)
    {
      bool1 = false;
      ((FormSwitchItem)localObject).setChecked(bool1);
      localObject = jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
      if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo.specialRingSwitch != 0) {
        break label378;
      }
      bool1 = false;
      label245:
      ((FormSwitchItem)localObject).setChecked(bool1);
      localObject = c;
      bool1 = bool2;
      if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo.qzoneSwitch == 0) {
        bool1 = false;
      }
      ((FormSwitchItem)localObject).setChecked(bool1);
      bool1 = jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a();
      localObject = jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
      if (!bool1) {
        break label383;
      }
      i = 0;
      label298:
      ((FormSwitchItem)localObject).setVisibility(i);
      localObject = c;
      if (!bool1) {
        break label389;
      }
      i = 0;
      label316:
      ((FormSwitchItem)localObject).setVisibility(i);
      localObject = jdField_b_of_type_AndroidViewView;
      if (!bool1) {
        break label395;
      }
      i = 0;
      label334:
      ((View)localObject).setVisibility(i);
      localObject = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      if ((!bool1) || (!jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.a())) {
        break label401;
      }
    }
    label378:
    label383:
    label389:
    label395:
    label401:
    for (int i = j;; i = 8)
    {
      ((FormSimpleItem)localObject).setVisibility(i);
      c();
      return;
      bool1 = true;
      break;
      bool1 = true;
      break label245;
      i = 8;
      break label298;
      i = 8;
      break label316;
      i = 8;
      break label334;
    }
  }
  
  private void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "loadSpecialSoundConfig start loading...");
    }
    startTitleProgress();
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(new mps(this));
  }
  
  private void c()
  {
    if (QvipSpecialCareManager.a(d, app))
    {
      if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a()) {
        b();
      }
      int i = QvipSpecialCareManager.a(d, app);
      String str2 = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(i);
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialCareSettingActivity", 2, "updatePersonalVoice mFriUin: " + d + ", soundId: " + i + ", soundName: " + str2);
      }
      FormSimpleItem localFormSimpleItem = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      String str1 = str2;
      if (TextUtils.isEmpty(str2)) {
        str1 = getString(2131368580);
      }
      localFormSimpleItem.setRightText(str1);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "updatePersonalVoice not contain friend: " + d);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setRightText(getString(2131368580));
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130904293);
    setTitle(2131370682);
    setLeftViewName(2131367694);
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem = ((FormSwitchItem)findViewById(2131302150));
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setOnCheckedChangeListener(this);
    jdField_a_of_type_AndroidViewView = findViewById(2131302151);
    jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem = ((FormSwitchItem)findViewById(2131302152));
    jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setOnCheckedChangeListener(this);
    c = ((FormSwitchItem)findViewById(2131302154));
    c.setOnCheckedChangeListener(this);
    jdField_b_of_type_AndroidViewView = findViewById(2131302155);
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem = ((FormSimpleItem)findViewById(2131302153));
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setOnClickListener(this);
    d = getIntent().getStringExtra("key_friend_uin");
    if (app != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler = ((FriendListHandler)app.a(1));
      jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)app.getManager(50));
      app.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      app.a(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
    }
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager = new QvipSpecialSoundManager(this, app);
    if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a())
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialCareSettingActivity", 2, "QvipSpecialSoundManager no cache data.");
      }
      b();
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialCareSettingActivity", 2, "doOnCreate mFriUin: " + d);
    }
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (app != null)
    {
      app.b(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
      app.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    a();
  }
  
  public void finish()
  {
    if (getIntent().getBooleanExtra("key_is_from_management_activity", false)) {
      setResult(-1);
    }
    super.finish();
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    int i = 2;
    boolean bool2 = true;
    boolean bool1 = true;
    int j = 0;
    if (!paramCompoundButton.isPressed()) {
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialCareSettingActivity", 2, "onCheckedChanged isCheck: " + paramBoolean + ", NOT switched by user.");
      }
    }
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialCareSettingActivity", 2, "onCheckedChanged isCheck: " + paramBoolean + ", switched by user.");
      }
      if (paramCompoundButton == jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a())
      {
        if (NetworkUtil.g(this))
        {
          jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(1, new String[] { d }, new boolean[] { paramBoolean });
          paramCompoundButton = jdField_a_of_type_AndroidOsHandler.obtainMessage(8193);
          jdField_a_of_type_AndroidOsHandler.sendMessage(paramCompoundButton);
          return;
        }
        paramCompoundButton = jdField_a_of_type_AndroidOsHandler.obtainMessage(8195);
        arg1 = 0;
        arg2 = 2131366990;
        jdField_a_of_type_AndroidOsHandler.sendMessage(paramCompoundButton);
        paramCompoundButton = jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
        if (!jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) {}
        for (paramBoolean = bool1;; paramBoolean = false)
        {
          paramCompoundButton.setChecked(paramBoolean);
          return;
        }
      }
    } while ((paramCompoundButton != jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) && (paramCompoundButton != c.a()));
    if (paramCompoundButton == jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.a())
    {
      paramCompoundButton = jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
      label259:
      if (!NetworkUtil.g(this)) {
        break label337;
      }
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(i, new String[] { d }, new boolean[] { paramBoolean });
      paramCompoundButton = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      if (!jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) {
        break label396;
      }
    }
    label337:
    label396:
    for (i = j;; i = 8)
    {
      paramCompoundButton.setVisibility(i);
      return;
      if (paramCompoundButton != c.a()) {
        break;
      }
      i = 3;
      paramCompoundButton = c;
      break label259;
      Message localMessage = jdField_a_of_type_AndroidOsHandler.obtainMessage(8195);
      arg1 = 0;
      arg2 = 2131366990;
      jdField_a_of_type_AndroidOsHandler.sendMessage(localMessage);
      if (!paramCompoundButton.a()) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        paramCompoundButton.setChecked(paramBoolean);
        break;
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView == null) {}
    for (int i = 0;; i = paramView.getId()) {
      switch (i)
      {
      default: 
        return;
      }
    }
    paramView = new Intent(this, QQBrowserActivity.class);
    paramView.putExtra("url", "http://imgcache.qq.com/club/client/specialRing/rel/index.html?_wv=1027&suin=" + d + "&uin=" + app.a() + "&_bid=279");
    paramView.putExtra("uin", d);
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    startActivity(paramView);
  }
}
