package com.tencent.mobileqq.activity.activateFriend;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ActivateFriendItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import koz;
import kpa;
import mqq.util.WeakReference;

public class BirthdayActivatePage
  extends ActivateBasePage
{
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private ActivateFriendGrid.GridCallBack jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack;
  private WeakReference jdField_a_of_type_MqqUtilWeakReference;
  public long[] a;
  
  public BirthdayActivatePage(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfLong = null;
    jdField_a_of_type_AndroidViewView$OnClickListener = new koz(this);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack = new kpa(this);
    jdField_a_of_type_MqqUtilWeakReference = new WeakReference((ActivateFriendActivity)paramContext);
    jdField_a_of_type_AndroidWidgetButton.setText(2131371041);
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setGridCallBack(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack);
    e.setVisibility(0);
  }
  
  public void a()
  {
    jdField_a_of_type_AndroidViewView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903987, this, false);
    jdField_a_of_type_AndroidViewView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300815));
    jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewView.findViewById(2131300818));
    d = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300828));
    e = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300819));
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = ((ActivateFriendGrid)jdField_a_of_type_AndroidViewView.findViewById(2131300817));
    addView(jdField_a_of_type_AndroidViewView);
  }
  
  public void a(QQAppInterface paramQQAppInterface, long paramLong, long[] paramArrayOfLong1, String[] paramArrayOfString, long[] paramArrayOfLong2)
  {
    int i = 0;
    Object localObject = TimeFormatterUtils.a(getContext(), 3, paramLong);
    jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
    jdField_a_of_type_ArrayOfLong = paramArrayOfLong1;
    if (paramArrayOfLong1 == null)
    {
      findViewById(2131300820).setVisibility(0);
      findViewById(2131300816).setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setData(paramQQAppInterface, new ArrayList());
      return;
    }
    findViewById(2131300820).setVisibility(8);
    findViewById(2131300816).setVisibility(0);
    localObject = new ArrayList(paramArrayOfLong1.length);
    while (i < paramArrayOfString.length)
    {
      ActivateFriendItem localActivateFriendItem = new ActivateFriendItem(2, paramArrayOfLong1[i]);
      birthdayDesc = paramArrayOfString[i];
      birthSendTime = paramArrayOfLong2[i];
      ((ArrayList)localObject).add(localActivateFriendItem);
      i += 1;
    }
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setData(paramQQAppInterface, (ArrayList)localObject);
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d(BirthdayActivatePage.class.getSimpleName(), 2, "showLoading ");
    }
    findViewById(2131300813).setVisibility(8);
    findViewById(2131300820).setVisibility(8);
    findViewById(2131300821).setVisibility(0);
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d(BirthdayActivatePage.class.getSimpleName(), 2, "hideLoading ");
    }
    findViewById(2131300813).setVisibility(0);
    if (jdField_a_of_type_ArrayOfLong == null) {
      findViewById(2131300820).setVisibility(0);
    }
    for (;;)
    {
      findViewById(2131300821).setVisibility(8);
      return;
      findViewById(2131300820).setVisibility(8);
    }
  }
}
