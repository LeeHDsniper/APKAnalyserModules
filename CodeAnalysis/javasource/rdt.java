import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.widget.QQToast;

class rdt
  implements Runnable
{
  rdt(rds paramRds, String paramString) {}
  
  public void run()
  {
    QQToast.a(BaseApplicationImpl.a, jdField_a_of_type_JavaLangString + "泄漏，正在生成dump文件", 2000).a();
  }
}
