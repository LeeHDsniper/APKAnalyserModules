package com.tencent.mobileqq.activity.contact;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import com.tencent.mobileqq.adapter.BuddyListAdapter.BuddyChildTag;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.RichStatus;
import com.tencent.widget.SingleLineTextView;
import java.util.HashMap;
import java.util.Map;

public class FriendItemLayout
  extends FrameLayout
{
  private static int jdField_a_of_type_Int;
  private static Map jdField_a_of_type_JavaUtilMap = new HashMap(5);
  private BuddyListAdapter.BuddyChildTag jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public FriendItemLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public FriendItemLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void a()
  {
    int j = jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_ComTencentMobileqqActivityContactSimpleTextView.getLayoutParams()).leftMargin;
    Object localObject = jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_ComTencentMobileqqActivityContactSimpleTextView.a();
    int i;
    if (jdField_a_of_type_JavaUtilMap.containsKey(localObject)) {
      i = ((Integer)jdField_a_of_type_JavaUtilMap.get(localObject)).intValue();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_ComTencentMobileqqActivityContactSimpleTextView.setFixedWidth(i);
      j += i + jdField_a_of_type_Int;
      i = j;
      if (jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_AndroidWidgetImageView.getVisibility() != 8)
      {
        localObject = (FrameLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
        leftMargin = j;
        i = width + jdField_a_of_type_Int + j;
      }
      j = i;
      if (jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.b.getVisibility() != 8)
      {
        localObject = (FrameLayout.LayoutParams)jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.b.getLayoutParams();
        leftMargin = i;
        j = i + (width + jdField_a_of_type_Int);
      }
      jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_ComTencentWidgetSingleLineTextView.getLayoutParams()).leftMargin = j;
      return;
      i = (int)jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_ComTencentMobileqqActivityContactSimpleTextView.a().measureText((CharSequence)localObject, 0, ((CharSequence)localObject).length());
      jdField_a_of_type_JavaUtilMap.put(localObject, Integer.valueOf(i));
    }
  }
  
  public BuddyListAdapter.BuddyChildTag a()
  {
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag = new BuddyListAdapter.BuddyChildTag();
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131296683));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_c_of_type_ComTencentWidgetSingleLineTextView = ((SingleLineTextView)findViewById(2131297636));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_ComTencentMobileqqActivityContactSimpleTextView = ((SimpleTextView)findViewById(2131297637));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297638));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.b = ((ImageView)findViewById(2131297639));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_ComTencentWidgetSingleLineTextView = ((SingleLineTextView)findViewById(2131297640));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_c_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297635));
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_ComTencentWidgetSingleLineTextView.setExtendTextColor(RichStatus.a, 1);
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_ComTencentWidgetSingleLineTextView.setExtendTextSize(12.0F, 1);
    jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag.jdField_d_of_type_ComTencentWidgetSingleLineTextView.setGravity(19);
    if (jdField_a_of_type_Int == 0) {
      jdField_a_of_type_Int = getContext().getResources().getDimensionPixelSize(2131493077);
    }
    return jdField_a_of_type_ComTencentMobileqqAdapterBuddyListAdapter$BuddyChildTag;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    a();
    super.onMeasure(paramInt1, paramInt2);
  }
}
