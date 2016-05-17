package com.tencent.mobileqq.activity.aio.tips;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import lmy;
import lmz;
import lna;
import mqq.os.MqqHandler;

public class LightalkBlueTipsBar
  implements View.OnClickListener, TipsBarTask
{
  public static final String a = "LightalkBlueTipsBar";
  private long jdField_a_of_type_Long;
  private Activity jdField_a_of_type_AndroidAppActivity;
  private BitmapDrawable jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable;
  private View jdField_a_of_type_AndroidViewView;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private boolean jdField_a_of_type_Boolean;
  public String b;
  public String c;
  
  public LightalkBlueTipsBar(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, SessionInfo paramSessionInfo, Activity paramActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = null;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    ThreadManager.a(new lmy(this), 5, null, true);
  }
  
  public static boolean a()
  {
    boolean bool = false;
    if (LightalkBlueTipsBarData.a() != null) {
      bool = true;
    }
    return bool;
  }
  
  public int a()
  {
    return 12;
  }
  
  public View a(Object... paramVarArgs)
  {
    if (QLog.isColorLevel()) {
      QLog.d("LightalkBlueTipsBar", 2, "getBarView()");
    }
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidViewView = LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130903075, null);
      paramVarArgs = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296891);
      if (jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable != null)
      {
        paramVarArgs.setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable);
        paramVarArgs = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131296892);
        if (b == null) {
          break label316;
        }
        if (QLog.isColorLevel()) {
          QLog.d("LightalkBlueTipsBar", 2, "getBarView() mTextWording =" + b);
        }
        paramVarArgs.setText(b);
        paramVarArgs.setContentDescription(b + "点击进入");
        paramVarArgs.setOnClickListener(this);
        paramVarArgs = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131296893);
        if (AppSetting.i) {
          paramVarArgs.setContentDescription("关闭");
        }
        paramVarArgs.setOnClickListener(this);
      }
    }
    for (;;)
    {
      return jdField_a_of_type_AndroidViewView;
      File localFile = new File(LightalkBlueTipsBarData.d);
      if ((localFile != null) && (localFile.exists())) {}
      try
      {
        jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = new BitmapDrawable(jdField_a_of_type_AndroidAppActivity.getResources(), BitmapManager.a(LightalkBlueTipsBarData.d));
        if (QLog.isDevelopLevel()) {
          QLog.i("LightalkBlueTipsBar", 4, "load icon to bitmap ");
        }
        if (jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable != null) {
          paramVarArgs.setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable);
        }
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e("LightalkBlueTipsBar", 2, "decodeFile Failed!", localThrowable);
          }
          jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = ((BitmapDrawable)jdField_a_of_type_AndroidAppActivity.getResources().getDrawable(2130840228));
          localThrowable.printStackTrace();
        }
      }
      return null;
      label316:
      return null;
      jdField_a_of_type_Boolean = false;
    }
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1000) {}
    label7:
    do
    {
      do
      {
        do
        {
          String str;
          do
          {
            do
            {
              break label7;
              break label7;
              break label7;
              do
              {
                return;
              } while (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int != 0);
              if (QLog.isColorLevel()) {
                QLog.d("LightalkBlueTipsBar", 2, "onAIOEvent() : TYPE_ON_SHOW");
              }
              paramVarArgs = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences();
            } while (!paramVarArgs.getBoolean("lightalk_tip_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), false));
            str = paramVarArgs.getString("Lightalk_tips_frdUin", null);
          } while ((str == null) || (!str.equals(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString)));
          paramInt = paramVarArgs.getInt("LT_tip_show_times" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
          if (QLog.isColorLevel()) {
            QLog.d("LightalkBlueTipsBar", 2, "onAIOEvent() : TYPE_ON_SHOW =====> tipsum = " + paramInt);
          }
          if (paramInt < 3) {
            break;
          }
        } while (!(jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a() instanceof LightalkBlueTipsBar));
        jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
        return;
      } while (!jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0]));
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800510F", "0X800510F", 0, 0, "" + (paramInt + 1), "", "", "");
    } while (!jdField_a_of_type_Boolean);
    ThreadManager.b().post(new lmz(this));
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 45;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
      ThreadManager.b().post(new lna(this));
      long l;
      do
      {
        return;
        l = System.currentTimeMillis();
      } while (l - jdField_a_of_type_Long < 200L);
      jdField_a_of_type_Long = l;
      paramView = new Intent(jdField_a_of_type_AndroidAppActivity, QQBrowserActivity.class);
      paramView.putExtra("hide_more_button", true);
      paramView.putExtra("url", c);
      jdField_a_of_type_AndroidAppActivity.startActivity(paramView);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005111", "0X8005111", 0, 0, "", "", "", "");
      continue;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005110", "0X8005110", 0, 0, "", "", "", "");
    }
  }
}
