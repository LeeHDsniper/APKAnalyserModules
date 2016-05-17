package com.tencent.mobileqq.activity.aio.rebuild;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.SimpleTextView;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import lhe;
import mqq.os.MqqHandler;

public class HotChatDemoChatPie
  extends HotChatPie
{
  protected static final String ae = "http://play.mobile.qq.com/play/mqqplay/hotchat/jump.html?_bid=2152&hotnamecode=%s";
  protected String af;
  protected LinearLayout b;
  protected int ds;
  protected int dt;
  protected int du;
  protected ImageView g;
  
  public HotChatDemoChatPie(QQAppInterface paramQQAppInterface, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Context paramContext)
  {
    super(paramQQAppInterface, paramViewGroup, paramFragmentActivity, paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    dt = ((int)(15.0F * DeviceInfoUtil.a()));
    ds = ((int)(165.0F * DeviceInfoUtil.a()));
    du = ((int)(35.0F * DeviceInfoUtil.a()));
  }
  
  private String a(String paramString1, String paramString2)
  {
    String str = paramString1;
    if (TextUtils.isEmpty(paramString1))
    {
      paramString2 = ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(paramString2);
      str = paramString1;
      if (paramString2 != null) {
        str = name;
      }
    }
    if (!TextUtils.isEmpty(str)) {}
    for (;;)
    {
      try
      {
        paramString1 = URLEncoder.encode(str, "UTF-8");
        paramString1 = String.format("http://play.mobile.qq.com/play/mqqplay/hotchat/jump.html?_bid=2152&hotnamecode=%s", new Object[] { paramString1 });
        if (QLog.isDevelopLevel()) {
          QLog.i("HotChatDemoChatPie", 4, "makeUrl: " + paramString1);
        }
        return paramString1;
      }
      catch (UnsupportedEncodingException paramString1)
      {
        paramString1.printStackTrace();
        paramString1 = str;
        continue;
      }
      paramString1 = null;
    }
  }
  
  private void a(Drawable paramDrawable)
  {
    if (paramDrawable == null) {}
    do
    {
      do
      {
        return;
        if (b != null) {
          break;
        }
        g = new ImageView(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
        g.setScaleType(ImageView.ScaleType.CENTER_CROP);
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(ds, ds);
        int i = dt;
        rightMargin = i;
        leftMargin = i;
        bottomMargin = i;
        topMargin = i;
        g.setLayoutParams(localLayoutParams);
        g.setImageDrawable(paramDrawable);
        paramDrawable = new SimpleTextView(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
        paramDrawable.setText(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getText(2131371829));
        localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
        bottomMargin = dt;
        gravity = 1;
        paramDrawable.setLayoutParams(localLayoutParams);
        paramDrawable.setTextColor(Color.rgb(119, 119, 119));
        paramDrawable.setTextSize(1, 14.0F);
        paramDrawable.setGravity(1);
        b = new LinearLayout(jdField_a_of_type_AndroidSupportV4AppFragmentActivity);
        b.setOrientation(1);
        b.addView(g);
        b.addView(paramDrawable);
        paramDrawable = new RelativeLayout.LayoutParams(-2, -2);
        paramDrawable.addRule(11);
        paramDrawable.addRule(15);
        rightMargin = du;
        b.setLayoutParams(paramDrawable);
        b.setBackgroundResource(2130840673);
      } while (jdField_a_of_type_AndroidWidgetRelativeLayout == null);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(b);
      return;
    } while (g == null);
    g.setImageDrawable(paramDrawable);
  }
  
  protected void I()
  {
    super.I();
    jdField_a_of_type_AndroidSupportV4AppFragmentActivity.finish();
  }
  
  protected void R()
  {
    super.R();
    if (b == null)
    {
      if (TextUtils.isEmpty(af)) {
        af = a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
      }
      ThreadManager.a().post(new lhe(af, jdField_a_of_type_MqqOsMqqHandler, ds));
    }
  }
  
  protected void a()
  {
    super.a();
    if (jdField_a_of_type_AndroidWidgetLinearLayout != null) {
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    }
  }
  
  protected void d(Intent paramIntent)
  {
    r = true;
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b == null) || (jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b.length() == 0))
    {
      paramIntent = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
      if (paramIntent != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b = troopcode;
      }
    }
    af = a(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
  }
  
  protected void e(Intent paramIntent)
  {
    if (jdField_a_of_type_AndroidWidgetTextView != null)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(2131371827);
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_AndroidSupportV4AppFragmentActivity.getString(2131371827));
      jdField_a_of_type_AndroidWidgetTextView.setBackgroundDrawable(null);
    }
  }
  
  public int h()
  {
    return ds + dt * 2 + du;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (what == 36)
    {
      Drawable localDrawable = null;
      if ((obj instanceof Drawable)) {
        localDrawable = (Drawable)obj;
      }
      if (arg1 == 2) {
        a(localDrawable);
      }
      return true;
    }
    return super.handleMessage(paramMessage);
  }
  
  protected void o()
  {
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
  }
}
