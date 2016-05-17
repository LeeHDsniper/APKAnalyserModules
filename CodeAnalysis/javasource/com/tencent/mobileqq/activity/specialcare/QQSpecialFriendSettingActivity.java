package com.tencent.mobileqq.activity.specialcare;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.SpecialCareInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.FaceDecoder.DecodeTaskCompletionListener;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.ReflectedMethods;
import com.tencent.mobileqq.widget.FormSimpleItem;
import com.tencent.mobileqq.widget.FormSwitchItem;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.qphone.base.util.QLog;
import mpw;
import mpx;
import mpy;
import mpz;
import mqa;

public class QQSpecialFriendSettingActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener, CompoundButton.OnCheckedChangeListener, FaceDecoder.DecodeTaskCompletionListener
{
  private static final int jdField_a_of_type_Int = 1;
  private static final String jdField_a_of_type_JavaLangString = "QQSpecialFriendSettingActivity";
  private static final int jdField_b_of_type_Int = 0;
  private static final int c = 8193;
  private static final int d = 8194;
  private static final int e = 8195;
  public final Handler a;
  private View jdField_a_of_type_AndroidViewView;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private QvipSpecialSoundManager jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager;
  private FriendListHandler jdField_a_of_type_ComTencentMobileqqAppFriendListHandler;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private QvipSpecialCareObserver jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver;
  private SpecialCareInfo jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo;
  private FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  private FormSimpleItem jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
  private FormSwitchItem jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
  private QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  private boolean jdField_a_of_type_Boolean;
  private View jdField_b_of_type_AndroidViewView;
  private FormSwitchItem jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
  private String jdField_b_of_type_JavaLangString;
  private int f;
  
  public QQSpecialFriendSettingActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = new mpy(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mpz(this);
    jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver = new mqa(this);
  }
  
