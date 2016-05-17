import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.aio.tips.ReaderTipsBar;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lnd
  implements View.OnClickListener
{
  public lnd(ReaderTipsBar paramReaderTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Intent();
    paramView.setAction("cooperation.qqreader.aioback2reader");
    paramView.putExtra("bookid", ReaderTipsBar.a(a));
    ReaderTipsBar.a(a).sendBroadcast(paramView);
  }
}
