import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils.VideoFileSaveRunnable;
import java.io.File;
import java.util.Locale;
import mqq.os.MqqHandler;

class ldi
  implements DialogInterface.OnClickListener
{
  ldi(ldh paramLdh, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = jdField_a_of_type_JavaIoFile.getParentFile().getName().toLowerCase(Locale.US) + ".mp4";
    ThreadManager.a().post(new ShortVideoUtils.VideoFileSaveRunnable(jdField_a_of_type_JavaIoFile.getAbsolutePath(), jdField_a_of_type_Ldh.a.a, paramDialogInterface, true));
  }
}
