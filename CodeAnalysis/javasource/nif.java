import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.HttpNetReq;
import com.tencent.mobileqq.transfile.INetEngine.IBreakDownFix;
import com.tencent.mobileqq.transfile.NetReq;
import com.tencent.mobileqq.transfile.NetResp;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;

public final class nif
  implements INetEngine.IBreakDownFix
{
  public nif()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(NetReq paramNetReq, NetResp paramNetResp)
  {
    if ((paramNetReq == null) || (paramNetResp == null)) {}
    do
    {
      do
      {
        return;
      } while (!(paramNetReq instanceof HttpNetReq));
      paramNetReq = (HttpNetReq)paramNetReq;
      jdField_a_of_type_Long += c;
      c = 0L;
      paramNetResp = "bytes=" + jdField_a_of_type_Long + "-";
      jdField_a_of_type_JavaUtilHashMap.put("Range", paramNetResp);
      paramNetResp = jdField_a_of_type_JavaLangString;
      if (paramNetResp.contains("range="))
      {
        String str = paramNetResp.substring(0, paramNetResp.lastIndexOf("range="));
        jdField_a_of_type_JavaLangString = (str + "range=" + jdField_a_of_type_Long);
      }
    } while (!QLog.isColorLevel());
    QLog.i("MonitorSocketDownload", 2, "IBreakDownFix, " + paramNetResp);
  }
}
