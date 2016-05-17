package com.tencent.mobileqq.activity.aio.tips;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import lmp;

public class ComicTipsBar
  implements TipsBarTask
{
  private static final String b = ComicTipsBar.class.getSimpleName();
  private int jdField_a_of_type_Int = -1;
  private Activity jdField_a_of_type_AndroidAppActivity;
  private TipsManager jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  protected String a;
  private boolean jdField_a_of_type_Boolean = false;
  private String c = "";
  private String d = "";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ComicTipsBar(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Activity paramActivity)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
  }
  
  public int a()
  {
    return 13;
  }
  
  public View a(Object... paramVarArgs)
  {
    View localView = LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130903086, null);
    localView.setOnClickListener(new lmp(this, localView));
    TextView localTextView = (TextView)localView.findViewById(2131296952);
    paramVarArgs = jdField_a_of_type_AndroidAppActivity.getResources().getDisplayMetrics();
    int j = (int)(localTextView.getPaint().measureText(d) / d.length());
    int i;
    if (widthPixels > heightPixels)
    {
      i = heightPixels;
      i = (int)((i - density * 65.0F) / j) - 8;
      if (d.length() > i) {
        d = (d.substring(0, i) + "...");
      }
      if ((jdField_a_of_type_Int < 100) || (jdField_a_of_type_Int > 300)) {
        break label213;
      }
    }
    label213:
    for (paramVarArgs = "正在观看《%s》";; paramVarArgs = "正在阅读《%s》")
    {
      jdField_a_of_type_JavaLangString = String.format(paramVarArgs, new Object[] { d });
      localTextView.setText(jdField_a_of_type_JavaLangString);
      return localView;
      i = widthPixels;
      break;
    }
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    if (paramInt != 1000) {}
    do
    {
      do
      {
        do
        {
          return;
          if (QLog.isColorLevel()) {
            QLog.d(b, 2, "onAIOEvent() : TYPE_ON_SHOW =====>");
          }
          paramVarArgs = jdField_a_of_type_AndroidAppActivity.getIntent().getExtras();
          if (paramVarArgs != null) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d(b, 2, "onAIOEvent() : data == null");
        return;
        jdField_a_of_type_Boolean = paramVarArgs.getBoolean("fromMessage", false);
        c = paramVarArgs.getString("comicId");
        d = paramVarArgs.getString("comicName");
        jdField_a_of_type_Int = paramVarArgs.getInt("type", -1);
        if (!TextUtils.isEmpty(d)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d(b, 2, "onAIOEvent() : comicName is null");
      return;
      jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager.a(this, new Object[0]);
    } while (!QLog.isColorLevel());
    QLog.d(b, 2, "onAIOEvent() : show ReaderTipBar, bookName : " + d);
  }
  
  public int[] a()
  {
    return new int[0];
  }
  
  public int b()
  {
    return 35;
  }
}
