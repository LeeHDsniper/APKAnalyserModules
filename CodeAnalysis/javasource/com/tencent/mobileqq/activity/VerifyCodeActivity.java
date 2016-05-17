package com.tencent.mobileqq.activity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.widget.ClearableEditText;
import knv;
import knw;
import knx;
import kny;
import knz;
import mqq.manager.VerifyCodeManager;
import mqq.observer.ServerNotifyObserver;
import mqq.os.MqqHandler;

public class VerifyCodeActivity
  extends IphoneTitleBarActivity
{
  final int jdField_a_of_type_Int;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private View jdField_a_of_type_AndroidViewView;
  public ImageView a;
  public TextView a;
  private AppInterface jdField_a_of_type_ComTencentCommonAppAppInterface;
  public ClearableEditText a;
  VerifyCodeManager jdField_a_of_type_MqqManagerVerifyCodeManager;
  public ServerNotifyObserver a;
  public boolean a;
  private TextView b;
  public boolean b;
  
  public VerifyCodeActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 4;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ComTencentCommonAppAppInterface = null;
    jdField_a_of_type_MqqObserverServerNotifyObserver = new knv(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new knz(this);
  }
  
  private void a(Intent paramIntent)
  {
    Object localObject4 = null;
    c();
    for (;;)
    {
      try
      {
        byte[] arrayOfByte = paramIntent.getByteArrayExtra("image");
        localException1.printStackTrace();
      }
      catch (Exception localException1)
      {
        try
        {
          i = paramIntent.getIntExtra("seq", 0);
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            Object localObject3;
            int i = 0;
            paramIntent = null;
            localObject2 = localObject1;
            localObject1 = localException2;
          }
        }
        try
        {
          localObject2 = paramIntent.getStringExtra("key");
        }
        catch (Exception localException3)
        {
          paramIntent = null;
          localObject2 = localObject1;
          localObject1 = localException3;
          break label210;
        }
        try
        {
          localObject3 = paramIntent.getStringExtra("note");
          paramIntent = (Intent)localObject2;
          if (!TextUtils.isEmpty((CharSequence)localObject3)) {
            jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject3);
          }
          localObject2 = paramIntent;
          if (paramIntent == null) {
            localObject2 = "";
          }
          if (arrayOfByte != null) {
            jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(BitmapManager.a(arrayOfByte, 0, arrayOfByte.length));
          }
          jdField_a_of_type_MqqObserverServerNotifyObserver.setSeq(i);
          jdField_a_of_type_MqqObserverServerNotifyObserver.setKey((String)localObject2);
          jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText = ((ClearableEditText)findViewById(2131304329));
          jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.setClearButtonStyle(1);
          jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText.addTextChangedListener(new kny(this));
          jdField_a_of_type_AndroidViewView = findViewById(2131304327);
          jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304328));
          jdField_a_of_type_MqqManagerVerifyCodeManager = ((VerifyCodeManager)jdField_a_of_type_ComTencentCommonAppAppInterface.getManager(6));
          jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
          jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
          return;
        }
        catch (Exception localException4)
        {
          paramIntent = (Intent)localObject2;
          localObject2 = localObject1;
          localObject1 = localException4;
          break label210;
        }
        localException1 = localException1;
        i = 0;
        localObject2 = null;
        paramIntent = null;
      }
      label210:
      localObject3 = localObject4;
      localObject1 = localObject2;
    }
  }
  
  private void c()
  {
    setTitle(2131367224);
    setLeftButton(2131366996, new knw(this));
    setRightHighlightButton(2131368442, new knx(this));
  }
  
  public void a()
  {
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_Boolean = false;
    a(true);
    if (jdField_a_of_type_MqqManagerVerifyCodeManager != null) {
      jdField_a_of_type_MqqManagerVerifyCodeManager.refreVerifyCode(jdField_a_of_type_MqqObserverServerNotifyObserver);
    }
  }
  
  public void a(String paramString)
  {
    jdField_a_of_type_Boolean = true;
    a(true);
    if (jdField_a_of_type_MqqManagerVerifyCodeManager != null) {
      jdField_a_of_type_MqqManagerVerifyCodeManager.submitVerifyCode(jdField_a_of_type_MqqObserverServerNotifyObserver, paramString);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      return;
    }
    jdField_a_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
  }
  
  public void b()
  {
    if (jdField_a_of_type_MqqManagerVerifyCodeManager != null) {
      jdField_a_of_type_MqqManagerVerifyCodeManager.cancelVerifyCode(jdField_a_of_type_MqqObserverServerNotifyObserver);
    }
    finish();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_a_of_type_ComTencentCommonAppAppInterface = app;
    if (jdField_a_of_type_ComTencentCommonAppAppInterface == null) {
      jdField_a_of_type_ComTencentCommonAppAppInterface = ((AppInterface)getAppRuntime());
    }
    paramBundle = super.getIntent();
    if (paramBundle == null)
    {
      super.finish();
      return false;
    }
    setContentView(2130904897);
    setContentBackgroundResource(2130837739);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131304326));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131304330));
    a(paramBundle);
    paramBundle = jdField_a_of_type_ComTencentCommonAppAppInterface.a(LoginActivity.class);
    if (paramBundle != null) {
      paramBundle.sendEmptyMessage(20140107);
    }
    paramBundle = jdField_a_of_type_ComTencentCommonAppAppInterface.a(SubLoginActivity.class);
    if (paramBundle != null) {
      paramBundle.sendEmptyMessage(20140107);
    }
    return true;
  }
  
  public boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4) {
      b();
    }
    return super.doOnKeyDown(paramInt, paramKeyEvent);
  }
}
