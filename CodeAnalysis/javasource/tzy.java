import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.MultiChoiceModeListener;

public class tzy
  implements AbsListView.MultiChoiceModeListener
{
  private AbsListView.MultiChoiceModeListener jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener;
  
  public tzy(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ActionMode paramActionMode, int paramInt, long paramLong, boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener.a(paramActionMode, paramInt, paramLong, paramBoolean);
    if (jdField_a_of_type_ComTencentWidgetAbsListView.e() == 0) {
      paramActionMode.finish();
    }
  }
  
  public void a(AbsListView.MultiChoiceModeListener paramMultiChoiceModeListener)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener = paramMultiChoiceModeListener;
  }
  
  public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
  {
    return jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener.onActionItemClicked(paramActionMode, paramMenuItem);
  }
  
  public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
  {
    boolean bool = false;
    if (jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener.onCreateActionMode(paramActionMode, paramMenu))
    {
      jdField_a_of_type_ComTencentWidgetAbsListView.setLongClickable(false);
      bool = true;
    }
    return bool;
  }
  
  public void onDestroyActionMode(ActionMode paramActionMode)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener.onDestroyActionMode(paramActionMode);
    jdField_a_of_type_ComTencentWidgetAbsListView.a = null;
    jdField_a_of_type_ComTencentWidgetAbsListView.g();
    jdField_a_of_type_ComTencentWidgetAbsListView.r = true;
    jdField_a_of_type_ComTencentWidgetAbsListView.r();
    jdField_a_of_type_ComTencentWidgetAbsListView.requestLayout();
    jdField_a_of_type_ComTencentWidgetAbsListView.setLongClickable(true);
  }
  
  public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
  {
    return jdField_a_of_type_ComTencentWidgetAbsListView$MultiChoiceModeListener.onPrepareActionMode(paramActionMode, paramMenu);
  }
}
