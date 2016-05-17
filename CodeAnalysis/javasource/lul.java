import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.tencent.mobileqq.activity.fling.ContentWrapView;
import com.tencent.mobileqq.activity.fling.FlingTrackerHandler;
import com.tencent.mobileqq.activity.fling.ScreenCapture;
import com.tencent.mobileqq.activity.fling.TopLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class lul
  implements Runnable
{
  public lul(FlingTrackerHandler paramFlingTrackerHandler)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = (Activity)a.a.get();
    if (localObject1 == null) {}
    for (;;)
    {
      return;
      Object localObject2;
      if (!ScreenCapture.hasSnapFile((Context)localObject1))
      {
        if (FlingTrackerHandler.a(a) > 5) {
          FlingTrackerHandler.a(a, 0);
        }
      }
      else
      {
        localObject2 = (ViewGroup)((Activity)localObject1).getWindow().getDecorView();
        if (FlingTrackerHandler.a(a) != null) {
          break label303;
        }
        FlingTrackerHandler.a(a, ((ViewGroup)localObject2).getChildAt(0));
        View localView = FlingTrackerHandler.a(a);
        FlingTrackerHandler.a(a, new TopLayout((Context)localObject1));
        FlingTrackerHandler.a(a).setBackgroundColor(-16777216);
        TopLayout localTopLayout = FlingTrackerHandler.a(a);
        localTopLayout.setOnDraggingListener(a);
        ((ViewGroup)localObject2).addView(localTopLayout);
        ((ViewGroup)localObject2).removeView(localView);
        FlingTrackerHandler.a(a, new ContentWrapView((Context)localObject1));
        localObject2 = FlingTrackerHandler.a(a);
        ((ContentWrapView)localObject2).addView(localView);
        localTopLayout.setContent((ContentWrapView)localObject2);
        FlingTrackerHandler.a(a, new ImageView((Context)localObject1));
        FlingTrackerHandler.a(a).setScaleType(ImageView.ScaleType.FIT_START);
        localObject1 = FlingTrackerHandler.a(a);
        ((ImageView)localObject1).setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        localTopLayout.setBehind((View)localObject1);
      }
      while ((a.a()) && (FlingTrackerHandler.a(a) != null) && (FlingTrackerHandler.a(a).getDrawable() == null))
      {
        FlingTrackerHandler.a(a);
        return;
        FlingTrackerHandler.b(a);
        FlingTrackerHandler.a(a).postDelayed(this, 100L);
        return;
        label303:
        if (!a.a())
        {
          ((ViewGroup)localObject2).addView(FlingTrackerHandler.a(a));
          ((ViewGroup)localObject2).removeView(FlingTrackerHandler.a(a));
          FlingTrackerHandler.a(a).addView(FlingTrackerHandler.a(a));
        }
      }
    }
  }
}
