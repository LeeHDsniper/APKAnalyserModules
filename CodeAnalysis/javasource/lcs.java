import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import com.tencent.common.galleryactivity.AbstractGalleryScene;
import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.common.galleryactivity.AbstractImageListScene;
import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryActivity;
import com.tencent.mobileqq.activity.aio.photo.AIOGallerySceneWithBusiness;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryUtils;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListModel;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider.Stub;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProviderCallBack;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.BinderWarpper;

public class lcs
  extends GalleryManager
{
  IAIOImageProviderCallBack jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProviderCallBack;
  
  public lcs(AIOGalleryActivity paramAIOGalleryActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProviderCallBack = new lct(this);
  }
  
  public AbstractGalleryScene a(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    return new AIOGallerySceneWithBusiness(paramActivity, paramAbstractImageListModel, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider, AIOGalleryActivity.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity));
  }
  
  public AbstractImageListModel a(Activity paramActivity)
  {
    return new AIOImageListModel();
  }
  
  public AbstractImageListScene a(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    return new AIOImageListScene(paramActivity, paramAbstractImageListModel, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider, AIOGalleryActivity.b(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity));
  }
  
  public void a(Activity paramActivity)
  {
    if (AIOGalleryUtils.a != null) {
      AIOGalleryUtils.a.removeMessages(1);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider == null)
    {
      BinderWarpper localBinderWarpper = (BinderWarpper)paramActivity.getIntent().getParcelableExtra("extra.IMAGE_PROVIDER");
      if (localBinderWarpper == null) {
        break label114;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider = IAIOImageProvider.Stub.a(a);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProviderCallBack);
      if (QLog.isColorLevel()) {
        QLog.d(AIOGalleryActivity.jdField_a_of_type_JavaLangString, 2, "IAIOImageProvider is " + jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryActivity.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider);
      }
    }
    super.a(paramActivity);
    return;
    label114:
    throw new IllegalArgumentException("can't find Binder in Intent..");
  }
  
  public boolean a()
  {
    return true;
  }
}
