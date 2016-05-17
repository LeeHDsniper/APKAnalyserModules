import android.os.IBinder;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.galleryactivity.AbstractImageListModel;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryAdapter;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.activity.aio.photo.IAIOImageProvider;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lde
  implements View.OnClickListener
{
  public lde(AIOGalleryScene paramAIOGalleryScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (AIORichMediaInfo)a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryAdapter.a(AIOGalleryScene.a(a).b());
    if ((paramView != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.asBinder().pingBinder()))
    {
      a.a(true);
      a.jdField_a_of_type_Ldp = new ldp(a);
      a.jdField_a_of_type_Ldp.jdField_a_of_type_Long = a.e;
      a.jdField_a_of_type_Ldp.jdField_a_of_type_Int = a.i;
      a.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a(a.jdField_a_of_type_Ldp.jdField_a_of_type_Long, a.jdField_a_of_type_Ldp.jdField_a_of_type_Int, 4);
    }
  }
}