  private void a()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem = ((FormSimpleItem)findViewById(2131302153));
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setOnClickListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem = ((FormSwitchItem)findViewById(2131302152));
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setOnCheckedChangeListener(this);
    jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem = ((FormSwitchItem)findViewById(2131302154));
    jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setOnCheckedChangeListener(this);
    jdField_a_of_type_AndroidViewView = findViewById(2131302155);
    jdField_b_of_type_AndroidViewView = findViewById(2131302157);
    jdField_b_of_type_AndroidViewView.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302156));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131296861));
    if (jdField_a_of_type_Boolean)
    {
      setLeftViewName(2131368389);
      setRightButton(2131368442, new mpw(this));
      jdField_b_of_type_AndroidViewView.setVisibility(8);
      return;
    }
    setLeftViewName(2131367083);
  }
  
  private void b()
  {
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager = new QvipSpecialSoundManager(this, app);
    if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a())
    {
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialFriendSettingActivity", 2, "QvipSpecialSoundManager no cache data.");
      }
      d();
    }
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(this, app);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(this);
    Object localObject = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, jdField_b_of_type_JavaLangString, 0);
    if (localObject == null)
    {
      if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b()) {
        jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_b_of_type_JavaLangString, 1, true);
      }
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable((BitmapDrawable)ImageUtil.a());
    }
    for (;;)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(jdField_b_of_type_JavaLangString);
      if (localObject != null) {
        break;
      }
      jdField_a_of_type_AndroidWidgetTextView.setText(jdField_b_of_type_JavaLangString);
      return;
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(new BitmapDrawable((Bitmap)localObject));
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(((Friends)localObject).getFriendNickWithAlias());
  }
  
  private void c()
  {
    boolean bool2 = true;
    int i = 0;
    jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(jdField_b_of_type_JavaLangString);
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "showItems mSpecInfo: " + jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo);
    }
    if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo == null)
    {
      if (!jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(8);
        jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(8);
        jdField_a_of_type_AndroidViewView.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setVisibility(8);
        jdField_b_of_type_AndroidViewView.setVisibility(8);
        return;
      }
      jdField_b_of_type_AndroidViewView.setVisibility(8);
      e();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(0);
    jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.setVisibility(0);
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    if (!jdField_a_of_type_Boolean) {
      jdField_b_of_type_AndroidViewView.setVisibility(0);
    }
    Object localObject = jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
    boolean bool1;
    if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo.specialRingSwitch == 0)
    {
      bool1 = false;
      ((FormSwitchItem)localObject).setChecked(bool1);
      localObject = jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
      bool1 = bool2;
      if (jdField_a_of_type_ComTencentMobileqqDataSpecialCareInfo.qzoneSwitch == 0) {
        bool1 = false;
      }
      ((FormSwitchItem)localObject).setChecked(bool1);
      localObject = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      if (!jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) {
        break label248;
      }
    }
    for (;;)
    {
      ((FormSimpleItem)localObject).setVisibility(i);
      e();
      return;
      bool1 = true;
      break;
      label248:
      i = 8;
    }
  }
  
  private void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "loadSpecialSoundConfig start loading...");
    }
    startTitleProgress();
    jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(new mpx(this));
  }
  
  private void e()
  {
    String str2;
    FormSimpleItem localFormSimpleItem;
    String str1;
    if (jdField_a_of_type_Boolean)
    {
      f = ReflectedMethods.a(BaseApplicationImpl.getContext(), "com.tencent.mobileqq_preferences").getInt("special_care_id_cache" + jdField_b_of_type_JavaLangString, 1);
      str2 = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(f);
      localFormSimpleItem = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      if (TextUtils.isEmpty(str2)) {}
      for (str1 = getString(2131368580);; str1 = str2)
      {
        localFormSimpleItem.setRightText(str1);
        if (QLog.isColorLevel()) {
          QLog.d("QQSpecialFriendSettingActivity", 2, "updatePersonalVoice FromForwardFriendActivity mFriUin: " + jdField_b_of_type_JavaLangString + ", soundId: " + f + ", soundName: " + str2);
        }
        return;
      }
    }
    if (QvipSpecialCareManager.a(jdField_b_of_type_JavaLangString, app))
    {
      if (!jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a()) {
        d();
      }
      int i = QvipSpecialCareManager.a(jdField_b_of_type_JavaLangString, app);
      str2 = jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager.a(i);
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialFriendSettingActivity", 2, "updatePersonalVoice mFriUin: " + jdField_b_of_type_JavaLangString + ", soundId: " + i + ", soundName: " + str2);
      }
      localFormSimpleItem = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      str1 = str2;
      if (TextUtils.isEmpty(str2)) {
        str1 = getString(2131368580);
      }
      localFormSimpleItem.setRightText(str1);
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "updatePersonalVoice not contain friend: " + jdField_b_of_type_JavaLangString);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem.setRightText(getString(2131368580));
  }
  
  public void a(int paramInt1, int paramInt2, String paramString, Bitmap paramBitmap)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "uin=" + paramString + ", type=" + paramInt2 + ",avatar= " + paramBitmap);
    }
    if ((paramBitmap == null) || (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())) {
      return;
    }
    jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(new BitmapDrawable(paramBitmap));
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130904294);
    setTitle(2131370682);
    paramBundle = getIntent();
    jdField_b_of_type_JavaLangString = paramBundle.getStringExtra("key_friend_uin");
    jdField_a_of_type_Boolean = paramBundle.getBooleanExtra("key_is_from_friendsforward_activity", false);
    a();
    jdField_a_of_type_ComTencentMobileqqAppFriendListHandler = ((FriendListHandler)app.a(1));
    jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)app.getManager(50));
    app.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    app.a(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
    b();
    ReportController.b(null, "CliOper", "", "", "0X80050E5", "0X80050E5", 0, 0, "0", "", "", "");
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "doOnCreate mFriUin: " + jdField_b_of_type_JavaLangString);
    }
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    }
    if (app != null)
    {
      app.b(jdField_a_of_type_ComTencentMobileqqAppQvipSpecialCareObserver);
      app.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
    if (jdField_a_of_type_Boolean) {
      ReflectedMethods.a(BaseApplicationImpl.getContext(), "com.tencent.mobileqq_preferences").edit().remove("special_care_id_cache" + jdField_b_of_type_JavaLangString).commit();
    }
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    c();
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    int j = 2;
    boolean bool = false;
    if (!paramCompoundButton.isPressed()) {
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialFriendSettingActivity", 2, "onCheckedChanged isCheck: " + paramBoolean + ", NOT switched by user.");
      }
    }
    int i;
    label108:
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("QQSpecialFriendSettingActivity", 2, "onCheckedChanged isCheck: " + paramBoolean + ", switched by user.");
      }
      localObject = jdField_a_of_type_ComTencentMobileqqWidgetFormSimpleItem;
      if (!jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) {
        break;
      }
      i = 0;
      ((FormSimpleItem)localObject).setVisibility(i);
    } while (jdField_a_of_type_Boolean);
    if (paramCompoundButton == jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem.a())
    {
      paramCompoundButton = jdField_a_of_type_ComTencentMobileqqWidgetFormSwitchItem;
      i = j;
    }
    for (;;)
    {
      if (!NetworkUtil.g(this)) {
        break label201;
      }
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(i, new String[] { jdField_b_of_type_JavaLangString }, new boolean[] { paramBoolean });
      return;
      i = 8;
      break label108;
      if (paramCompoundButton != jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem.a()) {
        break;
      }
      i = 3;
      paramCompoundButton = jdField_b_of_type_ComTencentMobileqqWidgetFormSwitchItem;
    }
    label201:
    Object localObject = jdField_a_of_type_AndroidOsHandler.obtainMessage(8195);
    arg1 = 0;
    arg2 = 2131366990;
    jdField_a_of_type_AndroidOsHandler.sendMessage((Message)localObject);
    paramBoolean = bool;
    if (!paramCompoundButton.a()) {
      paramBoolean = true;
    }
    paramCompoundButton.setChecked(paramBoolean);
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
    paramView.putExtra("url", "http://imgcache.qq.com/club/client/specialRing/rel/index.html?_wv=1027&suin=" + jdField_b_of_type_JavaLangString + "&uin=" + app.a() + "&_bid=279" + "&lazy=" + jdField_a_of_type_Boolean);
    paramView.putExtra("uin", jdField_b_of_type_JavaLangString);
    paramView.putExtra("startOpenPageTime", System.currentTimeMillis());
    startActivity(paramView);
    return;
    if (NetworkUtil.g(this))
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListHandler.a(1, new String[] { jdField_b_of_type_JavaLangString }, new boolean[] { false });
      paramView = jdField_a_of_type_AndroidOsHandler.obtainMessage(8193);
      obj = getString(2131370694);
      jdField_a_of_type_AndroidOsHandler.sendMessage(paramView);
    }
    for (;;)
    {
      ReportController.b(null, "CliOper", "", "", "0X80050E6", "0X80050E6", 0, 0, "0", "", "", "");
      return;
      paramView = jdField_a_of_type_AndroidOsHandler.obtainMessage(8195);
      arg1 = 0;
      arg2 = 2131366990;
      jdField_a_of_type_AndroidOsHandler.sendMessage(paramView);
    }
  }
}
