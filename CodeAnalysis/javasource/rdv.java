import android.graphics.Bitmap;
import android.support.v4.util.MQLruCache;
import android.util.Pair;

public class rdv
  extends MQLruCache
{
  public rdv(Integer paramInteger)
  {
    super(paramInteger.intValue());
  }
  
  protected int a(String paramString, Object paramObject)
  {
    if ((paramObject instanceof Pair)) {
      return ((Integer)second).intValue();
    }
    if ((paramObject instanceof Bitmap))
    {
      paramString = (Bitmap)paramObject;
      return paramString.getRowBytes() * paramString.getHeight();
    }
    return 12;
  }
  
  public void a(String paramString, int paramInt) {}
}
