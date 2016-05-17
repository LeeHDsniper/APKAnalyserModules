package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.text.method.LinkMovementMethod;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import android.widget.Toast;
import com.rookery.translate.AITranslator;
import com.rookery.translate.model.TransDiskCache;
import com.rookery.translate.model.TransMemCache;
import com.rookery.translate.model.Trans_entity;
import com.rookery.translate.model.TranslateCache;
import com.rookery.translate.type.Language;
import com.rookery.translate.util.LocaleUtil;
import com.rookery.translate.widget.BubbleResizeAnimation;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.ChatBackground;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.bubble.BubbleUtils;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.widget.AnimationTextView;
import com.tencent.mobileqq.widget.RotateableView;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.util.HashMap;
import lbp;
import lbq;
import lbr;

public class TextTranslationItemBuilder
  extends TextItemBuilder
{
  public static final int h = 0;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public static int l;
  private static int m;
  private static int n;
  private long jdField_a_of_type_Long;
  public AlphaAnimation a;
  Trans_entity jdField_a_of_type_ComRookeryTranslateModelTrans_entity;
  HashMap jdField_a_of_type_JavaUtilHashMap;
  public AlphaAnimation b;
  private boolean d;
  
  public TextTranslationItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    b = new AlphaAnimation(1.0F, 0.0F);
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    d = true;
    jdField_a_of_type_Long = -1L;
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setDuration(300L);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setFillAfter(true);
    b.setDuration(150L);
    b.setFillAfter(true);
  }
  
  private int a(double paramDouble)
  {
    return (int)(jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().density * paramDouble);
  }
  
  public static int a(int paramInt, QQAppInterface paramQQAppInterface)
  {
    String str;
    if (paramInt == 0) {
      str = "0";
    }
    for (;;)
    {
      if (m != 0) {
        StatisticCollector.a(BaseApplication.getContext()).a(paramQQAppInterface, paramQQAppInterface.a(), "", "Translate_external", "Clk_bubble__translate", 0, m, 0, "", str, "", "");
      }
      if (n != 0) {
        StatisticCollector.a(BaseApplication.getContext()).a(paramQQAppInterface, paramQQAppInterface.a(), "", "Translate_external", "Back_original_text", 0, n, 0, "", str, "", "");
      }
      if (l != 0) {
        StatisticCollector.a(BaseApplication.getContext()).a(paramQQAppInterface, paramQQAppInterface.a(), "", "Translate_external", "Same_language", 0, l, 0, "", str, "", "");
      }
      m = 0;
      n = 0;
      l = 0;
      return 0;
      if (paramInt == 1) {
        str = "1";
      } else if (paramInt == 3000) {
        str = "2";
      } else {
        str = "";
      }
    }
  }
  
  private void a(BaseChatItemLayout paramBaseChatItemLayout, TextTranslationItemBuilder.Holder paramHolder)
  {
    jdField_b_of_type_AndroidViewView = jdField_a_of_type_AndroidViewViewGroup.findViewById(2131296382);
    jdField_a_of_type_ComTencentMobileqqWidgetRotateableView = ((RotateableView)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131302374));
    jdField_a_of_type_ComTencentMobileqqWidgetRotateableView.setBackgroundResource(2130841065);
  }
  
  private void a(TextTranslationItemBuilder.Holder paramHolder)
  {
    jdField_b_of_type_AndroidViewView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqWidgetRotateableView.a();
    jdField_a_of_type_AndroidViewViewGroup.setPadding(jdField_a_of_type_AndroidViewViewGroup.getPaddingLeft(), jdField_a_of_type_AndroidViewViewGroup.getPaddingTop() - 2, a(1.5D), a(4.0D));
  }
  
  private void a(TextTranslationItemBuilder.Holder paramHolder, MessageForText paramMessageForText, BaseChatItemLayout paramBaseChatItemLayout)
  {
    String str = msg;
    if (paramHolder == null) {
      return;
    }
    if (jdField_a_of_type_AndroidViewViewGroup != null)
    {
      localObject = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidViewViewGroup.getLayoutParams();
      width = -2;
      height = -2;
      jdField_a_of_type_AndroidViewViewGroup.clearAnimation();
      jdField_a_of_type_AndroidViewViewGroup.setAnimation(null);
    }
    if (jdField_b_of_type_AndroidWidgetTextView != null)
    {
      jdField_b_of_type_AndroidWidgetTextView.clearAnimation();
      jdField_b_of_type_AndroidWidgetTextView.setAnimation(null);
      if (Build.VERSION.SDK_INT > 10) {
        jdField_b_of_type_AndroidWidgetTextView.setAlpha(1.0F);
      }
    }
    Object localObject = LocaleUtil.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
    if (!TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext()).a((String)localObject, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long))
    {
      b(paramHolder);
      label140:
      jdField_a_of_type_ComRookeryTranslateModelTrans_entity = null;
      if (d == 100000)
      {
        TransDiskCache localTransDiskCache = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
        if (localTransDiskCache != null) {
          jdField_a_of_type_ComRookeryTranslateModelTrans_entity = localTransDiskCache.a(str, jdField_a_of_type_Long, (String)localObject);
        }
        if ((jdField_a_of_type_ComRookeryTranslateModelTrans_entity == null) || (!jdField_a_of_type_ComRookeryTranslateModelTrans_entity.a().booleanValue()) || (paramMessageForText.isSend())) {
          break label471;
        }
      }
    }
    label471:
    for (jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100001, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), jdField_a_of_type_AndroidWidgetBaseAdapter);; jdField_a_of_type_ComTencentMobileqqBubbleBubbleInfo = BubbleUtils.a(100000, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext.getResources(), jdField_a_of_type_AndroidWidgetBaseAdapter))
    {
      d = SharedPreUtils.c(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      if ((d) && (!paramMessageForText.isSend()) && (d == 100000) && (msgtype == 64536))
      {
        paramBaseChatItemLayout.setTimeStamp(true, time, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a.a, null);
        i1 = 0;
        if (paramMessageForText.isSend()) {
          i1 = 1;
        }
        paramBaseChatItemLayout.setHearIconPosition(i1);
        a.setText(2131370264);
        SharedPreUtils.d(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
        jdField_a_of_type_Long = jdField_a_of_type_Long;
        StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "", "Translate_external", "Newbie_guide__external", 0, 1, 0);
      }
      if ((jdField_a_of_type_Long < 0L) || (jdField_a_of_type_Long != jdField_a_of_type_Long)) {
        break;
      }
      paramBaseChatItemLayout.setTimeStamp(true, time, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a.a, null);
      int i1 = 0;
      if (paramMessageForText.isSend()) {
        i1 = 1;
      }
      paramBaseChatItemLayout.setHearIconPosition(i1);
      a.setText(2131370264);
      return;
      a(paramHolder);
      break label140;
    }
  }
  
  private void b(TextTranslationItemBuilder.Holder paramHolder)
  {
    jdField_b_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqWidgetRotateableView.b();
    jdField_a_of_type_AndroidViewViewGroup.setPadding(jdField_a_of_type_AndroidViewViewGroup.getPaddingLeft(), jdField_a_of_type_AndroidViewViewGroup.getPaddingTop() - 2, a(14.0D), a(5.0D));
  }
  
  private void b(TextTranslationItemBuilder.Holder paramHolder, MessageForText paramMessageForText)
  {
    d = ((int)vipBubbleID);
    jdField_a_of_type_Long = uniseq;
    e = istroop;
    jdField_a_of_type_JavaLangString = msg;
    jdField_b_of_type_JavaLangString = msg;
  }
  
  private void c(TextTranslationItemBuilder.Holder paramHolder, MessageForText paramMessageForText)
  {
    int i1 = 0;
    jdField_a_of_type_JavaLangString = msg;
    Object localObject2 = sb;
    Object localObject1 = localObject2;
    if (d == 100000)
    {
      jdField_b_of_type_JavaLangString = msg;
      localObject1 = LocaleUtil.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
      jdField_a_of_type_ComRookeryTranslateModelTrans_entity = null;
      TransDiskCache localTransDiskCache = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
      if (localTransDiskCache != null) {
        jdField_a_of_type_ComRookeryTranslateModelTrans_entity = localTransDiskCache.a(msg, jdField_a_of_type_Long, (String)localObject1);
      }
      localObject1 = localObject2;
      if (jdField_a_of_type_ComRookeryTranslateModelTrans_entity != null)
      {
        localObject1 = localObject2;
        if (jdField_a_of_type_ComRookeryTranslateModelTrans_entity.a().booleanValue())
        {
          localObject1 = localObject2;
          if (!paramMessageForText.isSend())
          {
            jdField_a_of_type_JavaLangString = jdField_a_of_type_ComRookeryTranslateModelTrans_entity.a();
            localObject1 = new QQText(jdField_a_of_type_JavaLangString, 13, 32, paramMessageForText);
          }
        }
      }
    }
    if (d == 100000)
    {
      localObject2 = jdField_a_of_type_JavaLangString;
      if (f == 0) {
        jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
      }
      while ((paramMessageForText.isSend()) || (jdField_a_of_type_ComRookeryTranslateModelTrans_entity == null) || (f != 1)) {
        return;
      }
      paramMessageForText = jdField_b_of_type_AndroidWidgetTextView.getText();
      int i3 = jdField_b_of_type_AndroidWidgetTextView.getMeasuredWidth();
      int i2 = jdField_b_of_type_AndroidWidgetTextView.getMeasuredHeight();
      jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
      jdField_b_of_type_AndroidWidgetTextView.measure(0, 0);
      if (jdField_b_of_type_AndroidWidgetTextView.getMeasuredWidth() < BaseChatItemLayout.h) {
        i1 = jdField_b_of_type_AndroidWidgetTextView.getMeasuredWidth() - i3;
      }
      i3 = jdField_b_of_type_AndroidWidgetTextView.getMeasuredHeight();
      jdField_b_of_type_AndroidWidgetTextView.setText(paramMessageForText);
      paramMessageForText = new BubbleResizeAnimation(jdField_a_of_type_AndroidViewViewGroup, 300, i1, i3 - i2);
      paramMessageForText.setAnimationListener(new lbq(this, paramHolder, (CharSequence)localObject1));
      jdField_a_of_type_AndroidViewViewGroup.startAnimation(paramMessageForText);
      return;
    }
    jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramView = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramViewGroup = (TextTranslationItemBuilder.Holder)paramView.getTag();
    b(paramViewGroup, (MessageForText)paramChatMessage);
    a((BaseChatItemLayout)paramView, paramViewGroup);
    a(paramViewGroup, (MessageForText)paramChatMessage, (BaseChatItemLayout)paramView);
    c(paramViewGroup, (MessageForText)paramChatMessage);
    return paramView;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    Context localContext = paramBaseChatItemLayout.getContext();
    paramBaseChatItemLayout = (TextTranslationItemBuilder.Holder)paramViewHolder;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = (LinearLayout)((Activity)localContext).getLayoutInflater().inflate(2130904371, null);
      jdField_a_of_type_AndroidViewViewGroup = paramViewHolder;
      jdField_b_of_type_AndroidWidgetTextView = ((AnimationTextView)paramViewHolder.findViewById(2131297402));
      jdField_b_of_type_AndroidWidgetTextView.setMaxWidth(BaseChatItemLayout.h);
      jdField_b_of_type_AndroidWidgetTextView.setMovementMethod(new LinkMovementMethod());
    }
    jdField_b_of_type_AndroidWidgetTextView.setTextSize(0, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.b);
    int i2 = BaseChatItemLayout.r;
    int i1 = BaseChatItemLayout.s;
    if (paramChatMessage.isSend())
    {
      i2 = BaseChatItemLayout.s;
      i1 = BaseChatItemLayout.r;
    }
    jdField_b_of_type_AndroidWidgetTextView.setPadding(i2, BaseChatItemLayout.p, i1, BaseChatItemLayout.q);
    jdField_b_of_type_AndroidWidgetTextView.setOnTouchListener(paramOnLongClickAndTouchListener);
    jdField_b_of_type_AndroidWidgetTextView.setOnLongClickListener(paramOnLongClickAndTouchListener);
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(this);
    if ((jdField_b_of_type_AndroidWidgetTextView instanceof AnimationTextView)) {
      jdField_b_of_type_AndroidWidgetTextView).a = new lbp(this);
    }
    return paramViewHolder;
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new TextTranslationItemBuilder.Holder(this);
  }
  
  @Deprecated
  public void a(int paramInt)
  {
    Toast.makeText(jdField_a_of_type_AndroidContentContext, paramInt, 0).show();
  }
  
  protected void a(View paramView, ChatMessage paramChatMessage)
  {
    if (paramChatMessage.isSend())
    {
      paramView.setPadding(BaseChatItemLayout.n, BaseChatItemLayout.k, BaseChatItemLayout.m, BaseChatItemLayout.l);
      return;
    }
    paramView.setPadding(BaseChatItemLayout.m, BaseChatItemLayout.k, BaseChatItemLayout.n, BaseChatItemLayout.l);
  }
  
  protected void a(TextTranslationItemBuilder.Holder paramHolder, MessageForText paramMessageForText)
  {
    if (paramHolder == null) {}
    long l1;
    label68:
    do
    {
      do
      {
        return;
      } while ((d != 100000) || (msgtype != 64536) || (paramMessageForText.isSend()));
      if (jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_Boolean = false;
        return;
      }
      long l2 = System.currentTimeMillis();
      if (jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(jdField_a_of_type_Long)) != null) {
        break;
      }
      l1 = 0L;
      if (l2 - l1 < 800L) {
        break label325;
      }
      jdField_a_of_type_JavaUtilHashMap.put(Long.valueOf(jdField_a_of_type_Long), Long.valueOf(l2));
      if (QLog.isColorLevel()) {
        QLog.i("Translator", 2, "on click translate status:" + f);
      }
    } while (f != 0);
    Context localContext = jdField_a_of_type_AndroidContentContext;
    String str = LocaleUtil.a(localContext);
    paramMessageForText = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
    if (paramMessageForText != null) {}
    for (paramMessageForText = paramMessageForText.a(jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, str);; paramMessageForText = null)
    {
      if (paramMessageForText != null)
      {
        if (!paramMessageForText.a().equalsIgnoreCase(jdField_b_of_type_JavaLangString))
        {
          if ((paramMessageForText.a().booleanValue()) && (!TranslateCache.a(localContext).b(str, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long)))
          {
            n += 1;
            TranslateCache.a(localContext).b(str, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, Boolean.valueOf(true));
          }
          paramMessageForText.a();
          TranslateCache.a(localContext).a(str, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, paramMessageForText.a());
          f = 1;
          jdField_a_of_type_AndroidWidgetBaseAdapter.notifyDataSetChanged();
          return;
          l1 = ((Long)jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(jdField_a_of_type_Long))).longValue();
          break label68;
          label325:
          break;
        }
        a(2131370241);
        return;
      }
      m += 1;
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      if (!AITranslator.a().a(localContext, paramHolder, jdField_a_of_type_JavaLangString, Language.fromString(str), new lbr(this, paramHolder, localContext, str)).booleanValue())
      {
        b(paramHolder);
        if (AITranslator.a().a(jdField_a_of_type_AndroidContentContext).booleanValue())
        {
          a(2131370241);
          return;
        }
        a(2131370244);
        return;
      }
      a(paramHolder);
      TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext()).a(str, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, Boolean.valueOf(true));
      return;
    }
  }
  
  protected void c(ChatMessage paramChatMessage)
  {
    String str = msg;
    TransDiskCache localTransDiskCache;
    if (((paramChatMessage instanceof MessageForText)) && (vipBubbleID == 100000L))
    {
      localObject = LocaleUtil.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
      localTransDiskCache = TranslateCache.a(jdField_a_of_type_AndroidContentContext.getApplicationContext());
      if (localTransDiskCache == null) {
        break label142;
      }
    }
    label142:
    for (Object localObject = localTransDiskCache.a(msg, uniseq, (String)localObject);; localObject = null)
    {
      if ((localObject != null) && (((Trans_entity)localObject).a().booleanValue()) && (!paramChatMessage.isSend())) {}
      for (localObject = ((Trans_entity)localObject).a();; localObject = str)
      {
        QfavBuilder.a(null, (String)localObject).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
        QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 1);
        return;
      }
    }
  }
  
  public void onClick(View paramView)
  {
    if ((paramView.getId() == 2131296325) || (paramView.getId() == 2131297402))
    {
      MessageForText localMessageForText = (MessageForText)AIOUtils.a(paramView);
      a((TextTranslationItemBuilder.Holder)AIOUtils.a(paramView), localMessageForText);
      AIOUtils.l = true;
      return;
    }
    super.onClick(paramView);
  }
}
