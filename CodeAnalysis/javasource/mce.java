import QCARD.GetListRsp;
import com.tencent.mobileqq.activity.qqcard.NearByQQCardFragment;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mce
  extends QQCardObserver
{
  public mce(NearByQQCardFragment paramNearByQQCardFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void b(boolean paramBoolean, GetListRsp paramGetListRsp)
  {
    NearByQQCardFragment.a(a, paramBoolean, paramGetListRsp);
  }
}
