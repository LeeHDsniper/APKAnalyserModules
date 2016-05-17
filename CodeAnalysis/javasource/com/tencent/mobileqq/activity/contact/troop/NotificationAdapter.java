package com.tencent.mobileqq.activity.contact.troop;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.contact.newfriend.BaseSystemMsgInterface;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.mobileqq.widget.SlideDetectListView;
import com.tencent.widget.XBaseAdapter;
import java.util.ArrayList;
import java.util.List;
import ltb;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class NotificationAdapter
  extends XBaseAdapter
{
  public int a;
  private Context jdField_a_of_type_AndroidContentContext;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private BaseSystemMsgInterface jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseSystemMsgInterface;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public SlideDetectListView a;
  public List a;
  private List b;
  
  public NotificationAdapter(Context paramContext, QQAppInterface paramQQAppInterface, BaseSystemMsgInterface paramBaseSystemMsgInterface, int paramInt, SlideDetectListView paramSlideDetectListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = new ArrayList();
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_AndroidViewView$OnClickListener = new ltb(this);
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseSystemMsgInterface = paramBaseSystemMsgInterface;
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView = paramSlideDetectListView;
  }
  
  private boolean a(structmsg.StructMsg paramStructMsg)
  {
    boolean bool = false;
    if (paramStructMsg != null)
    {
      int i = msg_type.get();
      long l1 = msg_seq.get();
      long l2 = req_uin.get();
      int j = msg.sub_type.get();
      int k = msg.src_id.get();
      int m = msg.sub_src_id.get();
      int n = msg.group_msg_type.get();
      structmsg.SystemMsgActionInfo localSystemMsgActionInfo = new structmsg.SystemMsgActionInfo();
      group_code.set(msg.group_code.get());
      sig.set(ByteStringMicro.EMPTY);
      type.set(15);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(i, l1, l2, j, k, m, n, (structmsg.SystemMsgActionInfo)localSystemMsgActionInfo.get(), 3);
      bool = true;
    }
    return bool;
  }
  
  public void a()
  {
    if (b != null) {
      b.clear();
    }
  }
  
  public void a(List paramList)
  {
    b = paramList;
  }
  
  public int getCount()
  {
    int i = 0;
    if (b != null) {
      i = b.size();
    }
    return i;
  }
  
  public Object getItem(int paramInt)
  {
    if ((b == null) || (paramInt > b.size())) {
      return null;
    }
    return b.get(getCount() - paramInt - 1);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    label190:
    MessageRecord localMessageRecord;
    if (paramView == null)
    {
      paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903657, paramViewGroup, false);
      paramViewGroup = new NotificationAdapter.ViewHolder();
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)paramView.findViewById(2131299521));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131299522));
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)paramView.findViewById(2131299524));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131299525));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131299526));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131299527));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131299528));
      jdField_a_of_type_AndroidWidgetButton = ((Button)paramView.findViewById(2131299523));
      jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout = ((ShaderAnimLayout)paramView.findViewById(2131299529));
      ((Button)paramView.findViewById(2131299530)).setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      paramView.setTag(paramViewGroup);
      jdField_b_of_type_Int = paramInt;
      if (paramInt >= jdField_a_of_type_Int) {
        break label226;
      }
      paramView.setBackgroundResource(2130838184);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundResource(2130838184);
      localMessageRecord = (MessageRecord)getItem(paramInt);
      if ((localMessageRecord != null) && ((localMessageRecord instanceof MessageForSystemMsg))) {
        break label246;
      }
    }
    for (;;)
    {
      return paramView;
      paramViewGroup = (NotificationAdapter.ViewHolder)paramView.getTag();
      break;
      label226:
      paramView.setBackgroundResource(2130838180);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setBackgroundResource(2130838180);
      break label190;
      label246:
      jdField_a_of_type_TencentMobileimStructmsgStructmsg$StructMsg = ((MessageForSystemMsg)localMessageRecord).getSystemMsg();
      jdField_c_of_type_Long = uniseq;
      if (localMessageRecord != null) {}
      for (int i = getSystemMsgmsg_type.get(); i == 2; i = 2)
      {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseSystemMsgInterface.a(paramViewGroup, paramInt);
        return paramView;
      }
    }
  }
  
  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
  }
}
