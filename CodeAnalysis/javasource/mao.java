import com.tencent.mobileqq.activity.photo.MediaFileFilter;
import com.tencent.mobileqq.activity.photo.MimeHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mao
  extends MediaFileFilter
{
  public mao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a(String paramString)
  {
    paramString = MimeHelper.a(paramString);
    return (paramString == null) || (!"image".equals(paramString[0])) || (!MimeHelper.a(paramString[1]));
  }
  
  public boolean b()
  {
    return false;
  }
}
