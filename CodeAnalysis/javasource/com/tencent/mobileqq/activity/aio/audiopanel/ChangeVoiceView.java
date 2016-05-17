package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.util.DisplayUtil;

public class ChangeVoiceView
  extends RelativeLayout
{
  public static final int a = 0;
  public static final String a;
  public static String[] a;
  public static final int b = 1;
  public static String b;
  public static final int c = 2;
  private long jdField_a_of_type_Long = 0L;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private CircleProgressView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView;
  private VolumeIndicateSquareView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private TextView b;
  public int d;
  public int e = 0;
  private int f = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = ChangeVoiceView.class.getSimpleName();
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "原声音效", "萝莉音效", "大叔音效", "惊悚音效", "搞怪音效", "空灵音效" };
    jdField_b_of_type_JavaLangString = "停止";
  }
  
  public ChangeVoiceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public int a()
  {
    return d;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    jdField_a_of_type_Long = 0L;
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
    if (paramInt == 2) {
      setContentDescription(jdField_b_of_type_JavaLangString);
    }
    while (e == paramInt)
    {
      return;
      if (paramInt == 1) {
        setContentDescription(getContext().getString(2131362076) + " " + jdField_a_of_type_ArrayOfJavaLangString[d]);
      } else {
        setContentDescription(jdField_a_of_type_ArrayOfJavaLangString[d]);
      }
    }
    e = paramInt;
    if (paramInt == 0)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setVisibility(8);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(2130837684);
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(getContext().getResources().getColor(2131427617));
    }
    for (;;)
    {
      jdField_b_of_type_AndroidWidgetTextView.setPadding(f, 0, f, 0);
      return;
      if (paramInt == 1)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
        jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(2130837685);
        jdField_b_of_type_AndroidWidgetTextView.setTextColor(-1);
        if ((AppSetting.i) && (getVisibility() == 0)) {
          AccessibilityUtil.a(this, getContext().getString(2131362076));
        }
      }
      else if (paramInt == 2)
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
        jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(2130837685);
        jdField_b_of_type_AndroidWidgetTextView.setTextColor(-1);
      }
    }
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(paramInt1);
    if (jdField_a_of_type_Long == 0L) {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
    }
    while (SystemClock.uptimeMillis() - jdField_a_of_type_Long >= 75L)
    {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
      StringBuilder localStringBuilder = new StringBuilder();
      paramInt2 /= 1000;
      paramInt1 = paramInt2 / 60;
      paramInt2 %= 60;
      localStringBuilder.append(paramInt1).append(":");
      if (paramInt2 < 10) {
        localStringBuilder.append("0");
      }
      localStringBuilder.append(paramInt2);
      if (!localStringBuilder.equals(jdField_a_of_type_AndroidWidgetTextView.getText())) {
        jdField_a_of_type_AndroidWidgetTextView.setText(localStringBuilder);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a(paramInt3);
      return;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, int paramInt)
  {
    int i = 0;
    f = DisplayUtil.a(getContext(), 4.0F);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    d = paramInt;
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300848));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300853));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView = ((CircleProgressView)findViewById(2131300849));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setStrokeWidth(4);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300851));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131300852));
    switch (d)
    {
    default: 
      paramInt = 0;
    }
    for (;;)
    {
      jdField_a_of_type_AndroidWidgetImageView.setImageResource(i);
      jdField_b_of_type_AndroidWidgetTextView.setText(paramInt);
      return;
      i = 2130837681;
      paramInt = 2131371765;
      continue;
      i = 2130837678;
      paramInt = 2131371766;
      continue;
      i = 2130837680;
      paramInt = 2131371767;
      continue;
      i = 2130837683;
      paramInt = 2131371768;
      continue;
      i = 2130837682;
      paramInt = 2131371769;
      continue;
      i = 2130837679;
      paramInt = 2131371770;
    }
  }
  
  public int b()
  {
    return e;
  }
}
