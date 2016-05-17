import android.app.Activity;
import com.tencent.common.galleryactivity.AbstractAnimationManager;
import com.tencent.common.galleryactivity.AbstractGalleryPageView;
import com.tencent.common.galleryactivity.AbstractGalleryScene;
import com.tencent.common.galleryactivity.AbstractProgressView;
import com.tencent.common.galleryactivity.AnimationLister;
import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.Gallery;

public class hcy
  implements AnimationLister
{
  public hcy(AbstractGalleryScene paramAbstractGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "gallery onEnterAnimationEnd");
    }
    if (a.jdField_a_of_type_ComTencentWidgetGallery.getVisibility() != 0) {
      a.jdField_a_of_type_ComTencentWidgetGallery.setVisibility(0);
    }
    a.b();
    if ((a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) && (!a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a())) {
      a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a();
    }
  }
  
  public void c()
  {
    if (a.jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().b) {
      a.jdField_a_of_type_ComTencentWidgetGallery.setVisibility(4);
    }
    a.c();
    if ((a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) && (a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a())) {
      a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.b();
    }
  }
  
  public void d()
  {
    if (a.jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().b) {
      a.jdField_a_of_type_ComTencentWidgetGallery.setVisibility(4);
    }
    if (a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView != null) {
      a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView.a(4);
    }
    if ((a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) && (a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a())) {
      a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.b();
    }
    a.d();
    a.jdField_a_of_type_ComTencentWidgetGallery.e();
  }
  
  public void e()
  {
    a.e();
    StringBuilder localStringBuilder;
    if (QLog.isColorLevel())
    {
      localStringBuilder = new StringBuilder().append("gallery onExitAnimationEnd ");
      if (a.jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a() != a) {
        break label87;
      }
    }
    label87:
    for (boolean bool = true;; bool = false)
    {
      QLog.d("GalleryComponent", 2, bool);
      if (a.jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a() != a) {
        break;
      }
      a.jdField_a_of_type_AndroidAppActivity.finish();
      return;
    }
    a.jdField_a_of_type_ComTencentWidgetGallery.setVisibility(0);
    a.k();
  }
}
