package com.tencent.mobileqq.activity.contact.newfriend;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.adapter.SystemMsgListAdapter;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.SwipRightMenuBuilder;
import java.util.ArrayList;
import java.util.List;
import lsl;

public class SystemMsgItemBaseBuilder
{
  public static final int a = -1;
  public static final String a = "tag_swip_icon_menu_item";
  public static final int[] a;
  public static final int b = -2;
  public static final int[] b = { 2130838247 };
  public static final int c = 0;
  public static final int[] c = { 2131301115 };
  public static final int d = 1;
  public static final int e = 1;
  public static final int f = 0;
  public static final int g = 0;
  public static final int h = 1;
  protected SystemMsgListAdapter a;
  protected SwipRightMenuBuilder a;
  private List a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 2131368024 };
  }
  
  public SystemMsgItemBaseBuilder() {}
  
  public SystemMsgItemBaseBuilder(int paramInt) {}
  
  public int a()
  {
    return 1;
  }
  
  public View a(int paramInt, Object paramObject, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    paramOnLongClickListener = null;
    paramViewGroup = paramOnLongClickListener;
    if (paramView != null)
    {
      paramViewGroup = paramOnLongClickListener;
      if ((paramView.getTag() instanceof SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)) {
        paramViewGroup = (SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder)paramView.getTag();
      }
    }
    if (paramViewGroup == null)
    {
      paramViewGroup = new SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder();
      paramView = a(paramContext, 2130904296, paramViewGroup);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)paramView.findViewById(2131299442));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131299443));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131299515));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296861));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131302176));
      e = ((TextView)paramView.findViewById(2131302177));
      d = ((TextView)paramView.findViewById(2131302178));
      jdField_c_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131301237));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131302180));
      jdField_a_of_type_AndroidWidgetButton = ((Button)paramView.findViewById(2131302179));
      paramView.setTag(paramViewGroup);
    }
    for (;;)
    {
      jdField_c_of_type_Int = paramInt;
      jdField_a_of_type_AndroidViewView.setTag(-1, Integer.valueOf(paramInt));
      jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(-1, Integer.valueOf(paramInt));
      paramOnLongClickListener = (MessageRecord)jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.jdField_a_of_type_JavaUtilList.get(jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.getCount() - paramInt - 1);
      if (paramOnLongClickListener != null) {
        if ((paramOnLongClickListener instanceof MessageForSystemMsg)) {}
      }
      do
      {
        return paramView;
        jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg = ((MessageForSystemMsg)paramOnLongClickListener).getSystemMsg();
        jdField_c_of_type_Long = uniseq;
        a(paramContext, paramView, paramInt, paramObject, paramViewGroup, paramOnClickListener);
        paramView.setTag(-1, Integer.valueOf(paramInt));
        jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseSystemMsgInterface.a(paramViewGroup, paramInt);
        jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838180);
        if (paramInt < jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.jdField_a_of_type_Int) {
          jdField_a_of_type_AndroidViewView.setBackgroundResource(2130838184);
        }
      } while (!QLog.isColorLevel());
      QLog.i("Q.newfriend", 2, "SystemMsgItemBaseBuilder getView ~~~ TAG_POSITION , position = " + paramInt + "holder._id:" + jdField_a_of_type_Long + "   holder.hashCode() = " + paramViewGroup.hashCode());
      return paramView;
    }
  }
  
  public final View a(Context paramContext, int paramInt, SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder)
  {
    View localView = LayoutInflater.from(paramContext).inflate(paramInt, null);
    if (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null)
    {
      if (jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder == null) {
        jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder = a(paramContext);
      }
      return jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder.a(paramContext, localView, paramSystemMsgItemBaseHolder, -1);
    }
    jdField_a_of_type_AndroidViewView = localView;
    jdField_a_of_type_ArrayOfComTencentWidgetSwipRightMenuBuilder$SwipRightMenuItem = null;
    return localView;
  }
  
  public SwipRightMenuBuilder a(Context paramContext)
  {
    int i = paramContext.getResources().getDimensionPixelSize(2131493347);
    int j = paramContext.getResources().getDimensionPixelSize(2131493348);
    int k = a();
    paramContext = c;
    int[] arrayOfInt1 = jdField_a_of_type_ArrayOfInt;
    int[] arrayOfInt2 = b;
    return new lsl(this, k, 2, new int[] { i, j }, -1, paramContext, arrayOfInt1, arrayOfInt2);
  }
  
  public List a(MessageForSystemMsg paramMessageForSystemMsg, Context paramContext)
  {
    if ((paramMessageForSystemMsg == null) || (paramContext == null)) {
      return null;
    }
    int i = mSysmsgMenuFlag;
    paramMessageForSystemMsg = paramContext.getResources();
    if (jdField_a_of_type_JavaUtilList == null) {
      jdField_a_of_type_JavaUtilList = new ArrayList();
    }
    for (;;)
    {
      if ((i & 0xF) == 1) {
        jdField_a_of_type_JavaUtilList.add(paramMessageForSystemMsg.getString(jdField_a_of_type_ArrayOfInt[0]));
      }
      return jdField_a_of_type_JavaUtilList;
      jdField_a_of_type_JavaUtilList.clear();
    }
  }
  
  public void a(Context paramContext, View paramView, int paramInt, Object paramObject, SystemMsgItemBaseBuilder.SystemMsgItemBaseHolder paramSystemMsgItemBaseHolder, View.OnClickListener paramOnClickListener)
  {
    if (jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder != null) {}
    for (int i = jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder.a(paramContext, paramView, paramInt, paramObject, paramSystemMsgItemBaseHolder, paramOnClickListener);; i = 0)
    {
      if ((jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter != null) && (jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.b != -1))
      {
        if (paramInt != jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter.b) {
          paramView.scrollTo(0, 0);
        }
      }
      else {
        return;
      }
      paramView.scrollTo(i, 0);
      return;
    }
  }
  
  public void a(SystemMsgListAdapter paramSystemMsgListAdapter)
  {
    jdField_a_of_type_ComTencentMobileqqAdapterSystemMsgListAdapter = paramSystemMsgListAdapter;
  }
}
