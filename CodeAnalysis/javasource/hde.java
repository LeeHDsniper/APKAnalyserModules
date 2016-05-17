import com.tencent.common.galleryactivity.AbstractImageListScene;
import com.tencent.common.galleryactivity.AnimationLister;
import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class hde
  implements AnimationLister
{
  public hde(AbstractImageListScene paramAbstractImageListScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "image list onEnterAnimationEnd");
    }
    if (a.a.a() != a) {
      a.k();
    }
    a.b();
  }
  
  public void c()
  {
    a.c();
  }
  
  public void d()
  {
    a.d();
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "image list onExitAnimationEnd");
    }
    a.e();
  }
}
