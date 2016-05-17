import com.tencent.mobileqq.activity.aio.photo.AIOGalleryScene;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

class lcu
  implements Runnable
{
  lcu(lct paramLct, boolean paramBoolean, long paramLong, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (lcs.a(jdField_a_of_type_Lct.a) != null)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("peak_pgjpeg", 4, "IAIOImageProviderCallBack.notifyImageResult():isPart " + jdField_a_of_type_Boolean);
      }
      ((AIOGalleryScene)lcs.b(jdField_a_of_type_Lct.a)).a(jdField_a_of_type_Long, jdField_a_of_type_Int, b, c, jdField_a_of_type_JavaLangString, jdField_a_of_type_Boolean);
    }
    if (lcs.a(jdField_a_of_type_Lct.a) != null) {
      ((AIOImageListScene)lcs.b(jdField_a_of_type_Lct.a)).a(jdField_a_of_type_Long, jdField_a_of_type_Int, b, c, jdField_a_of_type_JavaLangString);
    }
  }
}
