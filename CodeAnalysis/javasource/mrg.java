import android.graphics.Bitmap;
import com.tencent.mobileqq.activity.specialcare.SpecailCareListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richstatus.IIconListener;

public class mrg
  implements IIconListener
{
  private mrg(SpecailCareListActivity paramSpecailCareListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2, Bitmap paramBitmap)
  {
    if ((paramBitmap != null) && (paramInt2 == 200))
    {
      if (a.j != 0) {
        a.b = true;
      }
    }
    else {
      return;
    }
    a.a.notifyDataSetChanged();
  }
}
