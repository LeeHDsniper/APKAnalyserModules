package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.text.TextUtils.TruncateAt;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForEnterTroop;
import com.tencent.mobileqq.data.MessageForEnterTroop.User;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kvr;

public class EnterTroopChatItemBuilder
  extends AbstractChatItemBuilder
{
  public EnterTroopChatItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    int j = 0;
    paramOnLongClickAndTouchListener = (kvr)paramViewHolder;
    paramViewHolder = paramView;
    Object localObject1;
    Object localObject2;
    if (paramView == null)
    {
      paramViewHolder = new LinearLayout(paramLinearLayout.getContext());
      paramViewHolder.setOrientation(1);
      paramView = new LinearLayout.LayoutParams(-1, -2);
      topMargin = AIOUtils.a(9.0F, paramLinearLayout.getContext().getResources());
      paramViewHolder.setLayoutParams(paramView);
      localObject1 = new LinearLayout(paramViewHolder.getContext());
      ((LinearLayout)localObject1).setOrientation(0);
      ((LinearLayout)localObject1).setGravity(1);
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)localObject1);
      paramView = new LinearLayout(paramViewHolder.getContext());
      paramView.setOrientation(0);
      localObject2 = new LinearLayout.LayoutParams(-1, -2);
      leftMargin = AIOUtils.a(52.0F, paramLinearLayout.getContext().getResources());
      rightMargin = AIOUtils.a(52.0F, paramLinearLayout.getContext().getResources());
      topMargin = AIOUtils.a(4.0F, paramLinearLayout.getContext().getResources());
      paramViewHolder.addView((View)localObject1, (ViewGroup.LayoutParams)localObject2);
      paramViewHolder.addView(paramView, (ViewGroup.LayoutParams)localObject2);
      b = new TextView(paramView.getContext());
      localObject1 = new LinearLayout.LayoutParams(-1, -2);
      paramView.addView(b, (ViewGroup.LayoutParams)localObject1);
      b.setTextColor(-8355712);
      b.setGravity(1);
      b.setSingleLine();
      b.setEllipsize(TextUtils.TruncateAt.END);
      jdField_a_of_type_JavaUtilList = new ArrayList();
    }
    int i;
    if ((paramMessageRecord instanceof MessageForEnterTroop))
    {
      localObject1 = (MessageForEnterTroop)paramMessageRecord;
      paramMessageRecord = jdField_a_of_type_AndroidContentContext.getString(2131363905);
      localObject2 = mList.iterator();
      for (i = 1; ((Iterator)localObject2).hasNext(); i = 0)
      {
        MessageForEnterTroop.User localUser = (MessageForEnterTroop.User)((Iterator)localObject2).next();
        paramView = paramMessageRecord;
        if (i == 0) {
          paramView = paramMessageRecord + ",";
        }
        paramMessageRecord = paramView + nick;
      }
      b.setText(paramMessageRecord);
      i = mList.size();
      if (i <= 5) {
        break label727;
      }
      i = 5;
    }
    label727:
    for (;;)
    {
      int k = jdField_a_of_type_JavaUtilList.size();
      if (k < i) {
        while (j < i - k)
        {
          paramMessageRecord = new ImageView(jdField_a_of_type_AndroidWidgetLinearLayout.getContext());
          paramMessageRecord.setScaleType(ImageView.ScaleType.FIT_XY);
          int m = AIOUtils.a(26.0F, paramLinearLayout.getContext().getResources());
          paramView = new LinearLayout.LayoutParams(m, m);
          leftMargin = AIOUtils.a(4.0F, paramLinearLayout.getContext().getResources());
          rightMargin = AIOUtils.a(4.0F, paramLinearLayout.getContext().getResources());
          jdField_a_of_type_AndroidWidgetLinearLayout.addView(paramMessageRecord, paramView);
          jdField_a_of_type_JavaUtilList.add(paramMessageRecord);
          j += 1;
        }
      }
      if (k > i)
      {
        j = k;
        while (j > i)
        {
          jdField_a_of_type_AndroidWidgetLinearLayout.removeView((View)jdField_a_of_type_JavaUtilList.get(j - 1));
          jdField_a_of_type_JavaUtilList.remove(j - 1);
          j -= 1;
        }
      }
      paramMessageRecord = jdField_a_of_type_JavaUtilList.iterator();
      paramView = mList.iterator();
      while ((paramMessageRecord.hasNext()) && (paramView.hasNext()))
      {
        paramLinearLayout = (ImageView)paramMessageRecord.next();
        paramOnLongClickAndTouchListener = (MessageForEnterTroop.User)paramView.next();
        paramLinearLayout.setImageDrawable(FaceDrawable.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1, uin));
      }
      return paramViewHolder;
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kvr(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
}
