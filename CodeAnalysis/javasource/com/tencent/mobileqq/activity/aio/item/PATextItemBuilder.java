package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import java.util.ArrayList;
import java.util.List;
import kyx;
import kyy;

public class PATextItemBuilder
  extends AbstractChatItemBuilder
{
  View.OnClickListener a;
  
  public PATextItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kyx(this);
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout.setPadding(0, AIOUtils.a(11.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
    paramLinearLayout = paramView;
    if (paramView == null) {
      paramLinearLayout = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903169, null);
    }
    Object localObject2 = (MessageForPubAccount)paramMessageRecord;
    PAMessage localPAMessage = mPAMessage;
    paramMessageRecord = (kyy)paramViewHolder;
    Object localObject3 = items;
    paramViewHolder = (ViewGroup)paramLinearLayout.findViewById(2131297418);
    Object localObject1 = (ImageView)paramLinearLayout.findViewById(2131297420);
    TextView localTextView1 = (TextView)paramLinearLayout.findViewById(2131297419);
    TextView localTextView2 = (TextView)paramLinearLayout.findViewById(2131297421);
    TextView localTextView3 = (TextView)paramLinearLayout.findViewById(2131297423);
    TextView localTextView4 = (TextView)paramLinearLayout.findViewById(2131297424);
    TextView localTextView5 = (TextView)paramLinearLayout.findViewById(2131297425);
    TextView localTextView6 = (TextView)paramLinearLayout.findViewById(2131297426);
    paramView = new ArrayList();
    paramView.add(localTextView2);
    paramView.add(localTextView3);
    paramView.add(localTextView4);
    paramView.add(localTextView5);
    paramView.add(localTextView6);
    localObject3 = (PAMessage.Item)((ArrayList)localObject3).get(0);
    jdField_c_of_type_JavaLangString = url;
    jdField_c_of_type_Int = type;
    jdField_b_of_type_JavaLangString = actionUrl;
    jdField_a_of_type_JavaLangString = nativeJumpString;
    jdField_b_of_type_Int = 6;
    jdField_a_of_type_JavaLangObject = Long.valueOf(uniseq);
    d = iconsString;
    if ((!TextUtils.isEmpty(d)) && (d.contains("1")))
    {
      i = 1;
      localObject2 = localTextView1.getLayoutParams();
      if (i == 0) {
        break label450;
      }
      if ((localObject2 instanceof ViewGroup.MarginLayoutParams))
      {
        localObject2 = (ViewGroup.MarginLayoutParams)localObject2;
        rightMargin = 24;
        localTextView1.setLayoutParams((ViewGroup.LayoutParams)localObject2);
      }
      ((ImageView)localObject1).setVisibility(0);
      label351:
      localTextView1.setText(title);
      localObject1 = digestList;
      if (localObject1 == null) {
        break label526;
      }
    }
    label385:
    label450:
    label526:
    for (int i = ((List)localObject1).size();; i = 0)
    {
      int j = 0;
      if (j < paramView.size())
      {
        localTextView1 = (TextView)paramView.get(j);
        if (i > j)
        {
          localTextView1.setText((CharSequence)((List)localObject1).get(j));
          localTextView1.setVisibility(0);
        }
        for (;;)
        {
          j += 1;
          break label385;
          i = 0;
          break;
          if ((localObject2 instanceof ViewGroup.MarginLayoutParams))
          {
            localObject2 = (ViewGroup.MarginLayoutParams)localObject2;
            rightMargin = 0;
            localTextView1.setLayoutParams((ViewGroup.LayoutParams)localObject2);
          }
          ((ImageView)localObject1).setVisibility(8);
          break label351;
          localTextView1.setVisibility(8);
        }
      }
      paramViewHolder.setTag(paramMessageRecord);
      paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
      paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
      return paramLinearLayout;
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kyy(this);
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      return;
    }
    paramContext = ChatActivityFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    if ((paramContext != null) && (uniseq == uniseq)) {
      ChatActivityFacade.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo);
    }
    paramContext = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    Context localContext = jdField_a_of_type_AndroidContentContext;
    String str = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString;
    paramInt = jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_Int;
    long l = uniseq;
    if (issend == 1) {}
    for (;;)
    {
      PublicAccountUtil.a(paramContext, localContext, str, paramInt, l, bool);
      return;
      bool = false;
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131304463, jdField_a_of_type_AndroidContentContext.getString(2131367614));
    return paramView.a();
  }
}
