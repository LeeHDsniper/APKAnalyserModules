import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;
example@example.com
public class fab
  extends HttpEntityWrapper
{
  public fab(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public InputStream getContent()
  {
    return new GZIPInputStream(wrappedEntity.getContent());
  }
  
  public long getContentLength()
  {
    return -1L;
  }
}
