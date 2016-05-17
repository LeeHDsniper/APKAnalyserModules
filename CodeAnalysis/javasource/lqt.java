import android.os.Handler;
import com.tencent.mobileqq.activity.contact.addcontact.ContactSearchFacade.ISearchListener;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.activity.contact.addcontact.SearchResult;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class lqt
  implements ContactSearchFacade.ISearchListener
{
  public lqt(SearchBaseFragment paramSearchBaseFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, boolean paramBoolean, Object paramObject, int paramInt2, String paramString)
  {
    int i = 3;
    a.i();
    if (paramBoolean)
    {
      if ((paramObject != null) && ((paramObject instanceof ArrayList)))
      {
        paramObject = (ArrayList)paramObject;
        if (paramObject.size() != 0) {
          break label94;
        }
        if (a.a != null)
        {
          paramObject = a.a;
          if (!a.b) {
            break label89;
          }
          paramInt1 = 3;
          paramObject.sendEmptyMessage(paramInt1);
        }
        if (QLog.isColorLevel()) {
          QLog.d(SearchBaseFragment.a(), 2, "error! SearchResult is null!");
        }
      }
      for (;;)
      {
        return;
        label89:
        paramInt1 = 2;
        break;
        label94:
        if (paramObject.size() > 0) {}
        try
        {
          paramString = (SearchResult)paramObject.get(0);
          if ((a.a(paramObject)) && (a.a != null))
          {
            a.a.sendEmptyMessage(0);
            return;
          }
        }
        catch (Exception paramObject)
        {
          if (QLog.isColorLevel()) {
            QLog.d(SearchBaseFragment.a(), 2, "", paramObject);
          }
          paramObject = a.a;
          if (!a.b) {}
        }
      }
      for (paramInt1 = i;; paramInt1 = 2)
      {
        paramObject.sendEmptyMessage(paramInt1);
        return;
      }
    }
    a.a(paramInt1, paramObject, paramInt2, paramString);
  }
}
