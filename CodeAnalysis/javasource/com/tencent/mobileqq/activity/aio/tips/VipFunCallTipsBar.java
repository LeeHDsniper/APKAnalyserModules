package com.tencent.mobileqq.activity.aio.tips;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import lnm;

public class VipFunCallTipsBar
  implements TipsBarTask
{
  private static final String b = ColorRingTipsBar.class.getSimpleName();
  private Context jdField_a_of_type_AndroidContentContext;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  public TipsManager a;
  public QQAppInterface a;
  public String a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public VipFunCallTipsBar(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Context paramContext, String paramString, View.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public int a()
  {
    return 10;
  }
  
  public View a(Object... paramVarArgs)
  {
    paramVarArgs = (RelativeLayout)LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903153, null);
    ImageView localImageView1 = (ImageView)paramVarArgs.findViewById(2131297329);
    TextView localTextView = (TextView)paramVarArgs.findViewById(2131297330);
    ImageView localImageView2 = (ImageView)paramVarArgs.findViewById(2131297331);
    localTextView.setText(jdField_a_of_type_AndroidContentContext.getResources().getString(2131367578));
    localImageView1.setImageResource(2130840227);
    paramVarArgs.setContentDescription(jdField_a_of_type_AndroidContentContext.getResources().getString(2131367578));
    paramVarArgs.setOnClickListener(new lnm(this));
    localImageView2.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    return paramVarArgs;
  }
  
  public void a(int paramInt, Object... paramVarArgs) {}
  
  public void a(String paramString)
  {
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 36;
  }
}
