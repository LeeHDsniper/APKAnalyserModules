import com.tencent.mobileqq.activity.photo.MediaFileFilter;
import com.tencent.mobileqq.activity.photo.MimeHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class man
  extends MediaFileFilter
{
  public man()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean a(String paramString)
  {
    String[] arrayOfString = MimeHelper.a(paramString);
    if (arrayOfString != null)
    {
      if (("image".equals(arrayOfString[0])) && (MimeHelper.a(arrayOfString[1]))) {}
      while (("video".equals(arrayOfString[0])) && ("video/mp4".equals(paramString))) {
        return false;
      }
    }
    return true;
  }
}
