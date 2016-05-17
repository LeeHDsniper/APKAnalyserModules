package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils.TruncateAt;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.image.URLDrawableDownListener;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ApolloMessage;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForApollo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.net.URL;
import kuv;

public class ApolloItemBuilder
  extends BaseBubbleBuilder
  implements URLDrawableDownListener
{
  public static final String b = "ApolloItemBuilder";
  public static final String c = "apollo_gif";
  private View.OnClickListener a;
  public float b;
  
  public ApolloItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = (12.0F * (DeviceInfoUtil.d() / 160) / 2.0F);
    jdField_a_of_type_AndroidViewView$OnClickListener = new kuv(this);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = (ApolloItemBuilder.Holder)paramChatMessage.getTag();
    paramViewGroup = jdField_a_of_type_AndroidContentContext.getResources();
    if (jdField_a_of_type_AndroidWidgetTextView == null)
    {
      paramOnLongClickAndTouchListener = jdField_a_of_type_ComTencentMobileqqActivityAioBaseChatItemLayout;
      TextView localTextView = new TextView(jdField_a_of_type_AndroidContentContext);
      localTextView.setSingleLine(true);
      localTextView.setGravity(16);
      localTextView.setEllipsize(TextUtils.TruncateAt.END);
      localTextView.setTextColor(-1);
      localTextView.setTextSize(2, 12.0F);
      localTextView.setPadding(AIOUtils.a(5.0F, paramViewGroup), 0, AIOUtils.a(5.0F, paramViewGroup), 0);
      localTextView.setBackgroundResource(2130839255);
      RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(5, 2131296325);
      localLayoutParams.addRule(3, 2131296325);
      topMargin = AIOUtils.a(-3.0F, paramViewGroup);
      leftMargin = AIOUtils.a(12.0F, paramViewGroup);
      jdField_a_of_type_AndroidWidgetTextView = localTextView;
      paramOnLongClickAndTouchListener.addView(localTextView, localLayoutParams);
      jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setText("厘米秀");
    paramOnLongClickAndTouchListener = paramViewGroup.getDrawable(2130837687);
    paramOnLongClickAndTouchListener.setBounds(0, 0, paramOnLongClickAndTouchListener.getIntrinsicWidth(), paramOnLongClickAndTouchListener.getIntrinsicHeight());
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(paramOnLongClickAndTouchListener, null, null, null);
    jdField_a_of_type_AndroidWidgetTextView.setPadding(AIOUtils.a(5.0F, paramViewGroup), 0, AIOUtils.a(5.0F, paramViewGroup), 0);
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramBaseChatItemLayout = (ApolloItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = new RelativeLayout(jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_AndroidWidgetRelativeLayout = paramViewHolder;
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnTouchListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnLongClickListener(paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    }
    if (jdField_a_of_type_ComTencentImageURLImageView == null)
    {
      paramView = new URLImageView(jdField_a_of_type_AndroidContentContext);
      paramView.setScaleType(ImageView.ScaleType.FIT_CENTER);
      paramOnLongClickAndTouchListener = new RelativeLayout.LayoutParams(AIOUtils.a(104.0F, jdField_a_of_type_AndroidContentContext.getResources()), AIOUtils.a(104.0F, jdField_a_of_type_AndroidContentContext.getResources()));
      paramOnLongClickAndTouchListener.addRule(13);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(paramView, paramOnLongClickAndTouchListener);
      jdField_a_of_type_ComTencentImageURLImageView = paramView;
    }
    if (jdField_a_of_type_AndroidWidgetImageView == null)
    {
      paramView = new ImageView(jdField_a_of_type_AndroidContentContext);
      paramView.setImageResource(2130838189);
      paramOnLongClickAndTouchListener = new RelativeLayout.LayoutParams(-2, -2);
      paramOnLongClickAndTouchListener.addRule(13);
      jdField_a_of_type_AndroidWidgetRelativeLayout.addView(paramView, paramOnLongClickAndTouchListener);
      jdField_a_of_type_AndroidWidgetImageView = paramView;
    }
    if ((paramChatMessage != null) && ((paramChatMessage instanceof MessageForApollo)))
    {
      d = mApolloMessage.id;
      jdField_a_of_type_AndroidWidgetRelativeLayout.setTag(Integer.valueOf(d));
    }
    jdField_a_of_type_ComTencentImageURLImageView.setVisibility(0);
    a(paramBaseChatItemLayout, paramViewHolder.getResources(), false);
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new ApolloItemBuilder.Holder();
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "说" + msg;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
  }
  
  public void a(ApolloItemBuilder.Holder paramHolder, Resources paramResources, boolean paramBoolean)
  {
    if ((paramHolder == null) || (paramResources == null)) {
      return;
    }
    for (;;)
    {
      URLDrawable.URLDrawableOptions localURLDrawableOptions;
      try
      {
        localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        mPlayGifImage = true;
        mGifRoundCorner = b;
        mFailedDrawable = paramResources.getDrawable(2130837688);
        mLoadingDrawable = paramResources.getDrawable(2130837689);
        if (!paramBoolean) {
          break label202;
        }
        l = System.currentTimeMillis();
        paramResources = new URL("apollo_gif", "", String.valueOf(l + d));
        File localFile = new File(ApolloItemBuilder.ApolloGifDownloader.a(d));
        if (!localFile.exists()) {
          break label208;
        }
        paramResources = URLDrawable.getDrawable(localFile, localURLDrawableOptions);
        jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable(paramResources);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("ApolloItemBuilder", 2, "actionId->" + d + " drawable.getStatus()->" + paramResources.getStatus());
        return;
      }
      catch (Throwable paramHolder) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("ApolloItemBuilder", 2, paramHolder.getMessage());
      return;
      label202:
      long l = 0L;
      continue;
      label208:
      paramResources = URLDrawable.getDrawable(paramResources, localURLDrawableOptions);
      paramResources.setTag(Integer.valueOf(d));
      jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable(paramResources);
      jdField_a_of_type_ComTencentImageURLImageView.setURLDrawableDownListener(this);
      if (paramResources.getStatus() == 0) {
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      } else {
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      }
    }
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    return paramView.a();
  }
  
  public void onLoadCancelled(View paramView, URLDrawable paramURLDrawable)
  {
    paramView = (ApolloItemBuilder.Holder)AIOUtils.a(paramView);
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ApolloItemBuilder", 2, "onLoadCancelled");
    }
  }
  
  public void onLoadFailed(View paramView, URLDrawable paramURLDrawable, Throwable paramThrowable)
  {
    paramView = (ApolloItemBuilder.Holder)AIOUtils.a(paramView);
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ApolloItemBuilder", 2, "onLoadFailed id: " + paramURLDrawable.getTag() + ", status: " + paramURLDrawable.getStatus());
    }
  }
  
  public void onLoadInterrupted(View paramView, URLDrawable paramURLDrawable, InterruptedException paramInterruptedException)
  {
    paramView = (ApolloItemBuilder.Holder)AIOUtils.a(paramView);
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ApolloItemBuilder", 2, "onLoadInterrupted");
    }
  }
  
  public void onLoadProgressed(View paramView, URLDrawable paramURLDrawable, int paramInt) {}
  
  public void onLoadSuccessed(View paramView, URLDrawable paramURLDrawable)
  {
    paramView = (ApolloItemBuilder.Holder)AIOUtils.a(paramView);
    if (jdField_a_of_type_AndroidWidgetImageView != null) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (QLog.isColorLevel()) {
      QLog.d("ApolloItemBuilder", 2, "onLoadSuccessed");
    }
  }
}
