import QCARD.CouponMobileFolder;
import QCARD.GetListRsp;
import android.content.res.Resources;
import android.os.Handler;
import com.tencent.mobileqq.activity.qqcard.QQCardActivity;
import com.tencent.mobileqq.activity.qqcard.QQCardFooter;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

public class mcj
  extends QQCardObserver
{
  public mcj(QQCardActivity paramQQCardActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void c(boolean paramBoolean, GetListRsp paramGetListRsp)
  {
    a.jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
    Object localObject;
    int i;
    if (a.b.get())
    {
      localObject = a.jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
      if (paramBoolean)
      {
        i = 0;
        ((PullRefreshHeader)localObject).a(i);
        label45:
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 800L);
        if ((paramBoolean) && (paramGetListRsp != null)) {
          break label112;
        }
        QQToast.a(a, a.jdField_a_of_type_AndroidContentResResources.getString(2131366382), 0).a();
      }
    }
    label112:
    label178:
    do
    {
      for (;;)
      {
        return;
        i = 1;
        break;
        a.jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0);
        break label45;
        if (folder_list.size() > 0) {}
        for (localObject = (CouponMobileFolder)folder_list.get(0); localObject != null; localObject = null)
        {
          QQCardActivity.a(a, refresh_interval * 1000);
          if (op_type != 2) {
            break label178;
          }
          QQCardActivity.a(a);
          return;
        }
      }
      if (op_type == 1)
      {
        QQCardActivity.a(a, sequence, map_folderid_nextindex, (CouponMobileFolder)localObject);
        return;
      }
    } while (op_type != 3);
    QQCardActivity.a(a, sequence, (CouponMobileFolder)localObject);
  }
}
