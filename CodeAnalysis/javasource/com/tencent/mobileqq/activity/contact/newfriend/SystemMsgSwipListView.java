package com.tencent.mobileqq.activity.contact.newfriend;

import android.content.Context;
import android.util.AttributeSet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.SlideDetectListView.OnScrollGroupFloatingListener;
import com.tencent.widget.SwipListView;
import lsy;

public class SystemMsgSwipListView
  extends SwipListView
{
  public static final int b = 0;
  public static final int c = 1;
  public int a;
  private SystemMsgSwipListView.OnScrollToTopListener jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener;
  private SystemMsgSwipListView.OnSlideListener jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnSlideListener;
  private SlideDetectListView.OnScrollGroupFloatingListener jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView$OnScrollGroupFloatingListener;
  
  public SystemMsgSwipListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnSlideListener = null;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener = null;
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView$OnScrollGroupFloatingListener = null;
    super.setOnScrollListener(new lsy(this));
  }
  
  public int a()
  {
    return jdField_a_of_type_Int;
  }
  
  public void setOnScrollToTopListener(SystemMsgSwipListView.OnScrollToTopListener paramOnScrollToTopListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnScrollToTopListener = paramOnScrollToTopListener;
  }
  
  public void setOnSlideListener(SystemMsgSwipListView.OnSlideListener paramOnSlideListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendSystemMsgSwipListView$OnSlideListener = paramOnSlideListener;
  }
}
