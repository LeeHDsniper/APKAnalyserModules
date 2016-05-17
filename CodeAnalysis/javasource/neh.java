import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.app.LBSObserver;
import com.tencent.mobileqq.app.QQMapActivityProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.remote.ToServiceMsg;

public class neh
  extends LBSObserver
{
  public neh(QQMapActivityProxy paramQQMapActivityProxy)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, byte[] paramArrayOfByte)
  {
    if ((paramBoolean) && (paramArrayOfByte != null)) {
      QQMapActivityProxy.a(a).sendBroadcast(new Intent().setAction("com.tencent.mobileqq.onGetStreetViewUrl").putExtra("streetViewUrl", new String(paramArrayOfByte)));
    }
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject == null) {
      return;
    }
    ToServiceMsg localToServiceMsg = (ToServiceMsg)paramArrayOfObject[0];
    paramArrayOfObject = (byte[])paramArrayOfObject[1];
    Intent localIntent = new Intent();
    localIntent.setAction("com.tencent.mobileqq.onGetLbsShareSearch");
    localIntent.putExtra("data", paramArrayOfObject);
    localIntent.putExtra("req", extraData.getBundle("req"));
    QQMapActivityProxy.a(a).sendBroadcast(localIntent);
  }
  
  protected void b(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject == null) {
      return;
    }
    Intent localIntent = new Intent();
    localIntent.setAction("com.tencent.mobileqq.onGetLbsShareShop");
    localIntent.putExtra("data", (byte[])paramArrayOfObject[1]);
    localIntent.putExtra("req", 0extraData.getBundle("req"));
    QQMapActivityProxy.a(a).sendBroadcast(localIntent);
  }
  
  protected void c(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject == null) {
      return;
    }
    Intent localIntent = new Intent();
    localIntent.setAction("com.tencent.mobileqq.onGetShareShopDetail");
    localIntent.putExtra("data", (byte[])paramArrayOfObject[1]);
    localIntent.putExtra("req", 0extraData.getBundle("req"));
    QQMapActivityProxy.a(a).sendBroadcast(localIntent);
  }
}
