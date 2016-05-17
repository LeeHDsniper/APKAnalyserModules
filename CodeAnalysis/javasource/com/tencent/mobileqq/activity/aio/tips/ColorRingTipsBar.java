package com.tencent.mobileqq.activity.aio.tips;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vas.IndividuationMarketUrlUtils;
import com.tencent.mobileqq.vaswebviewplugin.VasWebviewUtil;

public class ColorRingTipsBar
  implements View.OnClickListener, TipsBarTask
{
  private static final String jdField_a_of_type_JavaLangString = ColorRingTipsBar.class.getSimpleName();
  private Context jdField_a_of_type_AndroidContentContext;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ColorRingTipsBar(TipsManager paramTipsManager, Context paramContext)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  public int a()
  {
    return 8;
  }
  
  public View a(Object... paramVarArgs)
  {
    return ChatActivityUtils.a(jdField_a_of_type_AndroidContentContext, this);
  }
  
  public void a(int paramInt, Object... paramVarArgs) {}
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 37;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a();
    paramView = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    String str = IndividuationMarketUrlUtils.a(jdField_a_of_type_AndroidContentContext, 10, "mvip.gongneng.anroid.individuation.web") + "&type=" + "colorring";
    VasWebviewUtil.openQQBrowserWithoutAD(jdField_a_of_type_AndroidContentContext, str, 4194304L, paramView, true, -1);
  }
}
