package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder;
import com.tencent.mobileqq.activity.aio.AbstractChatItemBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForQzoneFeed;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import com.tencent.qphone.base.util.BaseApplication;
import java.net.MalformedURLException;
import java.net.URL;
import kzp;
import kzq;
import kzr;

public class QzoneFeedItemBuilder
  extends AbstractChatItemBuilder
{
  private static int a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
  }
  
  public QzoneFeedItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo);
  }
  
  public static int a()
  {
    if (jdField_a_of_type_Int < 0) {
      if (getContextgetResourcesgetConfigurationorientation != 2) {
        break label41;
      }
    }
    label41:
    for (jdField_a_of_type_Int = getContextgetResourcesgetDisplayMetricsheightPixels;; jdField_a_of_type_Int = getContextgetResourcesgetDisplayMetricswidthPixels) {
      return jdField_a_of_type_Int;
    }
  }
  
  private View a(View paramView, kzr paramKzr)
  {
    View localView = paramView;
    if (paramView == null)
    {
      paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903172, null);
      jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)paramView.findViewById(2131297456));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131297455));
      jdField_a_of_type_ComTencentImageURLImageView = ((URLImageView)paramView.findViewById(2131296351));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296352));
      d = ((TextView)paramView.findViewById(2131296355));
      e = ((TextView)paramView.findViewById(2131297461));
      f = ((TextView)paramView.findViewById(2131297462));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131297460));
      g = ((TextView)paramView.findViewById(2131297457));
      jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)paramView.findViewById(2131297459));
      jdField_c_of_type_AndroidViewViewGroup = ((ViewGroup)paramView.findViewById(2131297458));
      localView = paramView;
      if (b)
      {
        jdField_b_of_type_JavaLangStringBuilder = new StringBuilder();
        localView = paramView;
      }
    }
    if (b)
    {
      localView.setContentDescription(null);
      jdField_b_of_type_JavaLangStringBuilder.replace(0, jdField_b_of_type_JavaLangStringBuilder.length(), "");
    }
    return localView;
  }
  
  protected View a(MessageRecord paramMessageRecord, AbstractChatItemBuilder.ViewHolder paramViewHolder, View paramView, LinearLayout paramLinearLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramLinearLayout = (MessageForQzoneFeed)paramMessageRecord;
    paramOnLongClickAndTouchListener = (kzr)paramViewHolder;
    paramView = a(paramView, paramOnLongClickAndTouchListener);
    jdField_a_of_type_Long = uniseq;
    jdField_a_of_type_JavaLangString = frienduin;
    jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(null);
    jdField_b_of_type_JavaLangString = null;
    paramMessageRecord = title;
    paramViewHolder = content;
    if ((!TextUtils.isEmpty(paramMessageRecord)) && (!TextUtils.isEmpty(paramViewHolder)))
    {
      i = 1;
      coverImageUrl = a(coverImageUrl);
      if (TextUtils.isEmpty(coverImageUrl)) {
        break label610;
      }
    }
    label199:
    label208:
    label260:
    label306:
    label372:
    Object localObject;
    label610:
    for (int j = 1;; j = 0)
    {
      if (j != 0) {
        break label616;
      }
      i = AIOUtils.a(12.0F, jdField_a_of_type_AndroidContentContext.getResources());
      jdField_a_of_type_AndroidViewViewGroup.setPadding(i, i, i, i);
      g.setVisibility(8);
      jdField_a_of_type_ComTencentImageURLImageView.setVisibility(8);
      jdField_b_of_type_AndroidViewViewGroup.setPadding(0, AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources()), 0, 0);
      if (paramMessageRecord == null) {
        break label1029;
      }
      paramMessageRecord = paramMessageRecord.trim();
      if (paramViewHolder == null) {
        break label1026;
      }
      paramViewHolder = paramViewHolder.trim();
      jdField_c_of_type_AndroidWidgetTextView.setText(paramMessageRecord);
      d.setText(paramViewHolder);
      if ((!TextUtils.isEmpty(paramMessageRecord)) || (!TextUtils.isEmpty(paramViewHolder))) {
        break label812;
      }
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
      d.setVisibility(8);
      paramMessageRecord = TimeFormatterUtils.a(jdField_a_of_type_AndroidContentContext, 3, feedTime * 1000L);
      if (feedTime <= 0L) {
        break label975;
      }
      f.setVisibility(0);
      f.setText(paramMessageRecord);
      paramViewHolder = new RelativeLayout.LayoutParams(-2, -2);
      paramViewHolder.addRule(12);
      if (TextUtils.isEmpty(lbsInfo)) {
        break label997;
      }
      e.setVisibility(0);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      e.setText(lbsInfo);
      paramViewHolder.addRule(11);
      f.setLayoutParams(paramViewHolder);
      paramViewHolder = Utils.b(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d, 10);
      localObject = paramViewHolder + summery;
      jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      jdField_a_of_type_AndroidViewViewGroup.getViewTreeObserver().addOnGlobalLayoutListener(new kzp(this, paramMessageRecord, paramOnLongClickAndTouchListener));
      jdField_a_of_type_AndroidViewViewGroup.setOnClickListener(new kzq(this, paramLinearLayout));
      if (b)
      {
        jdField_b_of_type_JavaLangStringBuilder.append(paramViewHolder);
        if (feedTime > 0L) {
          jdField_b_of_type_JavaLangStringBuilder.append("于").append(paramMessageRecord);
        }
        jdField_b_of_type_JavaLangStringBuilder.append(summery).append("内容是：").append(title).append(content);
        paramView.setContentDescription(jdField_b_of_type_JavaLangStringBuilder.toString());
      }
      if (!hasExposed)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FFF", "0X8005FFF", 0, 0, "", "", "", "");
        hasExposed = true;
      }
      return paramView;
      i = 0;
      break;
    }
    label616:
    j = AIOUtils.a(10.0F, jdField_a_of_type_AndroidContentContext.getResources());
    jdField_a_of_type_AndroidViewViewGroup.setPadding(j, j, j, j);
    if (imageCount > 1)
    {
      g.setVisibility(0);
      g.setText(String.valueOf(imageCount));
      label680:
      j = AIOUtils.a(55.0F, jdField_a_of_type_AndroidContentContext.getResources());
      jdField_a_of_type_ComTencentImageURLImageView.setVisibility(0);
      if (i == 0) {
        break label1032;
      }
    }
    label812:
    label975:
    label997:
    label1026:
    label1029:
    label1032:
    for (int i = AIOUtils.a(60.0F, jdField_a_of_type_AndroidContentContext.getResources());; i = j)
    {
      localObject = URLDrawable.getDrawable(coverImageUrl, i, i);
      ((URLDrawable)localObject).setTag(URLDrawableDecodeHandler.a(i, i, (int)(2.0F * DeviceInfoUtil.a())));
      ((URLDrawable)localObject).setDecodeHandler(URLDrawableDecodeHandler.b);
      jdField_a_of_type_ComTencentImageURLImageView.setImageDrawable((Drawable)localObject);
      jdField_b_of_type_AndroidViewViewGroup.setPadding(0, 0, 0, AIOUtils.a(1.0F, jdField_a_of_type_AndroidContentContext.getResources()));
      break;
      g.setVisibility(8);
      break label680;
      if ((!TextUtils.isEmpty(paramMessageRecord)) && (TextUtils.isEmpty(paramViewHolder)))
      {
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_c_of_type_AndroidWidgetTextView.setPadding(0, 0, 0, 0);
        d.setVisibility(8);
        jdField_c_of_type_AndroidWidgetTextView.setMaxLines(2);
        break label260;
      }
      if ((TextUtils.isEmpty(paramMessageRecord)) && (!TextUtils.isEmpty(paramViewHolder)))
      {
        jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
        d.setVisibility(0);
        d.setMaxLines(2);
        break label260;
      }
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      d.setVisibility(0);
      jdField_c_of_type_AndroidWidgetTextView.setPadding(0, 0, 0, AIOUtils.a(2.0F, jdField_a_of_type_AndroidContentContext.getResources()));
      jdField_c_of_type_AndroidWidgetTextView.setMaxLines(1);
      d.setMaxLines(1);
      break label260;
      f.setVisibility(8);
      f.setText(paramMessageRecord);
      break label306;
      e.setVisibility(8);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      paramViewHolder.addRule(9);
      break label372;
      break label208;
      break label199;
    }
  }
  
  protected AbstractChatItemBuilder.ViewHolder a()
  {
    return new kzr(this);
  }
  
  public String a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    int i;
    do
    {
      return null;
      i = paramString.indexOf("http");
    } while (i < 0);
    paramString = paramString.substring(i);
    try
    {
      new URL(paramString);
      return paramString;
    }
    catch (MalformedURLException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage) {}
  
  public boolean a(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || ((!paramString.startsWith("http://")) && (!paramString.startsWith("https://")))) {
      return false;
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    localIntent.putExtra("url", paramString);
    localIntent.putExtra("fromAio", true);
    PublicAccountUtil.a(localIntent, paramString);
    jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
    return true;
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    return null;
  }
}
