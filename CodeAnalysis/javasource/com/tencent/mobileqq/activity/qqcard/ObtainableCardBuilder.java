package com.tencent.mobileqq.activity.qqcard;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ObtainableCardBuilder
  extends BaseCardItemBuilder
  implements View.OnClickListener
{
  private Context b;
  
  public ObtainableCardBuilder(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = paramContext;
  }
  
  public BaseCardItemBuilder.BaseHolder a(View paramView)
  {
    return new ObtainableCardBuilder.ViewHolder(paramView);
  }
  
  public void a(Object paramObject, BaseCardItemBuilder.BaseHolder paramBaseHolder)
  {
    Drawable localDrawable = b.getResources().getDrawable(2130841259);
    paramBaseHolder = (ObtainableCardBuilder.ViewHolder)paramBaseHolder;
    paramObject = (QQCardItem)paramObject;
    jdField_a_of_type_AndroidWidgetTextView.setText(title);
    StringBuffer localStringBuffer = new StringBuffer();
    if (!TextUtils.isEmpty(distance))
    {
      localStringBuffer.append(distance);
      localStringBuffer.append("  ");
    }
    localStringBuffer.append(QQCardConstant.a.format(new Date(expireTime * 1000L)));
    if (!TextUtils.isEmpty(brand)) {
      localStringBuffer.append("  ").append(brand);
    }
    b.setText(localStringBuffer.toString());
    c.setOnClickListener(this);
    c.setTag(jumpUrl);
    if (!TextUtils.isEmpty(iconUrl)) {}
    for (;;)
    {
      try
      {
        paramObject = new URL(iconUrl);
        if (paramObject == null) {
          break;
        }
        paramObject = URLDrawableHelper.a(paramObject, QQCardConstant.t, QQCardConstant.t, localDrawable, localDrawable);
        paramObject.setDecodeHandler(URLDrawableDecodeHandler.a);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramObject);
        return;
      }
      catch (MalformedURLException paramObject)
      {
        paramObject.printStackTrace();
      }
      paramObject = null;
    }
    jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(localDrawable);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    Intent localIntent = new Intent(b, QQBrowserActivity.class);
    localIntent.putExtra("url", (String)paramView.getTag());
    b.startActivity(localIntent);
  }
}
