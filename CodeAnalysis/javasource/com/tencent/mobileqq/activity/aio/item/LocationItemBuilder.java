package com.tencent.mobileqq.activity.aio.item;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.activity.aio.BaseChatItemLayout;
import com.tencent.mobileqq.activity.aio.OnLongClickAndTouchListener;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.anim.AIOAnimationConatiner;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenu;
import com.tencent.mobileqq.utils.dialogutils.QQCustomMenuItem;
import cooperation.qqfav.QfavBuilder;
import cooperation.qqfav.QfavReport;
import java.net.MalformedURLException;
import java.net.URL;
import kxw;
import kxx;
import kxy;
import kxz;

public class LocationItemBuilder
  extends BaseBubbleBuilder
{
  Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  float b;
  
  public LocationItemBuilder(QQAppInterface paramQQAppInterface, BaseAdapter paramBaseAdapter, Context paramContext, SessionInfo paramSessionInfo, AIOAnimationConatiner paramAIOAnimationConatiner)
  {
    super(paramQQAppInterface, paramBaseAdapter, paramContext, paramSessionInfo, paramAIOAnimationConatiner);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = 2.0F;
    jdField_a_of_type_AndroidViewView$OnClickListener = new kxw(this);
    b = jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics().density;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = a();
  }
  
  private Drawable a()
  {
    Bitmap localBitmap1 = BitmapManager.a(jdField_a_of_type_AndroidContentContext.getResources(), 2130838357);
    if (localBitmap1 == null) {
      return null;
    }
    int i = localBitmap1.getWidth();
    int j = localBitmap1.getHeight();
    Bitmap localBitmap2 = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
    localBitmap2.setDensity(160);
    Canvas localCanvas = new Canvas(localBitmap2);
    Paint localPaint = new Paint(1);
    localPaint.setColor(-16777216);
    Rect localRect = new Rect(0, 0, i, j);
    RectF localRectF = new RectF(localRect);
    float f = 11.0F * b;
    localCanvas.drawRoundRect(localRectF, f, f, localPaint);
    localPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
    localCanvas.drawBitmap(localBitmap1, localRect, localRect, localPaint);
    if ((localBitmap1 != null) && (!localBitmap1.isRecycled())) {
      localBitmap1.recycle();
    }
    return new BitmapDrawable(localBitmap2);
  }
  
  public int a(ChatMessage paramChatMessage)
  {
    return 2;
  }
  
  public View a(int paramInt1, int paramInt2, ChatMessage paramChatMessage, View paramView, ViewGroup paramViewGroup, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    paramChatMessage = super.a(paramInt1, paramInt2, paramChatMessage, paramView, paramViewGroup, paramOnLongClickAndTouchListener);
    paramView = (kxz)paramChatMessage.getTag();
    paramInt1 = AIOUtils.a(1.0F, jdField_a_of_type_AndroidContentContext.getResources());
    paramInt2 = jdField_a_of_type_AndroidViewView.getPaddingLeft();
    int i = jdField_a_of_type_AndroidViewView.getPaddingRight();
    int j = jdField_a_of_type_AndroidViewView.getPaddingTop();
    int k = jdField_a_of_type_AndroidViewView.getPaddingBottom();
    jdField_a_of_type_AndroidViewView.setPadding(paramInt2 + paramInt1, j + paramInt1, i + paramInt1, paramInt1 + k);
    return paramChatMessage;
  }
  
  protected View a(ChatMessage paramChatMessage, BaseBubbleBuilder.ViewHolder paramViewHolder, View paramView, BaseChatItemLayout paramBaseChatItemLayout, OnLongClickAndTouchListener paramOnLongClickAndTouchListener)
  {
    kxz localKxz = (kxz)paramViewHolder;
    paramBaseChatItemLayout = (MessageForText)paramChatMessage;
    paramViewHolder = paramView;
    if (paramView == null)
    {
      paramViewHolder = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130903164, null);
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewHolder.findViewById(2131297402));
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewHolder.findViewById(2131297401));
    }
    paramView = location;
    if ((paramView == null) || (paramView.length() == 0)) {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    }
    for (;;)
    {
      paramView = locationUrl;
      try
      {
        paramBaseChatItemLayout = new URL("location", paramView.getAuthority(), paramView.getFile());
        paramView = paramBaseChatItemLayout;
      }
      catch (MalformedURLException paramBaseChatItemLayout)
      {
        for (;;)
        {
          paramBaseChatItemLayout.printStackTrace();
        }
      }
      paramView = URLDrawable.getDrawable(paramView, jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_AndroidGraphicsDrawableDrawable);
      paramView.setTag(paramChatMessage);
      jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(paramView);
      paramViewHolder.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      paramViewHolder.setOnLongClickListener(paramOnLongClickAndTouchListener);
      paramViewHolder.setOnTouchListener(paramOnLongClickAndTouchListener);
      return paramViewHolder;
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText(paramView);
    }
  }
  
  protected BaseBubbleBuilder.ViewHolder a()
  {
    return new kxz(this);
  }
  
  protected String a(ChatMessage paramChatMessage)
  {
    return "发送了地理位置";
  }
  
  String a(MessageForText paramMessageForText)
  {
    return AppConstants.bW + latitude + "_" + longitude + ".png";
  }
  
  public void a(int paramInt, Context paramContext, ChatMessage paramChatMessage)
  {
    if (paramInt == 2131298639)
    {
      paramChatMessage = (MessageForText)paramChatMessage;
      paramContext = new Bundle();
      paramContext.putInt("forward_type", -2);
      paramContext.putString("forward_latitude", latitude);
      paramContext.putString("forward_longitude", longitude);
      paramContext.putString("forward_location", location);
      paramContext.putString("forward_filepath", url);
      paramContext.putString("forward_thumb", a(paramChatMessage));
      paramContext.putString("forward_location_string", location);
      paramChatMessage = new Intent();
      paramChatMessage.putExtras(paramContext);
      ForwardBaseOption.a((Activity)jdField_a_of_type_AndroidContentContext, paramChatMessage, 21);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004045", "0X8004045", 0, 0, "", "", "", "");
    }
    do
    {
      return;
      if (paramInt == 2131304463)
      {
        ChatActivityFacade.b(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramChatMessage);
        return;
      }
      if (paramInt == 2131304473)
      {
        super.b(paramChatMessage);
        return;
      }
      if (paramInt == 2131299653)
      {
        paramContext = (MessageForText)paramChatMessage;
        QfavBuilder.a(Float.valueOf(latitude).floatValue(), Float.valueOf(longitude).floatValue(), null, location, null).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramContext).a((Activity)jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
        QfavReport.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 6, 7);
        return;
      }
    } while (paramInt != 2131304472);
    super.b(paramChatMessage);
  }
  
  protected void a(View paramView)
  {
    super.a(paramView);
    if (aisMultiMsg) {}
    String str1;
    String str2;
    do
    {
      return;
      paramView = (MessageForText)AIOUtils.a(paramView);
      str1 = jdField_a_of_type_AndroidContentContext.getString(2131367611);
      str2 = jdField_a_of_type_AndroidContentContext.getString(2131367612);
    } while (!paramView.isSendFromLocal());
    DialogUtil.a(jdField_a_of_type_AndroidContentContext, 230, str1, str2, new kxx(this, paramView), new kxy(this)).show();
  }
  
  public QQCustomMenuItem[] a(View paramView)
  {
    paramView = new QQCustomMenu();
    paramView.a(2131298639, jdField_a_of_type_AndroidContentContext.getString(2131368986));
    paramView.a(2131299653, jdField_a_of_type_AndroidContentContext.getString(2131365741));
    ChatActivityFacade.a(paramView, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    super.b(paramView, jdField_a_of_type_AndroidContentContext);
    return paramView.a();
  }
}
