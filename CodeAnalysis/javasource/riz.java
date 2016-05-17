import android.app.ProgressDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.memoryleak.DumpMemInfoHandler;
import com.tencent.mobileqq.testassister.activity.ShareDumpMemoryActivity;
import com.tencent.qphone.base.util.QLog;
import java.util.TimerTask;

public class riz
  extends TimerTask
{
  public riz(ShareDumpMemoryActivity paramShareDumpMemoryActivity, ProgressDialog paramProgressDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object[] arrayOfObject = DumpMemInfoHandler.a("mobileqq_leak");
    if (((Boolean)arrayOfObject[0]).booleanValue())
    {
      ShareDumpMemoryActivity.a(jdField_a_of_type_ComTencentMobileqqTestassisterActivityShareDumpMemoryActivity, (String)arrayOfObject[1]);
      if (QLog.isColorLevel()) {
        QLog.d("LeakInspector", 2, "leakFlag=true,ZipFile=true,leakName=" + ShareDumpMemoryActivity.a(jdField_a_of_type_ComTencentMobileqqTestassisterActivityShareDumpMemoryActivity) + ",dumpPath=" + ShareDumpMemoryActivity.b(jdField_a_of_type_ComTencentMobileqqTestassisterActivityShareDumpMemoryActivity));
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidAppProgressDialog.dismiss();
      jdField_a_of_type_ComTencentMobileqqTestassisterActivityShareDumpMemoryActivity.a();
      return;
      if (QLog.isColorLevel()) {
        QLog.d("LeakInspector", 2, "failed dump qq memory");
      }
    }
  }
}
