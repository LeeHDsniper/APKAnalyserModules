import com.tencent.mobileqq.activity.aio.item.ArkContainerWrapper;
import com.tencent.mobileqq.ark.ArkLocalAppMgr.AppPathInfo;
import com.tencent.mobileqq.ark.ArkLocalAppMgr.IGetAppPathByNameCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;

public class kva
  implements ArkLocalAppMgr.IGetAppPathByNameCallback
{
  public kva(ArkContainerWrapper paramArkContainerWrapper, WeakReference paramWeakReference, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean, ArkLocalAppMgr.AppPathInfo paramAppPathInfo, Object paramObject)
  {
    boolean bool = true;
    paramObject = (kvb)paramObject;
    QLog.d("ArkApp", 4, "ark container onGetAppPathByName In!!!!");
    ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localArkContainerWrapper != null)
    {
      if (paramAppPathInfo == null) {
        break label59;
      }
      paramAppPathInfo = a;
      if (!jdField_a_of_type_Boolean) {
        break label64;
      }
    }
    for (;;)
    {
      ArkContainerWrapper.a(localArkContainerWrapper, paramAppPathInfo, paramObject, bool);
      return;
      label59:
      paramAppPathInfo = null;
      break;
      label64:
      if (paramBoolean) {
        bool = false;
      }
    }
  }
}
