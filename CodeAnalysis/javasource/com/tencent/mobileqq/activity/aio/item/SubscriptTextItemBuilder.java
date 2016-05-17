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
import android.view.View.MeasureSpec;
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

public class SubscriptTextItemBuilder
  extends TextItemBuilder
{
  private static final int h = 2131296483;
  private static final int i = 2131296484;
  private static final int j = 2131296317;
  Bitmap a;
  
  public SubscriptTextItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
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
    TextItemBuilder.Holder localHolder = (TextItemBuilder.Holder)paramViewHolder;
    paramBaseChatItemLayout.a();
    paramBaseChatItemLayout.setHeadIconVisible(false);
    Resources localResources = jdField_a_of_type_AndroidContentContext.getResources();
    int k = AIOUtils.a(7.5F, localResources);
    paramBaseChatItemLayout.setPadding(0, k, 0, k);
    if ((paramView != null) && (paramView.findViewById(2131296483) == null)) {
      paramBaseChatItemLayout.removeView(paramView);
    }
    for (paramViewHolder = null;; paramViewHolder = paramView)
    {
      if (paramViewHolder == null)
      {
        paramView = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
        paramView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        b.setId(2131296483);
        paramView.addView(b);
        paramViewHolder = new ImageView(jdField_a_of_type_AndroidContentContext);
        paramViewHolder.setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(selfuin, (byte)3, true));
        paramViewHolder.setBackgroundResource(2130838639);
        k = AIOUtils.a(1.0F, localResources);
        paramViewHolder.setPadding(k, k, k, k);
        paramViewHolder.setId(2131296317);
        paramViewHolder.setClickable(true);
        paramViewHolder.setOnClickListener(this);
        paramView.addView(paramViewHolder);
        paramViewHolder = new TextView(jdField_a_of_type_AndroidContentContext);
        paramViewHolder.setId(2131296484);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, 0);
        localLayoutParams.addRule(3, 2131296317);
        paramView.addView(paramViewHolder, localLayoutParams);
      }
      b.setPadding(0, 0, 0, 0);
      b.setTextSize(2, 16.0F);
      b.setTextColor(-16777216);
      b.setMaxWidth(BaseChatItemLayout.e);
      if (paramChatMessage.isSend()) {
        if (a(paramChatMessage, paramBaseChatItemLayout))
        {
          paramView.setBackgroundColor(Color.parseColor("#cbcbcb"));
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
          bottomMargin = 0;
          paramViewHolder = paramView.findViewById(2131296483);
          if (paramViewHolder != null)
          {
            paramViewHolder.setLayoutParams(paramChatMessage);
            ((TextView)paramViewHolder).setGravity(3);
            ((TextView)paramViewHolder).setLineSpacing(0.0F, 1.0F);
            paramBaseChatItemLayout = paramView.findViewById(2131296484);
            if (paramBaseChatItemLayout != null)
            {
              paramBaseChatItemLayout = (RelativeLayout.LayoutParams)paramBaseChatItemLayout.getLayoutParams();
              paramViewHolder.measure(View.MeasureSpec.makeMeasureSpec(0, 0), View.MeasureSpec.makeMeasureSpec(0, 0));
              k = paramViewHolder.getMeasuredHeight();
              if (paramBaseChatItemLayout != null)
              {
                if (k + topMargin > AIOUtils.a(55.0F, localResources)) {
                  break label657;
                }
                paramBaseChatItemLayout.addRule(3, 2131296317);
                label592:
                topMargin = AIOUtils.a(25.0F, localResources);
              }
            }
          }
        }
      }
      for (;;)
      {
        paramView.setOnTouchListener(paramOnLongClickAndTouchListener);
        paramView.setOnLongClickListener(paramOnLongClickAndTouchListener);
        paramView.setOnClickListener(b);
        if ((b instanceof AnimationTextView)) {
          b).a = null;
        }
        return paramView;
        paramView.setBackgroundColor(-1);
        break;
        label657:
        paramBaseChatItemLayout.addRule(3, 2131296483);
        break label592;
        if (jdField_a_of_type_AndroidGraphicsBitmap == null) {}
        try
        {
          jdField_a_of_type_AndroidGraphicsBitmap = BitmapFactory.decodeResource(localResources, 2130838634);
          if (jdField_a_of_type_AndroidGraphicsBitmap != null)
          {
            paramViewHolder = new BitmapDrawable(localResources, jdField_a_of_type_AndroidGraphicsBitmap);
            paramViewHolder.setColorFilter(Color.parseColor("#fbfbfb"), PorterDuff.Mode.MULTIPLY);
            paramViewHolder.setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
            paramViewHolder.setDither(true);
            if (Build.VERSION.SDK_INT >= 16) {
              break label1017;
            }
            paramView.setBackgroundDrawable(paramViewHolder);
          }
          for (;;)
          {
            paramViewHolder = paramChatMessage.getExtInfoFromExtStr("welcome_msg");
            if ((paramViewHolder == null) || (!paramViewHolder.equals("true"))) {
              break label1025;
            }
            paramViewHolder = new RelativeLayout.LayoutParams(AIOUtils.a(54.5F, localResources), AIOUtils.a(54.5F, localResources));
            topMargin = AIOUtils.a(30.0F, localResources);
            paramViewHolder.addRule(10, -1);
            paramViewHolder.addRule(14, -1);
            paramBaseChatItemLayout = paramView.findViewById(2131296317);
            if (paramBaseChatItemLayout != null)
            {
              paramBaseChatItemLayout.setLayoutParams(paramViewHolder);
              paramBaseChatItemLayout.setVisibility(0);
              ((ImageView)paramBaseChatItemLayout).setImageBitmap(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(frienduin, (byte)3, true));
            }
            paramChatMessage = new RelativeLayout.LayoutParams(-2, -2);
            paramChatMessage.addRule(3, 2131296317);
            paramChatMessage.addRule(14, -1);
            leftMargin = AIOUtils.a(20.0F, localResources);
            rightMargin = AIOUtils.a(20.0F, localResources);
            topMargin = AIOUtils.a(12.0F, localResources);
            bottomMargin = AIOUtils.a(23.0F, localResources);
            paramViewHolder = paramView.findViewById(2131296483);
            if (paramViewHolder != null)
            {
              paramViewHolder.setLayoutParams(paramChatMessage);
              ((TextView)paramViewHolder).setGravity(17);
              ((TextView)paramViewHolder).setLineSpacing(AIOUtils.a(5.0F, localResources), 1.0F);
            }
            paramChatMessage = paramView.findViewById(2131296484);
            if (paramChatMessage == null) {
              break;
            }
            paramChatMessage = (RelativeLayout.LayoutParams)paramChatMessage.getLayoutParams();
            if (paramChatMessage == null) {
              break;
            }
            paramChatMessage.addRule(3, 2131296483);
            topMargin = 0;
            break;
            label1017:
            paramView.setBackground(paramViewHolder);
          }
          label1025:
          paramChatMessage = paramView.findViewById(2131296317);
          if (paramChatMessage != null) {
            paramChatMessage.setVisibility(8);
          }
          paramChatMessage = new RelativeLayout.LayoutParams(-2, -2);
          paramChatMessage.addRule(9, -1);
          leftMargin = AIOUtils.a(20.0F, localResources);
          rightMargin = AIOUtils.a(20.0F, localResources);
          topMargin = AIOUtils.a(53.5F, localResources);
          bottomMargin = AIOUtils.a(54.5F, localResources);
          paramViewHolder = paramView.findViewById(2131296483);
          if (paramViewHolder != null)
          {
            paramViewHolder.setLayoutParams(paramChatMessage);
            ((TextView)paramViewHolder).setGravity(3);
            ((TextView)paramViewHolder).setLineSpacing(AIOUtils.a(5.0F, localResources), 1.0F);
          }
          paramChatMessage = paramView.findViewById(2131296484);
          if (paramChatMessage != null)
          {
            paramChatMessage = (RelativeLayout.LayoutParams)paramChatMessage.getLayoutParams();
            if (paramChatMessage != null)
            {
              paramChatMessage.addRule(3, 2131296483);
              topMargin = 0;
            }
          }
        }
        catch (OutOfMemoryError paramViewHolder)
        {
          for (;;) {}
        }
      }
    }
  }
}
