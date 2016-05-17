package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.util.MQLruCache;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.NativeGifImage;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.AbsDownloader;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.widget.AnyScaleTypeImageView.DisplayRuleDef;
import java.io.File;
import java.io.IOException;
import java.net.URL;

public class SubscriptChatThumbView
  extends URLImageView
{
  private static final int jdField_a_of_type_Int = 100;
  private AnyScaleTypeImageView.DisplayRuleDef jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef;
  public boolean a;
  private boolean b;
  
  public SubscriptChatThumbView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = false;
  }
  
  public void onLoadSuccessed(URLDrawable paramURLDrawable)
  {
    Object localObject1 = paramURLDrawable.getURL();
    String str = ((URL)localObject1).toString();
    if ((paramURLDrawable.getTag() instanceof MessageForPic)) {}
    for (MessageForPic localMessageForPic = (MessageForPic)paramURLDrawable.getTag();; localMessageForPic = null)
    {
      if (localMessageForPic == null) {
        return;
      }
      Object localObject2;
      boolean bool;
      int j;
      int i;
      if ((imageType == 3) || (imageType == 2000))
      {
        localObject2 = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.aio_gifplay.name());
        if ((localObject2 != null) && (((String)localObject2).length() > 0))
        {
          localObject2 = ((String)localObject2).split("\\|");
          if (localObject2.length >= 3)
          {
            bool = localObject2[0].equals("1");
            try
            {
              j = Integer.parseInt(localObject2[2]);
              i = j;
              if (j < 0) {
                i = 100;
              }
            }
            catch (NumberFormatException localNumberFormatException)
            {
              for (;;)
              {
                i = 100;
              }
            }
            com.tencent.image.AbstractGifImage.DoAccumulativeRunnable.DELAY = i;
          }
        }
      }
      for (;;)
      {
        Object localObject4;
        if (bool)
        {
          localObject2 = URLDrawableHelper.a(localMessageForPic, 1, null);
          localObject4 = AbsDownloader.a(((URL)localObject2).toString());
          if (localObject4 == null) {}
        }
        for (;;)
        {
          try
          {
            localObject4 = NativeGifImage.getImageSize((File)localObject4, false);
            localObject1 = localObject2;
            localObject2 = localObject4;
          }
          catch (IOException localIOException)
          {
            localObject3 = null;
            continue;
            localObject3 = new BitmapFactory.Options();
            inJustDecodeBounds = true;
            BitmapFactory.decodeFile(((File)localObject4).getAbsolutePath(), (BitmapFactory.Options)localObject3);
            j = outWidth;
            i = outHeight;
            int k = URLDrawableHelper.a(((File)localObject4).getAbsolutePath());
            if ((k != 90) && (k != 270)) {
              continue;
            }
            j = outHeight;
            i = outWidth;
            continue;
            localObject3 = SubscriptPicItemBuilder.c(subThumbWidth, subThumbHeight);
            continue;
            super.onLoadSuccessed(paramURLDrawable);
            return;
          }
          localObject4 = AbsDownloader.a(str);
          if (localObject4 != null)
          {
            if (localObject2 == null) {
              continue;
            }
            j = ((Rect)localObject2).width();
            i = ((Rect)localObject2).height();
            if ((subThumbWidth == -1) || (subThumbHeight == -1))
            {
              subThumbWidth = j;
              subThumbHeight = i;
            }
          }
          if ((imageType == 3) || (imageType == 2000))
          {
            localObject2 = SubscriptPicItemBuilder.b(subThumbWidth, subThumbHeight);
            setLayoutParams((ViewGroup.LayoutParams)localObject2);
            if (BaseApplicationImpl.a.get(str) != null) {
              paramURLDrawable = URLDrawableHelper.a((URL)localObject1, 0, 0, null, null, true, 0.0F);
            }
            if ((width > 0) && (height > 0) && (jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef != null))
            {
              i = width;
              j = height;
              setImageMatrix(jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef.a(paramURLDrawable, i, j));
            }
            setImageDrawable(paramURLDrawable);
            paramURLDrawable.setFadeInImage(false);
            if (!jdField_a_of_type_Boolean) {
              continue;
            }
            paramURLDrawable = new AlphaAnimation(0.0F, 1.0F);
            paramURLDrawable.setDuration(100L);
            startAnimation(paramURLDrawable);
            invalidate();
          }
          Object localObject3 = null;
        }
        bool = false;
      }
    }
  }
  
  public void setDisplayRuleDef(AnyScaleTypeImageView.DisplayRuleDef paramDisplayRuleDef)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef = paramDisplayRuleDef;
    if (paramDisplayRuleDef != null) {
      setScaleType(ImageView.ScaleType.MATRIX);
    }
  }
  
  protected boolean setFrame(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    b = true;
    Drawable localDrawable = getDrawable();
    if (localDrawable == null) {
      return super.setFrame(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    if (jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef != null)
    {
      int i = getPaddingLeft();
      int j = getPaddingRight();
      int k = getPaddingTop();
      int m = getPaddingBottom();
      setImageMatrix(jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef.a(localDrawable, paramInt3 - paramInt1 - i - j, paramInt4 - paramInt2 - k - m));
    }
    return super.setFrame(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setImageDrawable(Drawable paramDrawable)
  {
    if ((b) && (paramDrawable != null) && (jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef != null))
    {
      int i = getWidth();
      int j = getPaddingLeft();
      int k = getPaddingRight();
      int m = getHeight();
      int n = getPaddingTop();
      int i1 = getPaddingBottom();
      setImageMatrix(jdField_a_of_type_ComTencentMobileqqWidgetAnyScaleTypeImageView$DisplayRuleDef.a(paramDrawable, i - j - k, m - n - i1));
    }
    super.setImageDrawable(paramDrawable);
  }
}
