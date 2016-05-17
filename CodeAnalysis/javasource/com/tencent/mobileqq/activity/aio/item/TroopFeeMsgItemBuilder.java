package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.text.TextPaint;
import android.text.TextUtils.TruncateAt;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.activity.qwallet.QQWalletTransferBubbleView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForTroopFee;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import lbw;
import lbx;

public class TroopFeeMsgItemBuilder
  extends BaseBubbleBuilder
{
  protected int A;
  protected int B;
  protected int C;
  private View.OnClickListener a;
  protected final int h;
  protected final int i;
  protected final int j;
  protected final int k;
  protected final int l;
  protected final int m;
  protected int n;
  protected int o;
  protected int p;
  protected int q;
  protected int r;
  protected int s;
  protected int t;
  protected int u;
  protected int v;
  protected int w;
  protected int x;
  protected int y;
  protected int z;
  
  public TroopFeeMsgItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    h = 2131296492;
    i = 2131296493;
    j = 2131296494;
    k = 2131296495;
    l = 2131296496;
    m = 2131296497;
    jdField_a_of_type_AndroidViewView$OnClickListener = new lbw(this);
    float f = getResourcesgetDisplayMetricsdensity;
    o = ((int)(42.0F * f + 0.5F));
    p = ((int)(21.0F * f + 0.5F));
    q = ((int)(15.0F * f + 0.5F));
    r = ((int)(10.0F * f + 0.5F));
    s = ((int)(9.0F * f + 0.5F));
    t = ((int)(6.0F * f + 0.5F));
    u = ((int)(4.0F * f + 0.5F));
    v = ((int)(1.0F * f + 0.5F));
    n = (r * 23);
    w = ((int)(157.0F * f + 0.5F));
    x = ((int)(65.0F * f + 0.5F));
    y = ((int)(7.0F * f + 0.5F));
    z = ((int)(152.0F * f + 0.5F));
    A = ((int)(5.0F * f + 0.5F));
    B = ((int)(61.0F * f + 0.5F));
    C = ((int)(f * 19.0F + 0.5F));
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 0;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramViewHolder = (lbx)paramViewHolder;
    paramBaseChatItemLayout = (MessageForTroopFee)paramChatMessage;
    if ((jdField_a_of_type_AndroidWidgetRelativeLayout != null) && (jdField_a_of_type_Long == uniseq)) {
      return jdField_a_of_type_AndroidWidgetRelativeLayout;
    }
    QQWalletTransferBubbleView localQQWalletTransferBubbleView;
    float f;
    label210:
    int i1;
    if ((paramView != null) && ((paramView instanceof RelativeLayout)))
    {
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)paramView);
      jdField_a_of_type_JavaLangString = frienduin;
      jdField_a_of_type_Long = uniseq;
      paramView = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296494);
      TextView localTextView1 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296495);
      ImageView localImageView = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296493);
      TextView localTextView2 = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296497);
      localQQWalletTransferBubbleView = (QQWalletTransferBubbleView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296492);
      if (title != null)
      {
        paramView.setTextSize(24.0F);
        TextPaint localTextPaint = paramView.getPaint();
        if (localTextPaint != null)
        {
          f = localTextPaint.measureText(title);
          if (n <= BaseChatItemLayout.h) {
            break label378;
          }
          if (f > BaseChatItemLayout.h - r * 9) {
            paramView.setTextSize(14.0F);
          }
        }
      }
      paramView.setText(title);
      paramView.setTextColor(-1);
      localTextView1.setText(summary);
      localTextView1.setTextColor(-1);
      localTextView2.setText(source);
      localImageView.setImageResource(2130841203);
      i1 = Color.parseColor(backgroundColor);
      if (paramChatMessage.isSend()) {
        break label401;
      }
    }
    label378:
    label401:
    for (boolean bool = true;; bool = false)
    {
      localQQWalletTransferBubbleView.setBubbleBackground(2130841201, i1, bool);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setContentDescription(title + summary + source);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(paramOnLongClickAndTouchListener);
      return jdField_a_of_type_AndroidWidgetRelativeLayout;
      jdField_a_of_type_AndroidWidgetRelativeLayout = a(jdField_a_of_type_AndroidContentContext);
      break;
      if (f <= r * 14) {
        break label210;
      }
      paramView.setTextSize(14.0F);
      break label210;
    }
  }
  
  protected RelativeLayout a(Context paramContext)
  {
    RelativeLayout localRelativeLayout = new RelativeLayout(paramContext);
    localRelativeLayout.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
    Object localObject1 = new QQWalletTransferBubbleView(paramContext);
    ((QQWalletTransferBubbleView)localObject1).setLayoutParams(new RelativeLayout.LayoutParams(n, q * 5));
    ((QQWalletTransferBubbleView)localObject1).setId(2131296492);
    Object localObject2 = new ImageView(paramContext);
    Object localObject3 = new RelativeLayout.LayoutParams(o, o);
    rightMargin = p;
    ((RelativeLayout.LayoutParams)localObject3).addRule(15);
    ((RelativeLayout.LayoutParams)localObject3).addRule(11);
    ((ImageView)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject3);
    ((ImageView)localObject2).setScaleType(ImageView.ScaleType.FIT_CENTER);
    ((ImageView)localObject2).setId(2131296493);
    ((QQWalletTransferBubbleView)localObject1).addView((View)localObject2);
    localObject2 = new LinearLayout(paramContext);
    localObject3 = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject3).addRule(0, 2131296493);
    ((RelativeLayout.LayoutParams)localObject3).addRule(9);
    leftMargin = p;
    rightMargin = t;
    ((RelativeLayout.LayoutParams)localObject3).addRule(15);
    ((LinearLayout)localObject2).setLayoutParams((ViewGroup.LayoutParams)localObject3);
    ((LinearLayout)localObject2).setOrientation(1);
    localObject3 = new TextView(paramContext);
    ((TextView)localObject3).setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
    ((TextView)localObject3).setSingleLine();
    ((TextView)localObject3).setEllipsize(TextUtils.TruncateAt.END);
    ((TextView)localObject3).setTextSize(24.0F);
    ((TextView)localObject3).setId(2131296494);
    ((LinearLayout)localObject2).addView((View)localObject3);
    localObject3 = new TextView(paramContext);
    LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
    topMargin = v;
    ((TextView)localObject3).setLayoutParams(localLayoutParams);
    ((TextView)localObject3).setSingleLine();
    ((TextView)localObject3).setEllipsize(TextUtils.TruncateAt.END);
    ((TextView)localObject3).setTextSize(13.0F);
    ((TextView)localObject3).setId(2131296495);
    ((LinearLayout)localObject2).addView((View)localObject3);
    ((QQWalletTransferBubbleView)localObject1).addView((View)localObject2);
    localRelativeLayout.addView((View)localObject1);
    localObject1 = new RelativeLayout(paramContext);
    localObject2 = new RelativeLayout.LayoutParams(n, -2);
    ((RelativeLayout.LayoutParams)localObject2).addRule(3, 2131296492);
    ((RelativeLayout)localObject1).setLayoutParams((ViewGroup.LayoutParams)localObject2);
    ((RelativeLayout)localObject1).setBackgroundResource(2130841202);
    ((RelativeLayout)localObject1).setId(2131296496);
    paramContext = new TextView(paramContext);
    localObject2 = new RelativeLayout.LayoutParams(-2, -2);
    leftMargin = p;
    rightMargin = p;
    topMargin = q;
    bottomMargin = q;
    ((RelativeLayout.LayoutParams)localObject2).addRule(15);
    paramContext.setLayoutParams((ViewGroup.LayoutParams)localObject2);
    paramContext.setSingleLine();
    paramContext.setEllipsize(TextUtils.TruncateAt.END);
    paramContext.setTextColor(-7500403);
    paramContext.setTextSize(12.0F);
    paramContext.setIncludeFontPadding(false);
    paramContext.setId(2131296497);
    ((RelativeLayout)localObject1).addView(paramContext);
    localRelativeLayout.addView((View)localObject1);
    return localRelativeLayout;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new lbx(this, null);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    paramChatMessage = (MessageForTroopFee)paramChatMessage;
    return title + summary + source;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      super.a(paramInt, paramContext, paramChatMessage);
      return;
    case 2131304463: 
      ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
      return;
    }
    super.b(paramChatMessage);
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    QQCustomMenu localQQCustomMenu = new QQCustomMenu();
    a(AIOUtils.a(paramView), localQQCustomMenu);
    ChatActivityFacade.a(localQQCustomMenu, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(localQQCustomMenu, jdField_a_of_type_AndroidContentContext);
    return localQQCustomMenu.a();
  }
}
