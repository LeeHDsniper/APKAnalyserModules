import com.tencent.mobileqq.app.CardObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.GetNearbyRecommender;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nhy
  extends CardObserver
{
  public nhy(GetNearbyRecommender paramGetNearbyRecommender)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void onGetDetailInfo(boolean paramBoolean, String paramString, Card paramCard)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "GetNearbyRecommender onGetDetailInfo|uin=" + paramString);
    }
    if (!aa).b.a().equals(paramString)) {
      return;
    }
    if (!paramBoolean)
    {
      a.a(7);
      return;
    }
    a.a(6);
  }
}
