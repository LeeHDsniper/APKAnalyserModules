import NS_MOBILE_PHOTO.get_albumlist_num_rsp;
import android.os.Bundle;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.observer.QZoneObserver;
import mqq.app.AppRuntime;

public class mbk
  extends QZoneObserver
{
  public mbk()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean, Bundle paramBundle)
  {
    paramBundle = paramBundle.getSerializable("data");
    if ((paramBoolean) && (paramBundle != null) && ((paramBundle instanceof get_albumlist_num_rsp))) {
      PhotoListActivity.d = album_num;
    }
    BaseApplicationImpl.a().a().unRegistObserver(PhotoListActivity.a());
  }
}
