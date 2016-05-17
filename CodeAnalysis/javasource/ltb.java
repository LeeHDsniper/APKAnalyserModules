import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter;
import com.tencent.mobileqq.activity.contact.troop.NotificationAdapter.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.mobileqq.widget.SlideDetectListView;
import java.util.List;

public class ltb
  implements View.OnClickListener
{
  public ltb(NotificationAdapter paramNotificationAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    NotificationAdapter.ViewHolder localViewHolder = (NotificationAdapter.ViewHolder)paramView.getTag();
    if ((localViewHolder == null) || (!(localViewHolder instanceof NotificationAdapter.ViewHolder))) {
      return;
    }
    a.jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.c();
    paramView = (View)paramView.getParent();
    if ((paramView instanceof ShaderAnimLayout)) {
      ((ShaderAnimLayout)paramView).c();
    }
    NotificationAdapter.a(a, a);
    a.jdField_a_of_type_JavaUtilList.add(NotificationAdapter.a(a).remove(a.getCount() - b - 1));
    a.notifyDataSetChanged();
  }
}
