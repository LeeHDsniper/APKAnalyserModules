import android.os.Message;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class lry
  extends MqqHandler
{
  public lry(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    RecommendListView.a(a);
  }
}
