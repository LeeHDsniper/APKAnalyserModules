package com.tencent.mobileqq.activity.fling;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.drawable.BitmapDrawable;
import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.OrientationUtil;
import java.lang.ref.WeakReference;
import lul;

public class FlingTrackerHandler
  extends FlingHandler
  implements TopLayout.OnDraggingListener
{
  private int jdField_a_of_type_Int;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private View jdField_a_of_type_AndroidViewView;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private ContentWrapView jdField_a_of_type_ComTencentMobileqqActivityFlingContentWrapView;
  private TopLayout jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout;
  private Runnable jdField_a_of_type_JavaLangRunnable;
  
  public FlingTrackerHandler(Activity paramActivity)
  {
    super(paramActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = new Handler();
    jdField_a_of_type_JavaLangRunnable = new lul(this);
  }
  
  private int a(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int i = 1;
    int j = 1;
    int m = j;
    if ((paramInt1 & paramInt2) != 0)
    {
      if ((paramInt1 | paramInt2) != -1) {
        break label30;
      }
      m = j;
    }
    label30:
    int k;
    label42:
    do
    {
      return m;
      j = outHeight;
      k = outWidth;
      if (j > paramInt2) {
        break;
      }
      m = i;
    } while (k <= paramInt1);
    int n = Math.round(j / paramInt2);
    m = Math.round(k / paramInt1);
    if (n > m) {}
    for (;;)
    {
      m = i;
      if (n < 2) {
        break;
      }
      k /= 2;
      j /= 2;
      i *= 2;
      break label42;
      n = m;
    }
  }
  
  private String a()
  {
    Activity localActivity = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localActivity != null) {
      return ScreenCapture.getSnapPath(localActivity, a());
    }
    return null;
  }
  
  private void c()
  {
    Object localObject1 = a();
    if (localObject1 == null) {}
    for (;;)
    {
      return;
      int i = jdField_a_of_type_AndroidWidgetImageView.getMeasuredWidth();
      int j = jdField_a_of_type_AndroidWidgetImageView.getMeasuredHeight();
      try
      {
        localObject1 = decodeSampledBitmapFromFile((String)localObject1, i, j);
        if (localObject1 == null) {
          continue;
        }
        jdField_a_of_type_AndroidWidgetImageView.setImageBitmap((Bitmap)localObject1);
        return;
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        localOutOfMemoryError = localOutOfMemoryError;
        if (0 == 0) {
          continue;
        }
        jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(null);
        return;
      }
      finally
      {
        localObject2 = finally;
        if (0 != 0) {
          jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(null);
        }
        throw localObject2;
      }
    }
  }
  
  protected void a()
  {
    if ((b()) && (jdField_a_of_type_AndroidOsHandler != null)) {
      jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_a_of_type_JavaLangRunnable, 100L);
    }
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout != null) && (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout.getParent() != null);
  }
  
  protected void b()
  {
    Object localObject = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localObject == null) {}
    do
    {
      return;
      localObject = (ViewGroup)((Activity)localObject).getWindow().getDecorView();
      if ((a()) && (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout.getParent().equals(localObject)))
      {
        ((ViewGroup)localObject).removeView(jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout);
        if ((jdField_a_of_type_ComTencentMobileqqActivityFlingContentWrapView != null) && (jdField_a_of_type_AndroidViewView.getParent().equals(jdField_a_of_type_ComTencentMobileqqActivityFlingContentWrapView)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityFlingContentWrapView.removeView(jdField_a_of_type_AndroidViewView);
          ((ViewGroup)localObject).addView(jdField_a_of_type_AndroidViewView);
        }
        if ((jdField_a_of_type_AndroidWidgetImageView != null) && (jdField_a_of_type_AndroidWidgetImageView.getDrawable() != null))
        {
          localObject = jdField_a_of_type_AndroidWidgetImageView.getDrawable();
          if ((localObject instanceof BitmapDrawable))
          {
            localObject = ((BitmapDrawable)localObject).getBitmap();
            if ((localObject != null) && (!((Bitmap)localObject).isRecycled())) {
              ((Bitmap)localObject).recycle();
            }
          }
          jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(null);
        }
      }
    } while (jdField_a_of_type_AndroidOsHandler == null);
    jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
  }
  
  public void cancelDrag()
  {
    OrientationUtil.b((Activity)jdField_a_of_type_JavaLangRefWeakReference.get());
  }
  
  public Bitmap decodeSampledBitmapFromFile(String paramString, int paramInt1, int paramInt2)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeFile(paramString, localOptions);
    inSampleSize = a(localOptions, paramInt1, paramInt2);
    inJustDecodeBounds = false;
    try
    {
      paramString = BitmapFactory.decodeFile(paramString, localOptions);
      return paramString;
    }
    catch (OutOfMemoryError paramString) {}
    return null;
  }
  
  public void endDrag()
  {
    Activity localActivity = (Activity)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localActivity != null)
    {
      OrientationUtil.b(localActivity);
      localActivity.onBackPressed();
      localActivity.overridePendingTransition(2130968621, 2130968621);
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (a()) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout.onConfigChanged(paramConfiguration);
    }
  }
  
  public void startDrag()
  {
    OrientationUtil.a((Activity)jdField_a_of_type_JavaLangRefWeakReference.get());
  }
}
