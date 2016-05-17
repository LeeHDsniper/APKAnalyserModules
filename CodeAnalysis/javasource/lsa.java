import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.SlideDetectListView;
import java.util.List;

class lsa
  implements Runnable
{
  lsa(lrz paramLrz, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_Lrz.a.jdField_a_of_type_JavaUtilList = jdField_a_of_type_JavaUtilList;
    if ((jdField_a_of_type_Lrz.a.jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_Lrz.a.jdField_a_of_type_JavaUtilList.size() > 0))
    {
      if (jdField_a_of_type_Lrz.a.jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.a() != jdField_a_of_type_Lrz.a.jdField_a_of_type_Lsj) {
        jdField_a_of_type_Lrz.a.jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(jdField_a_of_type_Lrz.a.jdField_a_of_type_Lsj);
      }
      jdField_a_of_type_Lrz.a.jdField_a_of_type_Lsj.notifyDataSetChanged();
      return;
    }
    if (jdField_a_of_type_Lrz.a.jdField_a_of_type_JavaUtilList != null) {
      jdField_a_of_type_Lrz.a.jdField_a_of_type_JavaUtilList.clear();
    }
    jdField_a_of_type_Lrz.a.jdField_a_of_type_Lsj.notifyDataSetChanged();
    jdField_a_of_type_Lrz.a.jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setEmptyView(jdField_a_of_type_Lrz.a.d);
  }
}
