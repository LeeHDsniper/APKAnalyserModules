import android.os.Handler;
import com.tencent.mobileqq.activity.aio.item.ShortVideoRealItemBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ProgressPieDrawable;
import com.tencent.mobileqq.widget.ProgressPieDrawable.OnProgressListener;
import com.tencent.qphone.base.util.QLog;

public class las
  implements ProgressPieDrawable.OnProgressListener
{
  public las(ShortVideoRealItemBuilder paramShortVideoRealItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProgressPieDrawable paramProgressPieDrawable)
  {
    if (QLog.isColorLevel()) {
      QLog.i("ShortVideoRealItemBuilder", 2, "[onProgressCompleted] hide ProgressPieDrawable ,ppd = " + paramProgressPieDrawable);
    }
    ShortVideoRealItemBuilder.a(a).postDelayed(new lat(this, paramProgressPieDrawable), 100L);
  }
  
  public void a(ProgressPieDrawable paramProgressPieDrawable, int paramInt1, int paramInt2) {}
}
