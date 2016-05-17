import android.content.Context;
import android.graphics.drawable.Drawable;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.CircleBubbleImageView;
import java.net.URL;

public class lao
  extends CircleBubbleImageView
{
  URLDrawable a;
  public URLDrawable b;
  
  public lao(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a(true);
  }
  
  public void a(URLDrawable paramURLDrawable)
  {
    if (a != null) {
      a.setURLDrawableListener(null);
    }
    paramURLDrawable.setURLDrawableListener(this);
    a = paramURLDrawable;
    paramURLDrawable.startDownload();
  }
  
  public boolean a(String paramString)
  {
    return (b == null) || (!b.getURL().getPath().equals(paramString));
  }
  
  public void b(URLDrawable paramURLDrawable)
  {
    setImageDrawable(paramURLDrawable);
    if (b != paramURLDrawable) {
      b = paramURLDrawable;
    }
  }
  
  public void onLoadFialed(URLDrawable paramURLDrawable, Throwable paramThrowable)
  {
    if (paramURLDrawable == a)
    {
      b(paramURLDrawable);
      return;
    }
    super.onLoadFialed(paramURLDrawable, paramThrowable);
  }
  
  public void onLoadSuccessed(URLDrawable paramURLDrawable)
  {
    if (paramURLDrawable == a) {
      b(paramURLDrawable);
    }
    super.onLoadSuccessed(paramURLDrawable);
  }
  
  public void setImageDrawable(Drawable paramDrawable)
  {
    super.setImageDrawable(paramDrawable);
    if (a != null)
    {
      a.setURLDrawableListener(null);
      a = null;
    }
  }
}
