package com.tencent.mobileqq.activity.phone;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.photo.PhotoMagicStickUtils;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import java.util.ArrayList;
import lzb;
import lzc;

public class PhoneFrameActivity
  extends IphoneTitleBarActivity
{
  public static final int a = 0;
  public static final String a = "key_req_type";
  public static final int b = 1;
  public static final String b = "key_reserved_mobile";
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  public static final int f = 5;
  public static final int g = 6;
  Bundle jdField_a_of_type_AndroidOsBundle;
  public View a;
  public ImageView a;
  public TextView a;
  public PhoneFrame a;
  boolean jdField_a_of_type_Boolean;
  public View b;
  boolean b;
  private int h;
  
  public PhoneFrameActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    h = 0;
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame = null;
  }
  
  private void a()
  {
    Intent localIntent = AIOUtils.a(new Intent(this, SplashActivity.class), null);
    Object localObject = new Bundle(jdField_a_of_type_AndroidOsBundle);
    ((Bundle)localObject).putBoolean("PhotoConst.HANDLE_DEST_RESULT", false);
    ((Bundle)localObject).putBoolean("PhotoConst.IS_FORWARD", true);
    ((Bundle)localObject).putInt("PhotoConst.SEND_BUSINESS_TYPE", 1031);
    ((Bundle)localObject).putBoolean("PicContants.NEED_COMPRESS", false);
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("extra_image_sender_tag", "sessionInfo.aioAlbum");
    localIntent.putExtra("isBack2Root", false);
    localIntent.putExtras((Bundle)localObject);
    localIntent.putExtra("uin", getIntent().getStringExtra("uin"));
    localIntent.putExtra("uinname", getIntent().getStringExtra("uinname"));
    localIntent.putExtra("uintype", getIntent().getIntExtra("uintype", 0));
    localIntent.putExtra("troop_uin", getIntent().getStringExtra("uin"));
    localObject = ((Bundle)localObject).getString("GALLERY.FORWORD_LOCAL_PATH");
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(localObject);
    PhotoUtils.a(this, localIntent, localArrayList, 0, false);
  }
  
  private void b()
  {
    jdField_a_of_type_AndroidViewView = findViewById(2131297322);
    b = ((View)jdField_a_of_type_AndroidViewView.getParent());
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297035));
    leftView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297323));
    rightViewText = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297081));
    rightViewText.setText(2131370958);
    rightViewText.setOnClickListener(new lzb(this));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131297324));
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription("设置");
    }
    IphoneTitleBarActivity.setLayerType(jdField_a_of_type_AndroidViewView);
    IphoneTitleBarActivity.setLayerType(jdField_a_of_type_AndroidWidgetTextView);
    IphoneTitleBarActivity.setLayerType(leftView);
    IphoneTitleBarActivity.setLayerType(rightViewText);
    IphoneTitleBarActivity.setLayerType(jdField_a_of_type_AndroidWidgetImageView);
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame = ((PhoneFrame)findViewById(2131298532));
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.setActivity(this);
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.setPhoneContext(new lzc(this));
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.a(null);
    Bundle localBundle = new Bundle();
    localBundle.putInt("key_req_type", h);
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.b(localBundle);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 20001) {
      if (paramInt2 == -1)
      {
        setResult(-1, paramIntent);
        finish();
      }
    }
    do
    {
      do
      {
        return;
        if ((paramInt2 != -1) || (paramInt1 != 100003)) {
          break;
        }
      } while (jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.a() == null);
      paramIntent = jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.a().a().getString("EditImagePath");
    } while (paramIntent == null);
    String str = app.getAccount();
    PhotoMagicStickUtils.a(paramIntent, this, true, -1, str, app.b(), app.a(false, str));
    overridePendingTransition(2130968619, 2130968620);
    return;
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.a(paramInt1, paramInt2, paramIntent);
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    getWindow().setBackgroundDrawable(null);
    setContentView(2130903431);
    h = getIntent().getIntExtra("key_req_type", 0);
    b();
    jdField_a_of_type_AndroidOsBundle = getIntent().getExtras();
    return true;
  }
  
  protected void doOnDestroy()
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.c();
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.d();
    super.doOnDestroy();
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    if (paramIntent.getBooleanExtra("PhotoConst.SEND_FLAG", false))
    {
      paramIntent = paramIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
      if ((paramIntent != null) && (!paramIntent.isEmpty())) {}
    }
    else
    {
      return;
    }
    paramIntent = (String)paramIntent.get(0);
    jdField_a_of_type_AndroidOsBundle.putString("GALLERY.FORWORD_LOCAL_PATH", paramIntent);
    jdField_a_of_type_AndroidOsBundle.putBoolean("FORWARD_IS_EDITED", true);
    a();
    ReportController.b(app, "CliOper", "", "", "0X800514C", "0X800514C", 0, 0, "", "", "", "");
  }
  
  protected void doOnPause()
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.b();
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneFrame.a();
  }
  
  public void finish()
  {
    if ((app.isLogin()) && (h == 0))
    {
      localIntent = new Intent(this, SplashActivity.class);
      localIntent.setFlags(67108864);
      localIntent.putExtra("tab_index", MainFragment.c);
      startActivity(localIntent);
    }
    while ((!app.isLogin()) || (h != 4))
    {
      super.finish();
      overridePendingTransition(2130968587, 2130968588);
      return;
    }
    ReportController.b(app, "CliOper", "", "", "0X8004F83", "0X8004F83", 0, 0, "", "", "", "");
    Intent localIntent = new Intent(this, SplashActivity.class);
    localIntent.setFlags(67108864);
    if (app.k) {}
    for (int i = MainFragment.b;; i = MainFragment.a)
    {
      localIntent.putExtra("tab_index", i);
      startActivity(localIntent);
      break;
    }
  }
}
