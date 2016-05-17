import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.tencent.common.galleryactivity.AbstractImageAdapter.URLImageView2;
import com.tencent.image.RegionDrawableData;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.activity.photo.PhotoPreviewActivity;
import com.tencent.mobileqq.activity.photo.ProGallery.OnProGalleryListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;

public class mbv
  extends BaseAdapter
  implements ProGallery.OnProGalleryListener
{
  int jdField_a_of_type_Int;
  SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  URLDrawable jdField_a_of_type_ComTencentImageURLDrawable;
  
  public mbv(PhotoPreviewActivity paramPhotoPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
    jdField_a_of_type_Int = -1;
  }
  
  public View a(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if (paramView != null) {
      if (paramView.getStatus() == 3) {
        paramView.restartDownload();
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, a());
      }
      do
      {
        return null;
        paramView = a(paramInt);
        if (!TextUtils.isEmpty(paramView)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.i(PhotoPreviewActivity.b(), 2, "Path is empty. position " + paramInt + ", size " + getCount());
      return null;
      paramView = new File(paramView);
      if (paramView.exists())
      {
        URLDrawable.URLDrawableOptions localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        mRequestWidth = paramViewGroup.getWidth();
        mRequestHeight = paramViewGroup.getHeight();
        mLoadingDrawable = URLDrawableHelper.d;
        mPlayGifImage = true;
        mUseAutoScaleParams = false;
        paramView = URLDrawable.getDrawable(paramView, localURLDrawableOptions);
        paramView.setTag(Integer.valueOf(1));
        paramView.startDownload();
        jdField_a_of_type_AndroidUtilSparseArray.put(paramInt, paramView);
      }
    }
  }
  
  String a()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("(preview) Actives: ");
    int i = 0;
    while (i < jdField_a_of_type_AndroidUtilSparseArray.size())
    {
      if (i > 0) {
        localStringBuilder.append(" , ");
      }
      localStringBuilder.append(jdField_a_of_type_AndroidUtilSparseArray.keyAt(i) + 1);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public String a(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.a != null) && (paramInt < jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.a.size()) && (paramInt >= 0)) {
      return (String)jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.a.get(paramInt);
    }
    return null;
  }
  
  public void a(int paramInt, View paramView, ViewGroup paramViewGroup) {}
  
  public void a(int paramInt, View paramView, ViewGroup paramViewGroup, boolean paramBoolean)
  {
    if (paramInt == jdField_a_of_type_Int)
    {
      if ((jdField_a_of_type_ComTencentImageURLDrawable != null) && (jdField_a_of_type_ComTencentImageURLDrawable.getStatus() == 0)) {
        jdField_a_of_type_ComTencentImageURLDrawable.cancelDownload(true);
      }
      jdField_a_of_type_ComTencentImageURLDrawable = null;
      jdField_a_of_type_Int = -1;
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, "(preview)destory rawDrawable, position: " + paramInt);
      }
    }
  }
  
  public void a(int paramInt, View paramView, RegionDrawableData paramRegionDrawableData)
  {
    if (!ImageView.class.isInstance(paramView)) {}
    do
    {
      return;
      paramView = ((ImageView)paramView).getDrawable();
    } while (!URLDrawable.class.isInstance(paramView));
    ((URLDrawable)paramView).updateRegionBitmap(paramRegionDrawableData);
  }
  
  public void b(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if (paramView != null)
    {
      if (paramView.getStatus() == 0) {
        paramView.cancelDownload(true);
      }
      jdField_a_of_type_AndroidUtilSparseArray.remove(paramInt);
    }
    if (QLog.isColorLevel()) {
      QLog.d("PEAK", 2, a());
    }
  }
  
  public void c(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (!(paramView instanceof AbstractImageAdapter.URLImageView2)) {
      if (QLog.isColorLevel()) {
        QLog.d("PEAK", 2, "onscaleBegin,classcast error,class of current view is " + paramView.getClass().toString());
      }
    }
    do
    {
      do
      {
        do
        {
          return;
          paramView = (AbstractImageAdapter.URLImageView2)paramView;
          paramViewGroup = paramView.getDrawable();
          localObject = jdField_a_of_type_ComTencentImageURLDrawable;
        } while ((!(paramViewGroup instanceof URLDrawable)) || (!((URLDrawable)paramViewGroup).isFakeSize()) || (localObject != null));
        paramViewGroup = ((URLDrawable)paramViewGroup).getURL();
      } while ((!"file".equals(paramViewGroup.getProtocol())) || (paramViewGroup.getRef() != null));
      if ((paramInt != jdField_a_of_type_Int) || (jdField_a_of_type_ComTencentImageURLDrawable == null)) {
        break;
      }
      paramView = jdField_a_of_type_ComTencentImageURLDrawable;
    } while ((!QLog.isColorLevel()) || (jdField_a_of_type_ComTencentImageURLDrawable == null));
    QLog.d("PEAK", 2, "use exist raw drawable");
    return;
    if ((QLog.isColorLevel()) && (jdField_a_of_type_ComTencentImageURLDrawable != null)) {
      QLog.d("PEAK", 2, "rawDrawable is exist");
    }
    paramViewGroup = paramViewGroup.toString() + "#NOSAMPLE";
    Object localObject = URLDrawable.URLDrawableOptions.obtain();
    mUseExifOrientation = false;
    mUseMemoryCache = false;
    paramViewGroup = URLDrawable.getDrawable(paramViewGroup, (URLDrawable.URLDrawableOptions)localObject);
    paramViewGroup.setTag(Integer.valueOf(2));
    jdField_a_of_type_ComTencentImageURLDrawable = null;
    jdField_a_of_type_Int = paramInt;
    if (QLog.isColorLevel()) {
      QLog.d("PEAK", 2, "create rawDrawable, position:" + paramInt);
    }
    if (paramViewGroup.getStatus() == 1)
    {
      jdField_a_of_type_Boolean = true;
      paramView.setImageDrawable(paramViewGroup);
      jdField_a_of_type_Boolean = false;
      return;
    }
    paramView.setDecodingDrawble(paramViewGroup);
    paramViewGroup.startDownload();
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.a != null) {
      return jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.a.size();
    }
    return 0;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView != null) {
      return paramView;
    }
    AbstractImageAdapter.URLImageView2 localURLImageView2 = new AbstractImageAdapter.URLImageView2(paramViewGroup.getContext());
    Object localObject = (URLDrawable)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt);
    if ((localObject != null) && (((URLDrawable)localObject).getStatus() == 1)) {
      localURLImageView2.setImageDrawable((Drawable)localObject);
    }
    do
    {
      return localURLImageView2;
      localObject = a(paramInt);
      if (localObject == null) {
        break;
      }
      paramView = new File((String)localObject);
    } while (!paramView.exists());
    if (("FromCamera".equals(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.jdField_h_of_type_JavaLangString)) || ("FromFastImage".equals(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.jdField_h_of_type_JavaLangString))) {}
    for (;;)
    {
      try
      {
        paramView = URLDrawable.getDrawable(paramView.toURL(), jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.g, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoPreviewActivity.jdField_h_of_type_Int, URLDrawableHelper.d, null, true);
        if (paramView == null) {
          break;
        }
        localURLImageView2.setImageDrawable(paramView);
      }
      catch (Exception paramView)
      {
        if (QLog.isColorLevel()) {
          QLog.d(PhotoPreviewActivity.a(), 2, paramView.getMessage());
        }
        paramView = null;
        continue;
      }
      localObject = URLDrawable.URLDrawableOptions.obtain();
      mRequestWidth = paramViewGroup.getWidth();
      mRequestHeight = paramViewGroup.getHeight();
      mLoadingDrawable = URLDrawableHelper.d;
      mPlayGifImage = true;
      mUseAutoScaleParams = false;
      paramViewGroup = URLDrawable.getDrawable(paramView, (URLDrawable.URLDrawableOptions)localObject);
      paramView = paramViewGroup;
      switch (paramViewGroup.getStatus())
      {
      }
      paramViewGroup.setTag(Integer.valueOf(1));
      paramViewGroup.startDownload();
      paramView = paramViewGroup;
    }
  }
}
