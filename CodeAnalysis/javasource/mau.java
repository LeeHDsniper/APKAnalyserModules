import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.os.Handler;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.tencent.mobileqq.activity.PortraitImageview;
import com.tencent.mobileqq.activity.photo.PhotoCropActivity;
import com.tencent.mobileqq.activity.photo.RegionView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.bitmapcreator.ExifBitmapCreator;
import com.tencent.mobileqq.widget.QQToast;

public class mau
  extends AsyncTask
{
  private int jdField_a_of_type_Int;
  
  private mau(PhotoCropActivity paramPhotoCropActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private int a(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int i = 1;
    int j = 1;
    int m = j;
    if (paramInt1 != 0)
    {
      m = j;
      if (paramInt2 != 0)
      {
        m = j;
        if (paramInt1 != -1)
        {
          if (paramInt2 != -1) {
            break label43;
          }
          m = j;
        }
      }
    }
    label43:
    int k;
    label55:
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
      break label55;
      n = m;
    }
  }
  
  protected Bitmap a(Void... paramVarArgs)
  {
    try
    {
      paramVarArgs = new BitmapFactory.Options();
      inPreferredConfig = Bitmap.Config.RGB_565;
      inJustDecodeBounds = true;
      BitmapFactory.decodeFile(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_c_of_type_JavaLangString, paramVarArgs);
      inSampleSize = a(paramVarArgs, 1280, 1280);
      inJustDecodeBounds = false;
      paramVarArgs = BitmapFactory.decodeFile(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_c_of_type_JavaLangString, paramVarArgs);
      paramVarArgs = new ExifBitmapCreator(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_c_of_type_JavaLangString).a(paramVarArgs);
      return paramVarArgs;
    }
    catch (OutOfMemoryError paramVarArgs)
    {
      jdField_a_of_type_Int = 1;
      return null;
    }
    catch (Exception paramVarArgs)
    {
      jdField_a_of_type_Int = 2;
    }
    return null;
  }
  
  protected void a(Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.setRestrict(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.b, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_c_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.setImageBitmap(paramBitmap);
      paramBitmap = new ViewGroup.LayoutParams(-1, -1);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPhotoRegionView = new RegionView(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.d, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.e, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.f);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview, paramBitmap);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_ComTencentMobileqqActivityPhotoRegionView, paramBitmap);
      if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_AndroidOsHandler != null) {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(-1, 250L);
      }
      return;
    }
    if (jdField_a_of_type_Int == 1) {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity, "内存不足，加载失败", 0).a();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity.finish();
      return;
      if (jdField_a_of_type_Int == 2) {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity, "图片加载失败", 0).a();
      } else {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoCropActivity, "图片加载失败，图片可能已损坏", 0).a();
      }
    }
  }
}
