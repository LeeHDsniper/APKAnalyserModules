import QCARD.GetListRsp;
import com.tencent.mobileqq.activity.qqcard.NearByQQCardFragment;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mcd
  extends QQCardObserver
{
  public mcd(NearByQQCardFragment paramNearByQQCardFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, GetListRsp paramGetListRsp)
  {
    NearByQQCardFragment.a(a, paramBoolean, paramGetListRsp);
  }
}
