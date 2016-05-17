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
import java.util.ArrayList;
import kpb;
import kpc;
import kpd;
import mqq.util.WeakReference;

public class PositionActivatePage
  extends ActivateBasePage
{
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private ActivateFriendGrid.GridCallBack jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack;
  public String a;
  private WeakReference jdField_a_of_type_MqqUtilWeakReference;
  private View.OnClickListener b;
  
  public PositionActivatePage(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack = new kpb(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new kpc(this);
    jdField_b_of_type_AndroidViewView$OnClickListener = new kpd(this);
    jdField_a_of_type_MqqUtilWeakReference = new WeakReference((ActivateFriendActivity)paramContext);
    jdField_b_of_type_AndroidWidgetTextView.setText(2131371030);
    c.setText(2131371032);
    jdField_a_of_type_AndroidWidgetButton.setText(2131371034);
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setGridCallBack(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid$GridCallBack);
    d.setVisibility(0);
    findViewById(2131300826).setOnClickListener(jdField_b_of_type_AndroidViewView$OnClickListener);
  }
  
  public void a()
  {
    jdField_a_of_type_AndroidViewView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903988, this, false);
    jdField_a_of_type_AndroidViewView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300815));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300824));
    c = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300825));
    jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewView.findViewById(2131300818));
    d = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300828));
    e = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300819));
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid = ((ActivateFriendGrid)jdField_a_of_type_AndroidViewView.findViewById(2131300817));
    addView(jdField_a_of_type_AndroidViewView);
  }
  
  public void a(QQAppInterface paramQQAppInterface, long paramLong, String paramString, long[] paramArrayOfLong)
  {
    CharSequence localCharSequence = TimeFormatterUtils.a(getContext(), 3, paramLong);
    jdField_a_of_type_AndroidWidgetTextView.setText(localCharSequence);
    jdField_a_of_type_JavaLangString = paramString;
    c.setText(paramString);
    if (paramArrayOfLong.length > 1)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(2131371030);
      jdField_a_of_type_AndroidWidgetButton.setText(2131371034);
    }
    for (;;)
    {
      paramString = new ArrayList(paramArrayOfLong.length);
      int i = 0;
      while (i < paramArrayOfLong.length)
      {
        paramString.add(new ActivateFriendItem(1, paramArrayOfLong[i]));
        i += 1;
      }
      jdField_b_of_type_AndroidWidgetTextView.setText(2131371031);
      jdField_a_of_type_AndroidWidgetButton.setText(2131371035);
    }
    jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.setData(paramQQAppInterface, paramString);
  }
}
