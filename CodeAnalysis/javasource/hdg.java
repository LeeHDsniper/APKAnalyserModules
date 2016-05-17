import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hdg
  implements Runnable
{
  public hdg(GalleryManager paramGalleryManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager.c = false;
    GalleryManager.a(a, a.jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene);
    GalleryManager.a(a, true);
  }
}
