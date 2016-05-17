import android.app.Activity;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryAdapter;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListModel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.Gallery;

public final class ldp
  implements URLDrawable.URLDrawableListener
{
  public int a;
  public long a;
  public URLDrawable a;
  
  ldp(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onLoadCanceled(URLDrawable paramURLDrawable)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryScene", 2, "rawPhotoBtn decode onLoadCanceled URL():" + paramURLDrawable.getURL());
    }
    a.a(false);
    a.jdField_a_of_type_Ldp = null;
  }
  
  public void onLoadFialed(URLDrawable paramURLDrawable, Throwable paramThrowable)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryScene", 2, "rawPhotoBtn decode onLoadFialed URL():" + paramURLDrawable.getURL());
    }
    QQToast.a(AIOGalleryScene.a(a), AIOGalleryScene.b(a).getString(2131369974), 0).a();
    a.c(true);
    a.a(false);
    a.jdField_a_of_type_Ldp = null;
  }
  
  public void onLoadProgressed(URLDrawable paramURLDrawable, int paramInt) {}
  
  public void onLoadSuccessed(URLDrawable paramURLDrawable)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOGalleryScene", 2, "rawPhotoBtn decode onLoadSuccessed URL():" + paramURLDrawable.getURL());
    }
    a.c(false);
    a.a(false);
    a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListModel.b.b = paramURLDrawable.getExifOrientation();
    a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(paramURLDrawable, AIOGalleryScene.a(a).r());
    a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.notifyDataSetChanged();
    AIOGalleryScene.b(a).e();
    a.jdField_a_of_type_Ldp = null;
  }
}
