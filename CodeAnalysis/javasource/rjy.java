import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.HttpNetReq;
import com.tencent.mobileqq.transfile.INetEngine.IBreakDownFix;
import com.tencent.mobileqq.transfile.NetReq;
import com.tencent.mobileqq.transfile.NetResp;
import java.util.HashMap;

public final class rjy
  implements INetEngine.IBreakDownFix
{
  public rjy()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(NetReq paramNetReq, NetResp paramNetResp)
  {
    if ((paramNetReq == null) || (paramNetResp == null)) {}
    label8:
    do
    {
      do
      {
        do
        {
          break label8;
          do
          {
            return;
          } while (!(paramNetReq instanceof HttpNetReq));
          paramNetReq = (HttpNetReq)paramNetReq;
          jdField_a_of_type_Long += c;
          if (0L != b) {
            break;
          }
          c = 0L;
          paramNetResp = "bytes=" + jdField_a_of_type_Long + "-";
          jdField_a_of_type_JavaUtilHashMap.put("Range", paramNetResp);
          paramNetResp = jdField_a_of_type_JavaLangString;
        } while (!paramNetResp.contains("range="));
        paramNetResp = paramNetResp.substring(0, paramNetResp.lastIndexOf("range="));
        jdField_a_of_type_JavaLangString = (paramNetResp + "range=" + jdField_a_of_type_Long);
        return;
      } while ((jdField_a_of_type_Long <= 0L) || (b <= 0L) || (jdField_a_of_type_Long >= b));
      c = 0L;
      paramNetResp = "bytes=" + jdField_a_of_type_Long + "-" + b;
      jdField_a_of_type_JavaUtilHashMap.put("Range", paramNetResp);
      paramNetResp = jdField_a_of_type_JavaLangString;
    } while (!paramNetResp.contains("range="));
    paramNetResp = paramNetResp.substring(0, paramNetResp.lastIndexOf("range="));
    jdField_a_of_type_JavaLangString = (paramNetResp + "range=" + jdField_a_of_type_Long + "-" + b);
  }
}
