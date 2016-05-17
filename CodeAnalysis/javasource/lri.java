import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.biz.addContactTroopView.BaseTroopCardView;
import com.tencent.biz.addContactTroopView.TroopCardGroup;
import com.tencent.biz.addContactTroopView.TroopCardSameCity;
import com.tencent.biz.addContactTroopView.TroopCardXingquBuluo;
import com.tencent.mobileqq.activity.contact.addcontact.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.util.List;
import tencent.im.troop_search_searchtab.searchtab.Card;

public class lri
  extends BaseAdapter
{
  private List jdField_a_of_type_JavaUtilList;
  
  private lri(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if (TroopView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView) != null)
    {
      int j = TroopView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView).getChildCount();
      int i = 0;
      for (;;)
      {
        if (i < j) {
          try
          {
            View localView = TroopView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView).getChildAt(i);
            if ((localView instanceof BaseTroopCardView)) {
              ((BaseTroopCardView)localView).f();
            }
            i += 1;
          }
          catch (Exception localException)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.d("TroopView", 2, "CAdapter destroy() type conversion error");
              }
            }
          }
        }
      }
    }
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_JavaUtilList != null) {
      return jdField_a_of_type_JavaUtilList.size();
    }
    return 0;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public int getItemViewType(int paramInt)
  {
    return jdField_a_of_type_JavaUtilList.get(paramInt)).type.get() - 1;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = (searchtab.Card)jdField_a_of_type_JavaUtilList.get(paramInt);
    if (paramView == null) {
      if (1 == type.get())
      {
        paramView = new TroopCardGroup(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView.a);
        paramView.a();
      }
    }
    for (;;)
    {
      ((BaseTroopCardView)paramView).a(paramViewGroup);
      return paramView;
      if (2 == type.get())
      {
        paramView = new TroopCardSameCity(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView.a);
        paramView.a();
      }
      else
      {
        paramView = new TroopCardXingquBuluo(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactTroopView.a);
        paramView.a();
      }
    }
  }
  
  public int getViewTypeCount()
  {
    return 3;
  }
}
