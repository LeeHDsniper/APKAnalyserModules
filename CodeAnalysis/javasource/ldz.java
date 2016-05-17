import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ldz
  implements DialogInterface.OnClickListener
{
  public ldz(AIOImageListScene paramAIOImageListScene, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (paramInt == 1)
    {
      if (jdField_a_of_type_Int != 0) {
        break label47;
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a(new Integer[] { Integer.valueOf(0), Integer.valueOf(1) });
    }
    for (;;)
    {
      AIOImageListScene.b(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene, null);
      return;
      label47:
      if (jdField_a_of_type_Int == 1) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a(new Integer[] { Integer.valueOf(0), Integer.valueOf(2) });
      }
    }
  }
}
