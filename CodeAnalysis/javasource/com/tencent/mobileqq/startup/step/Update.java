package com.tencent.mobileqq.startup.step;

import android.app.Activity;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.InstallActivity;
import com.tencent.mobileqq.startup.director.StartupDirector;
import com.tencent.qphone.base.util.QLog;
import mqq.app.AppActivity;

public class Update
  extends Step
  implements Handler.Callback
{
  private static final int M = 4;
  private static final int jdField_a_of_type_Int = 1;
  private static final int[] jdField_a_of_type_ArrayOfInt = { 3, 21, 22, 23, 25, 28, 32, 33 };
  private static final int b = 2;
  private static final int c = 3;
  private int N;
  private int O;
  private int P = 27500;
  private double jdField_a_of_type_Double;
  private long jdField_a_of_type_Long;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  
  public Update() {}
  
  private int a()
  {
    double d2 = (System.currentTimeMillis() - jdField_a_of_type_Long) * 1.0D / P * (O - N) + N;
    double d1;
    if (d2 < N) {
      d1 = N;
    }
    do
    {
      return (int)d1;
      d1 = d2;
    } while (d2 <= O - 10);
    if (jdField_a_of_type_Double < O - 10) {}
    for (jdField_a_of_type_Double = (O - 10);; jdField_a_of_type_Double += (O - jdField_a_of_type_Double) / 10.0D)
    {
      d1 = jdField_a_of_type_Double;
      break;
    }
  }
  
  protected boolean a()
  {
    if (!BaseApplicationImpl.c) {
      return true;
    }
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper(), this);
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(1);
    if (Build.VERSION.SDK_INT < 21)
    {
      String str = System.getProperty("java.vm.version");
      if ((str != null) && (!str.startsWith("1"))) {
        P += 30000;
      }
    }
    try
    {
      Thread.sleep(300L);
      boolean bool = Step.AmStepFactory.b(0, jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector, jdField_a_of_type_ArrayOfInt).c();
      jdField_a_of_type_AndroidOsHandler.removeMessages(2);
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
      return bool;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException.printStackTrace();
      }
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
    case 1: 
    case 2: 
      int i;
      do
      {
        return true;
        Object localObject2 = jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector.a;
        QLog.e("AutoMonitor", 1, "init");
        if (!(localObject2 instanceof InstallActivity))
        {
          if (localObject2 != null) {}
          for (paramMessage = localObject2.toString();; paramMessage = "no activity")
          {
            QLog.e("AutoMonitor", 1, paramMessage);
            return true;
          }
        }
        Object localObject1 = ((Activity)localObject2).findViewById(2131298335);
        localObject2 = (ViewGroup)((Activity)localObject2).findViewById(2131298334);
        if ((localObject1 == null) || (localObject2 == null))
        {
          if (arg1 < 5)
          {
            localObject1 = jdField_a_of_type_AndroidOsHandler;
            localObject2 = jdField_a_of_type_AndroidOsHandler;
            i = arg1 + 1;
            arg1 = i;
            ((Handler)localObject1).sendMessageDelayed(((Handler)localObject2).obtainMessage(1, i, 0), 50L);
            return true;
          }
          QLog.e("AutoMonitor", 1, "no splash");
          return true;
        }
        ((View)localObject1).setVisibility(8);
        jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)View.inflate(jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector.a.getApplicationContext(), 2130904811, null));
        jdField_a_of_type_AndroidWidgetRelativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131304086));
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131304087));
        jdField_a_of_type_AndroidWidgetTextView.setText("升级中，请耐心等待...");
        ((ViewGroup)localObject2).addView(jdField_a_of_type_AndroidWidgetRelativeLayout);
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
        jdField_a_of_type_Long = System.currentTimeMillis();
        N = 0;
        O = 90;
        return true;
        i = a();
        if (jdField_a_of_type_AndroidWidgetProgressBar == null) {
          break;
        }
      } while (jdField_a_of_type_AndroidWidgetProgressBar.getProgress() > i);
      jdField_a_of_type_AndroidWidgetProgressBar.setProgress(i);
      if (jdField_a_of_type_AndroidWidgetTextView != null) {
        jdField_a_of_type_AndroidWidgetTextView.setText(String.format(jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector.a.getString(2131370462), new Object[] { Integer.valueOf(i) }));
      }
      if (i < 99)
      {
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(2, 100L);
        return true;
      }
      jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      jdField_a_of_type_AndroidOsHandler = null;
      return true;
    case 3: 
      jdField_a_of_type_AndroidOsHandler.removeMessages(2);
      N = 90;
      O = 100;
      P = 8000;
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(2);
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(4, P);
      return true;
    }
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    return true;
  }
}
