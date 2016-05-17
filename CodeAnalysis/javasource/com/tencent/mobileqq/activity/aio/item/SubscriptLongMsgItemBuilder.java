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
import com.tencent.mobileqq.widget.AnimationTextView;

public class SubscriptLongMsgItemBuilder
  extends LongMsgItemBuilder
{
  private static final int h = 2131296485;
  private static final int i = 2131296317;
  Bitmap a;
  
  public SubscriptLongMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    super.a(paramChatMessage, paramViewHolder, paramView, paramBaseChatItemLayout, paramOnLongClickAndTouchListener);
    LongMsgItemBuilder.Holder localHolder = (LongMsgItemBuilder.Holder)paramViewHolder;
    paramBaseChatItemLayout.a();
    paramBaseChatItemLayout.setHeadIconVisible(false);
    Resources localResources = jdField_a_of_type_AndroidContentContext.getResources();
    int j = AIOUtils.a(7.5F, localResources);
    paramBaseChatItemLayout.setPadding(0, j, 0, j);
    if ((paramView != null) && (paramView.findViewById(2131296317) == null)) {
      paramBaseChatItemLayout.removeView(paramView);
    }
    for (paramViewHolder = null;; paramViewHolder = paramView)
    {
      if (paramViewHolder == null)
      {
        paramView = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
        paramView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        paramViewHolder = new RelativeLayout.LayoutParams(-2, -2);
        leftMargin = AIOUtils.a(20.0F, localResources);
        paramView.addView(a, paramViewHolder);
        a.setId(2131296485);
        paramViewHolder = new ImageView(jdField_a_of_type_AndroidContentContext);
        paramViewHolder.setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(selfuin, (byte)3, true));
        paramViewHolder.setBackgroundResource(2130838639);
        j = AIOUtils.a(1.0F, localResources);
        paramViewHolder.setPadding(j, j, j, j);
        paramViewHolder.setId(2131296317);
        paramViewHolder.setClickable(true);
        paramViewHolder.setOnClickListener(this);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(AIOUtils.a(42.0F, localResources), AIOUtils.a(42.0F, localResources));
        topMargin = AIOUtils.a(25.0F, localResources);
        rightMargin = AIOUtils.a(20.0F, localResources);
        localLayoutParams.addRule(11, -1);
        localLayoutParams.addRule(10, -1);
        paramView.addView(paramViewHolder, localLayoutParams);
        paramViewHolder = new TextView(jdField_a_of_type_AndroidContentContext);
        localLayoutParams = new RelativeLayout.LayoutParams(-1, 0);
        localLayoutParams.addRule(3, 2131296485);
        paramView.addView(paramViewHolder, localLayoutParams);
      }
      a.setPadding(0, 0, 0, 0);
      a.setTextSize(2, 16.0F);
      a.setTextColor(-16777216);
      a.setMaxWidth(BaseChatItemLayout.e);
      if (paramChatMessage.isSend()) {
        if (a(paramChatMessage, paramBaseChatItemLayout))
        {
          paramView.setBackgroundColor(Color.parseColor("#cbcbcb"));
          paramChatMessage = paramView.findViewById(2131296317);
          if (paramChatMessage != null) {
            paramChatMessage.setVisibility(0);
          }
          paramChatMessage = paramView.findViewById(2131296485);
          if (paramChatMessage != null)
          {
            ((TextView)paramChatMessage).setLineSpacing(AIOUtils.a(0.0F, localResources), 1.0F);
            paramChatMessage = (RelativeLayout.LayoutParams)paramChatMessage.getLayoutParams();
            if (paramChatMessage != null)
            {
              paramChatMessage.addRule(9, 0);
              paramChatMessage.addRule(7, -1);
              paramChatMessage.addRule(0, 2131296317);
              rightMargin = AIOUtils.a(15.0F, localResources);
              topMargin = AIOUtils.a(38.0F, localResources);
              bottomMargin = AIOUtils.a(22.0F, localResources);
            }
          }
        }
      }
      for (;;)
      {
        paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
        if ((a instanceof AnimationTextView)) {
          a).a = null;
        }
        return paramView;
        paramView.setBackgroundColor(-1);
        break;
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
              break label748;
            }
            paramView.setBackgroundDrawable(paramChatMessage);
          }
          for (;;)
          {
            paramChatMessage = paramView.findViewById(2131296317);
            if (paramChatMessage != null) {
              paramChatMessage.setVisibility(8);
            }
            paramChatMessage = paramView.findViewById(2131296485);
            if (paramChatMessage == null) {
              break;
            }
            ((TextView)paramChatMessage).setLineSpacing(AIOUtils.a(5.0F, localResources), 1.0F);
            paramChatMessage = (RelativeLayout.LayoutParams)paramChatMessage.getLayoutParams();
            if (paramChatMessage == null) {
              break;
            }
            paramChatMessage.addRule(0, 0);
            paramChatMessage.addRule(7, 0);
            paramChatMessage.addRule(9, -1);
            rightMargin = AIOUtils.a(20.0F, localResources);
            topMargin = AIOUtils.a(53.5F, localResources);
            bottomMargin = AIOUtils.a(54.5F, localResources);
            break;
            label748:
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
}
