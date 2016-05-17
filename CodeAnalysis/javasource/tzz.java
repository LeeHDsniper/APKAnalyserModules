import android.view.View;
import android.widget.ListAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzz
  extends uad
  implements Runnable
{
  public int a;
  
  private tzz(AbsListView paramAbsListView)
  {
    super(paramAbsListView, null);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentWidgetAbsListView.r) {}
    ListAdapter localListAdapter;
    int i;
    boolean bool;
    View localView;
    do
    {
      do
      {
        return;
        localListAdapter = jdField_a_of_type_ComTencentWidgetAbsListView.a;
        i = jdField_a_of_type_Int;
        bool = AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView, i, jdField_a_of_type_ComTencentWidgetAbsListView.a.getCount());
      } while ((localListAdapter == null) || ((!bool) && (!AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView))) || (!a()));
      localView = jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(i - jdField_a_of_type_ComTencentWidgetAbsListView.au);
    } while ((localView == null) && (!AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView)));
    AbsListView localAbsListView = jdField_a_of_type_ComTencentWidgetAbsListView;
    if (bool) {}
    for (long l = localListAdapter.getItemId(i);; l = 0L)
    {
      localAbsListView.a(localView, i, l);
      return;
    }
  }
}
