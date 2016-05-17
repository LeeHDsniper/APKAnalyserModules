import android.view.View;
import android.view.ViewGroup;
import com.tencent.common.galleryactivity.UrlGalleryAdapter;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawableDownListener.Adapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hdk
  extends URLDrawableDownListener.Adapter
{
  public hdk(UrlGalleryAdapter paramUrlGalleryAdapter, int paramInt, ViewGroup paramViewGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLoadFailed(View paramView, URLDrawable paramURLDrawable, Throwable paramThrowable)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityUrlGalleryAdapter.a(jdField_a_of_type_Int, false);
  }
  
  public void onLoadProgressed(View paramView, URLDrawable paramURLDrawable, int paramInt)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityUrlGalleryAdapter.b(jdField_a_of_type_Int, paramInt / 100);
  }
  
  public void onLoadSuccessed(View paramView, URLDrawable paramURLDrawable)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityUrlGalleryAdapter.a(jdField_a_of_type_Int, true);
    paramView = jdField_a_of_type_ComTencentCommonGalleryactivityUrlGalleryAdapter.a(paramURLDrawable.getURL(), jdField_a_of_type_AndroidViewViewGroup);
    if (paramView != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityUrlGalleryAdapter.a(paramView, paramURLDrawable);
    }
  }
}
