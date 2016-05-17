import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lcj
  extends lcg
{
  public lcj(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
