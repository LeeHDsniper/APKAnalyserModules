import com.tencent.mobileqq.activity.photo.MediaFileFilter;
import com.tencent.mobileqq.activity.photo.MimeHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class map
  extends MediaFileFilter
{
  public map()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a()
  {
    return false;
  }
  
  public boolean a(String paramString)
  {
    String[] arrayOfString = MimeHelper.a(paramString);
    return (arrayOfString == null) || (!"video".equals(arrayOfString[0])) || (!"video/mp4".equals(paramString));
  }
}
