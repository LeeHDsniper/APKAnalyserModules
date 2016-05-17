import com.tencent.mobileqq.activity.contact.troop.ShowExternalTroopListActivity.IShowExternalTroopDataChangedCallBack;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;

public class ltu
  implements ShowExternalTroopListActivity.IShowExternalTroopDataChangedCallBack
{
  public ltu(TroopActivity paramTroopActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    if ((a.a.containsKey(paramString)) && (((Boolean)a.a.get(paramString)).booleanValue() != paramBoolean))
    {
      a.a.remove(paramString);
      return;
    }
    a.a.put(paramString, Boolean.valueOf(paramBoolean));
  }
}
