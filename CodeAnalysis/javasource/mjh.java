import android.os.FileObserver;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mjh
  extends FileObserver
{
  public static final String a;
  private boolean a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = mjh.class.getSimpleName();
  }
  
  mjh(String paramString, int paramInt)
  {
    super(paramString, paramInt);
    jdField_a_of_type_Boolean = false;
  }
  
  private void a()
  {
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = true;
      RMVideoStateMgr.a().a(new mji(this));
    }
  }
  
  public void onEvent(int paramInt, String paramString)
  {
    if ((paramInt & 0x20) == 32) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "RMFileEventNotify[onEvent][OPEN]  path=" + paramString);
      }
    }
    do
    {
      return;
      if ((paramInt & 0x400) == 1024)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "RMFileEventNotify[onEvent][DELETE_SELF]  path=" + paramString);
        }
        a();
        return;
      }
      if ((paramInt & 0x200) == 512)
      {
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "RMFileEventNotify[onEvent][DELETE]  path=" + paramString);
        }
        a();
        return;
      }
    } while ((paramInt & 0x8) != 8);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "RMFileEventNotify[onEvent][CLOSE_WRITE]  path=" + paramString);
    }
    a();
  }
}
