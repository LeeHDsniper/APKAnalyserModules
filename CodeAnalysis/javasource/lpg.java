import android.os.Message;
import android.os.Process;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.List;

public class lpg
  implements Runnable
{
  public lpg(SearchResultDialog paramSearchResultDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Process.setThreadPriority(10);
    List localList = a.a(a.getContext(), SearchResultDialog.a(a), SearchResultDialog.a(a));
    Message localMessage = SearchResultDialog.a(a).obtainMessage();
    what = 1;
    obj = localList;
    SearchResultDialog.a(a).sendMessage(localMessage);
  }
}
