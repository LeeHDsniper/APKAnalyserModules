package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.SpannableString;
import android.text.TextUtils.TruncateAt;
import android.text.style.ImageSpan;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.common.util.Util;
import com.tencent.biz.pubaccount.util.PubAccountHttpDownloader;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import java.util.ArrayList;
import kyt;
import kyu;

public class PAMultiItemBuilder
  extends AbstractChatItemBuilder
{
  View.OnClickListener a;
  
  public PAMultiItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kyt(this);
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramView = new LinearLayout(jdField_a_of_type_AndroidContentContext);
    ((LinearLayout)paramView).setOrientation(1);
    paramLinearLayout = (MessageForPubAccount)paramMessageRecord;
    PAMessage localPAMessage = mPAMessage;
    int k = (int)(1.0F * BaseChatItemLayout.d);
    ArrayList localArrayList = items;
    ViewGroup localViewGroup = (ViewGroup)paramView;
    if (grayTips != null)
    {
      paramMessageRecord = new TextView(jdField_a_of_type_AndroidContentContext);
      paramMessageRecord.setText(grayTips);
      paramMessageRecord.setGravity(17);
      paramMessageRecord.setSingleLine();
      paramMessageRecord.setEllipsize(TextUtils.TruncateAt.MIDDLE);
      paramViewHolder = new LinearLayout.LayoutParams(-2, -2);
      leftMargin = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 55.0F);
      topMargin = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 10.0F);
      rightMargin = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 55.0F);
      bottomMargin = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 10.0F);
      gravity = 17;
      paramMessageRecord.setLayoutParams(paramViewHolder);
      paramMessageRecord.setBackgroundResource(2130840217);
      paramMessageRecord.setPadding(DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 9.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 4.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 9.0F), DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 4.0F));
      paramMessageRecord.setTextColor(-1);
      paramMessageRecord.setTextSize(12.0F);
      localViewGroup.addView(paramMessageRecord);
    }
    int i = 0;
    label351:
    ImageView localImageView;
    if (i < localArrayList.size())
    {
      kyu localKyu = new kyu(this);
      paramViewHolder = (PAMessage.Item)localArrayList.get(i);
      jdField_b_of_type_Int = 5;
      jdField_c_of_type_JavaLangString = url;
      jdField_c_of_type_Int = type;
      jdField_b_of_type_JavaLangString = actionUrl;
      jdField_a_of_type_JavaLangString = nativeJumpString;
      jdField_a_of_type_Long = uniseq;
      d = i;
      int j;
      if (i == 0)
      {
        paramMessageRecord = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903167, null);
        TextView localTextView = (TextView)paramMessageRecord.findViewById(2131297403);
        localImageView = (ImageView)paramMessageRecord.findViewById(2131297404);
        String str = Util.d(title);
        localTextView.setText(str);
        if (mVideoFlag == 1)
        {
          Object localObject = jdField_a_of_type_AndroidContentContext.getResources();
          if (i != 0) {
            break label771;
          }
          j = 2130839277;
          label415:
          localObject = ((Resources)localObject).getDrawable(j);
          j = DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 5.0F);
          ((Drawable)localObject).setBounds(j, 0, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 17.0F) + j, DisplayUtil.a(jdField_a_of_type_AndroidContentContext, 20.0F));
          SpannableString localSpannableString = new SpannableString(str + "1");
          localSpannableString.setSpan(new ImageSpan((Drawable)localObject, 0), str.length(), str.length() + 1, 17);
          localTextView.setText(localSpannableString);
        }
        if (i != 0) {
          break label779;
        }
      }
      for (;;)
      {
        try
        {
          j = jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().widthPixels;
          int m = AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources());
          int n = AIOUtils.a(150.0F, jdField_a_of_type_AndroidContentContext.getResources());
          paramViewHolder = URLDrawable.getDrawable(PubAccountHttpDownloader.a(cover, 0), j - m, n);
          localImageView.setImageDrawable(paramViewHolder);
        }
        catch (Exception paramViewHolder)
        {
          label771:
          label779:
          localImageView.setImageResource(2130837565);
          continue;
        }
        localViewGroup.addView(paramMessageRecord);
        paramMessageRecord.setTag(localKyu);
        paramMessageRecord.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        paramMessageRecord.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramMessageRecord.setOnLongClickListener(paramOnLongClickAndTouchListener);
        i += 1;
        break;
        if (i == localArrayList.size() - 1)
        {
          paramMessageRecord = new ImageView(jdField_a_of_type_AndroidContentContext);
          paramMessageRecord.setLayoutParams(new ViewGroup.LayoutParams(-1, k));
          paramMessageRecord.setBackgroundResource(2130838605);
          localViewGroup.addView(paramMessageRecord);
          paramMessageRecord = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903165, null);
          break label351;
        }
        paramMessageRecord = new ImageView(jdField_a_of_type_AndroidContentContext);
        paramMessageRecord.setLayoutParams(new ViewGroup.LayoutParams(-1, k));
        paramMessageRecord.setBackgroundResource(2130838605);
        localViewGroup.addView(paramMessageRecord);
        paramMessageRecord = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903166, null);
        break label351;
        j = 2130839278;
        break label415;
        j = AIOUtils.a(50.0F, jdField_a_of_type_AndroidContentContext.getResources());
        paramViewHolder = URLDrawable.getDrawable(PubAccountHttpDownloader.a(cover, 0), j, j);
      }
    }
    return paramView;
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kyu(this);
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
