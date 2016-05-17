import android.media.ExifInterface;
import android.os.AsyncTask;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.IOException;

public class ldg
  extends AsyncTask
{
  public ldg(AIOGalleryScene paramAIOGalleryScene, File paramFile, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected Void a(Void... paramVarArgs)
  {
    try
    {
      paramVarArgs = new ExifInterface(jdField_a_of_type_JavaIoFile.getAbsolutePath());
      if (jdField_a_of_type_Int == 0) {
        paramVarArgs.setAttribute("Orientation", String.valueOf(1));
      }
      for (;;)
      {
        paramVarArgs.saveAttributes();
        paramVarArgs = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOGalleryScene;
        m += 1;
        break label138;
        if (jdField_a_of_type_Int != 1) {
          break;
        }
        paramVarArgs.setAttribute("Orientation", String.valueOf(6));
      }
    }
    catch (IOException paramVarArgs)
    {
      while (QLog.isColorLevel())
      {
        QLog.e("AIOGalleryScene", 2, "save exif error", paramVarArgs);
        break;
        if (jdField_a_of_type_Int == 2) {
          paramVarArgs.setAttribute("Orientation", String.valueOf(3));
        } else if (jdField_a_of_type_Int == 3) {
          paramVarArgs.setAttribute("Orientation", String.valueOf(8));
        }
      }
    }
    label138:
    return null;
  }
}
