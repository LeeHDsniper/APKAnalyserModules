package com.tencent.mobileqq.activity.qqcard;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.urldrawable.URLDrawableDecodeHandler;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.LRULinkedHashMap;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonCardItemBuilder
  extends BaseCardItemBuilder
  implements View.OnClickListener
{
  Resources jdField_a_of_type_AndroidContentResResources;
  Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  BitmapDrawable jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable;
  Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  LRULinkedHashMap jdField_a_of_type_ComTencentUtilLRULinkedHashMap;
  int b;
  
  public CommonCardItemBuilder(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = null;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
    b = -1;
    jdField_a_of_type_ComTencentUtilLRULinkedHashMap = null;
    jdField_a_of_type_AndroidContentResResources = jdField_a_of_type_AndroidContentContext.getResources();
    jdField_a_of_type_ComTencentUtilLRULinkedHashMap = new LRULinkedHashMap(10);
    try
    {
      paramContext = ImageUtil.b(BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentResResources, 2130841259), 50, 50);
      jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable = new BitmapDrawable(jdField_a_of_type_AndroidContentResResources, paramContext);
      jdField_a_of_type_AndroidGraphicsBitmap = BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentResResources, 2130841220);
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = jdField_a_of_type_AndroidContentResResources.getDrawable(2130841219);
      return;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.i(jdField_a_of_type_JavaLangString, 2, paramContext.toString());
        }
      }
    }
    catch (OutOfMemoryError paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.i(jdField_a_of_type_JavaLangString, 2, paramContext.toString());
        }
      }
    }
    catch (Error paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.i(jdField_a_of_type_JavaLangString, 2, paramContext.toString());
        }
      }
    }
  }
  
  private void a(CommonCardItemBuilder.ViewHolder paramViewHolder, QQCardItem paramQQCardItem, int paramInt)
  {
    if (itemType == 0)
    {
      localObject2 = (Drawable)jdField_a_of_type_ComTencentUtilLRULinkedHashMap.get(Integer.valueOf(paramInt));
      localObject1 = localObject2;
      if (localObject2 != null) {}
    }
    label264:
    while (itemType != 5)
    {
      for (;;)
      {
        try
        {
          localObject1 = new BitmapDrawable(jdField_a_of_type_AndroidContentResResources, jdField_a_of_type_AndroidGraphicsBitmap);
          localObject1 = localObject2;
        }
        catch (Exception localException1)
        {
          try
          {
            ((Drawable)localObject1).setBounds(0, 0, QQCardConstant.y_, QQCardConstant.y_);
            ((Drawable)localObject1).setColorFilter(paramInt, PorterDuff.Mode.MULTIPLY);
            jdField_a_of_type_ComTencentUtilLRULinkedHashMap.put(Integer.valueOf(paramInt), localObject1);
            jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawables((Drawable)localObject1, null, null, null);
            paramInt = QQCardManager.a(NetConnInfoCenter.getServerTimeMillis() / 1000L, expireTime);
            if (paramInt >= 7) {
              break label264;
            }
            if (paramInt != 0) {
              break;
            }
            jdField_c_of_type_AndroidWidgetTextView.setText("即将于今天过期");
            return;
          }
          catch (Error localError2)
          {
            for (;;)
            {
              localObject2 = localObject1;
            }
          }
          catch (OutOfMemoryError localOutOfMemoryError2)
          {
            localObject2 = localObject1;
            continue;
          }
          catch (Exception localException2)
          {
            Object localObject1;
            Object localObject2 = localObject1;
            continue;
          }
          localException1 = localException1;
          localObject1 = localObject2;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.i(jdField_a_of_type_JavaLangString, 2, localException1.toString());
          localObject1 = localObject2;
          continue;
        }
        catch (OutOfMemoryError localOutOfMemoryError1)
        {
          localObject1 = localObject2;
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.i(jdField_a_of_type_JavaLangString, 2, localOutOfMemoryError1.toString());
          localObject1 = localObject2;
          continue;
        }
        catch (Error localError1) {}
        if (QLog.isColorLevel())
        {
          QLog.i(jdField_a_of_type_JavaLangString, 2, localError1.toString());
          localObject1 = localObject2;
        }
      }
      if (paramInt == 1)
      {
        jdField_c_of_type_AndroidWidgetTextView.setText("即将于明天过期");
        return;
      }
      jdField_c_of_type_AndroidWidgetTextView.setText(String.format("即将于%d天后过期", new Object[] { Integer.valueOf(paramInt) }));
      return;
      jdField_c_of_type_AndroidWidgetTextView.setText(QQCardConstant.a.format(new Date(expireTime * 1000L)));
      return;
    }
    jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
    jdField_c_of_type_AndroidWidgetTextView.setText(distance);
  }
  
  public BaseCardItemBuilder.BaseHolder a(View paramView)
  {
    return new CommonCardItemBuilder.ViewHolder(paramView);
  }
  
  public void a(Object paramObject, BaseCardItemBuilder.BaseHolder paramBaseHolder)
  {
    paramBaseHolder = (CommonCardItemBuilder.ViewHolder)paramBaseHolder;
    QQCardItem localQQCardItem = (QQCardItem)paramObject;
    if (!TextUtils.isEmpty(iconUrl)) {}
    for (;;)
    {
      label73:
      int k;
      int n;
      int j;
      int m;
      try
      {
        paramObject = new URL(iconUrl);
        if (paramObject != null)
        {
          paramObject = URLDrawableHelper.a(paramObject, QQCardConstant.t, QQCardConstant.t, jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable, jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable);
          paramObject.setDecodeHandler(URLDrawableDecodeHandler.a);
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(paramObject);
          jdField_c_of_type_AndroidViewView.setOnClickListener(this);
          jdField_c_of_type_AndroidViewView.setTag(localQQCardItem);
          jdField_a_of_type_AndroidWidgetTextView.setText(title);
          jdField_b_of_type_AndroidWidgetTextView.setText(subTitle);
          d.setText(brand);
          k = b;
          n = b;
          i = k;
          j = k;
        }
      }
      catch (MalformedURLException paramObject)
      {
        try
        {
          paramObject = new URL(bgUrl);
          int i = jdField_b_of_type_AndroidViewView.getPaddingBottom();
          j = jdField_b_of_type_AndroidViewView.getPaddingTop();
          k = jdField_b_of_type_AndroidViewView.getPaddingRight();
          m = jdField_b_of_type_AndroidViewView.getPaddingLeft();
          if (paramObject == null) {
            break label435;
          }
          if ((jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem == null) || (!jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem.bgUrl.equals(bgUrl))) {
            jdField_b_of_type_AndroidViewView.setBackgroundDrawable(URLDrawableHelper.a(paramObject, jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_AndroidGraphicsDrawableDrawable));
          }
          jdField_b_of_type_AndroidViewView.setPadding(m, j, k, i);
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem = localQQCardItem;
          return;
        }
        catch (MalformedURLException paramObject)
        {
          paramObject.printStackTrace();
        }
        paramObject = paramObject;
        paramObject.printStackTrace();
      }
      try
      {
        if (validTipsColor > -1)
        {
          j = k;
          i = Color.parseColor("#" + Integer.toHexString(validTipsColor));
        }
        m = n;
        k = i;
        j = i;
        if (fromColor > -1)
        {
          j = i;
          m = Color.parseColor("#" + Integer.toHexString(fromColor));
          k = i;
        }
      }
      catch (IllegalArgumentException paramObject)
      {
        m = n;
        k = j;
      }
    }
    a(paramBaseHolder, localQQCardItem, k);
    jdField_c_of_type_AndroidWidgetTextView.setTextColor(k);
    d.setTextColor(m);
    if (!TextUtils.isEmpty(bgUrl)) {}
    for (;;)
    {
      paramObject = null;
      break;
      jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableBitmapDrawable);
      break label73;
      paramObject = null;
      continue;
      label435:
      jdField_b_of_type_AndroidViewView.setBackgroundDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
    }
  }
  
  public void onClick(View paramView)
  {
    paramView = paramView.getTag();
    if ((paramView instanceof QQCardItem))
    {
      paramView = (QQCardItem)paramView;
      Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
      localIntent.putExtra("url", jumpUrl);
      jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
    }
  }
}
