import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLImageView;
import com.tencent.mobileqq.activity.photo.CameraPreviewActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.net.MalformedURLException;
import java.util.ArrayList;

public class mak
  extends BaseAdapter
{
  public mak(CameraPreviewActivity paramCameraPreviewActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public String a(int paramInt)
  {
    if ((CameraPreviewActivity.a(a) != null) && (paramInt < CameraPreviewActivity.a(a).size()) && (paramInt >= 0)) {
      return (String)CameraPreviewActivity.a(a).get(paramInt);
    }
    return null;
  }
  
  public int getCount()
  {
    if (CameraPreviewActivity.a(a) != null) {
      return CameraPreviewActivity.a(a).size();
    }
    return 0;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView == null)
    {
      paramView = a.getLayoutInflater().inflate(2130903441, null);
      paramViewGroup = new mal();
      a = ((URLImageView)paramView.findViewById(2131298570));
      paramView.setTag(paramViewGroup);
    }
    for (;;)
    {
      Object localObject = a(paramInt);
      if (localObject == null) {
        break;
      }
      localObject = new File((String)localObject);
      if (((File)localObject).exists()) {}
      try
      {
        a.setImageDrawable(URLDrawable.getDrawable(((File)localObject).toURL(), CameraPreviewActivity.a(a), CameraPreviewActivity.b(a), CameraPreviewActivity.a(a), null, true));
        return paramView;
      }
      catch (MalformedURLException paramViewGroup)
      {
        paramViewGroup.printStackTrace();
        return paramView;
      }
      paramViewGroup = (mal)paramView.getTag();
    }
    a.setImageDrawable(null);
    return paramView;
  }
}
