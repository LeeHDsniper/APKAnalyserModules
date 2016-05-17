import com.tencent.mobileqq.activity.contact.troop.DiscussionView;
import com.tencent.mobileqq.adapter.DiscussionListAdapter2;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.widget.XListView;
import java.util.ArrayList;

public class lta
  extends DiscussionObserver
{
  private lta(DiscussionView paramDiscussionView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a()
  {
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void a(boolean paramBoolean)
  {
    if (paramBoolean) {
      a.a();
    }
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    if (a.c)
    {
      a.c = false;
      if (paramBoolean)
      {
        DiscussionView.a(a).a(0);
        a.a(100, 800L);
      }
    }
    else
    {
      return;
    }
    a.jdField_a_of_type_ComTencentWidgetXListView.H();
    a.b(2131368310);
  }
  
  protected void a(boolean paramBoolean, long paramLong)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, long paramLong, String paramString)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, long paramLong, ArrayList paramArrayList)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, Long paramLong)
  {
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void a(boolean paramBoolean, Long paramLong1, Long paramLong2)
  {
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void a(boolean paramBoolean, String paramString)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void a(boolean paramBoolean, Object[] paramArrayOfObject)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void b()
  {
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void b(boolean paramBoolean, Long paramLong)
  {
    a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void b(boolean paramBoolean, String paramString)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
  
  protected void d(boolean paramBoolean, String paramString)
  {
    if (paramBoolean) {
      a.jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
    }
  }
}
