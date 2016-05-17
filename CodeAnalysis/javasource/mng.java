import android.widget.TextView;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mng
  extends FacePreloadBaseAdapter.ViewHolder
{
  TextView a;
  TextView b;
  
  mng()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
