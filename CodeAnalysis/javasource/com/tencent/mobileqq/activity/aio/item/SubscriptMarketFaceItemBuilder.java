package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build.VERSION;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SubscriptMarketFaceItemBuilder
  extends MarketFaceItemBuilder
{
  Bitmap a;
  
  public SubscriptMarketFaceItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout.a();
    paramBaseChatItemLayout.setHeadIconVisible(false);
    Resources localResources = b.getResources();
    int i = AIOUtils.a(7.5F, localResources);
    paramBaseChatItemLayout.setPadding(0, i, 0, i);
    if ((paramView != null) && (paramView.findViewById(2131296487) == null))
    {
      paramBaseChatItemLayout.removeView(paramView);
      paramView = null;
    }
    for (;;)
    {
      if (paramView == null)
      {
        RelativeLayout localRelativeLayout = new RelativeLayout(b);
        localRelativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        paramViewHolder = super.a(paramChatMessage, paramViewHolder, paramView, paramBaseChatItemLayout, paramOnLongClickAndTouchListener);
        paramViewHolder.setId(2131296487);
        localRelativeLayout.addView(paramViewHolder);
        paramViewHolder = new ImageView(b);
        paramViewHolder.setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(selfuin, (byte)3, true));
        paramViewHolder.setBackgroundResource(2130838639);
        i = AIOUtils.a(1.0F, localResources);
        paramViewHolder.setPadding(i, i, i, i);
        paramViewHolder.setId(2131296317);
        paramViewHolder.setClickable(true);
        paramViewHolder.setOnClickListener(this);
        localRelativeLayout.addView(paramViewHolder);
        paramViewHolder = new TextView(b);
        paramView = new RelativeLayout.LayoutParams(-1, 0);
        paramView.addRule(3, 2131296487);
        localRelativeLayout.addView(paramViewHolder, paramView);
        paramView = localRelativeLayout;
        if (!paramChatMessage.isSend()) {
          break label543;
        }
        if (!a(paramChatMessage, paramBaseChatItemLayout)) {
          break label535;
        }
        paramView.setBackgroundColor(Color.parseColor("#cbcbcb"));
        label259:
        paramViewHolder = new RelativeLayout.LayoutParams(AIOUtils.a(42.0F, localResources), AIOUtils.a(42.0F, localResources));
        topMargin = AIOUtils.a(25.0F, localResources);
        rightMargin = AIOUtils.a(20.0F, localResources);
        paramViewHolder.addRule(11, -1);
        paramViewHolder.addRule(10, -1);
        paramBaseChatItemLayout = paramView.findViewById(2131296317);
        if (paramBaseChatItemLayout != null)
        {
          paramBaseChatItemLayout.setLayoutParams(paramViewHolder);
          paramBaseChatItemLayout.setVisibility(0);
          ((ImageView)paramBaseChatItemLayout).setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(selfuin, (byte)3, true));
        }
        paramChatMessage = new RelativeLayout.LayoutParams(-2, -2);
        paramChatMessage.addRule(7, -1);
        paramChatMessage.addRule(0, 2131296317);
        leftMargin = AIOUtils.a(20.0F, localResources);
        rightMargin = AIOUtils.a(15.0F, localResources);
        topMargin = AIOUtils.a(38.0F, localResources);
        bottomMargin = AIOUtils.a(22.0F, localResources);
        paramViewHolder = paramView.findViewById(2131296487);
        if (paramViewHolder != null) {
          paramViewHolder.setLayoutParams(paramChatMessage);
        }
      }
      for (;;)
      {
        paramChatMessage = paramView.findViewById(2131296487);
        if (paramChatMessage != null)
        {
          paramChatMessage = paramChatMessage.findViewById(2131296370);
          if (paramChatMessage != null)
          {
            paramChatMessage.setOnClickListener(null);
            paramChatMessage.setClickable(false);
            paramChatMessage.setOnTouchListener(null);
            paramChatMessage.setOnLongClickListener(null);
            paramChatMessage.setLongClickable(false);
          }
        }
        paramView.setOnClickListener(this);
        paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
        return paramView;
        super.a(paramChatMessage, paramViewHolder, paramView.findViewById(2131296487), paramBaseChatItemLayout, paramOnLongClickAndTouchListener);
        break;
        label535:
        paramView.setBackgroundColor(-1);
        break label259;
        label543:
        if (jdField_a_of_type_AndroidGraphicsBitmap == null) {}
        try
        {
          jdField_a_of_type_AndroidGraphicsBitmap = BitmapFactory.decodeResource(localResources, 2130838634);
          if (jdField_a_of_type_AndroidGraphicsBitmap != null)
          {
            paramChatMessage = new BitmapDrawable(localResources, jdField_a_of_type_AndroidGraphicsBitmap);
            paramChatMessage.setColorFilter(Color.parseColor("#fbfbfb"), PorterDuff.Mode.MULTIPLY);
            paramChatMessage.setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
            paramChatMessage.setDither(true);
            if (Build.VERSION.SDK_INT >= 16) {
              break label721;
            }
            paramView.setBackgroundDrawable(paramChatMessage);
          }
          for (;;)
          {
            paramChatMessage = paramView.findViewById(2131296317);
            if (paramChatMessage != null) {
              paramChatMessage.setVisibility(8);
            }
            paramChatMessage = new RelativeLayout.LayoutParams(-2, -2);
            paramChatMessage.addRule(9, -1);
            leftMargin = AIOUtils.a(20.0F, localResources);
            rightMargin = AIOUtils.a(20.0F, localResources);
            topMargin = AIOUtils.a(53.5F, localResources);
            bottomMargin = AIOUtils.a(53.5F, localResources);
            paramViewHolder = paramView.findViewById(2131296487);
            if (paramViewHolder == null) {
              break;
            }
            paramViewHolder.setLayoutParams(paramChatMessage);
            break;
            label721:
            paramView.setBackground(paramChatMessage);
          }
        }
        catch (OutOfMemoryError paramChatMessage)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131296325)
    {
      if ((paramView.findViewById(2131296487) != null) && (paramView.findViewById(2131296487).findViewById(2131296370) != null)) {
        super.onClick(paramView.findViewById(2131296487).findViewById(2131296370));
      }
      return;
    }
    super.onClick(paramView);
  }
}
