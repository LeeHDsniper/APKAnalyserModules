import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel;
import com.tencent.mobileqq.activity.aio.photo.PhotoListPanel.MyAdapter;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DialogUtil.DialogOnClickAdapter;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.NumberCheckBox;
import com.tencent.mobileqq.widget.QQToast;
import java.util.ArrayList;
import java.util.LinkedList;

public class ler
  implements View.OnClickListener
{
  int jdField_a_of_type_Int;
  CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  
  public ler(PhotoListPanel paramPhotoListPanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
  }
  
  public void a(CheckBox paramCheckBox)
  {
    jdField_a_of_type_AndroidWidgetCheckBox = paramCheckBox;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter == null) {}
    while (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getCount() <= 0) {
      return;
    }
    LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a(jdField_a_of_type_Int);
    int i = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.getItemViewType(jdField_a_of_type_Int);
    if ((!jdField_a_of_type_Boolean) && (!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.isEmpty()))
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.size() >= jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.d)
      {
        paramView = String.format(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getResources().getString(2131366965), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.size()) });
        paramView = DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidAppActivity, paramView);
        paramView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        paramView.show();
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
        return;
      }
      int j = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel$MyAdapter.a((String)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.peek());
      if ((!jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.h) && (j != -1) && (j != i))
      {
        paramView = DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidAppActivity, 2131366968);
        paramView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
        paramView.show();
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
        return;
      }
      if ((j == 1) && (i == 1) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.size() >= jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.e))
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.e > 1) {}
        for (paramView = String.format(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getResources().getString(2131366966), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.size()) });; paramView = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getResources().getString(2131366969))
        {
          paramView = DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidAppActivity, paramView);
          paramView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
          paramView.show();
          jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
          return;
        }
      }
    }
    if ((i == 1) && (b > jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_Long))
    {
      paramView = DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidAppActivity, 2131366967);
      paramView.setPositiveButton(2131366997, new DialogUtil.DialogOnClickAdapter());
      paramView.show();
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
      return;
    }
    if ((i == 0) && (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) && (b > PhotoListPanel.jdField_a_of_type_Int))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getResources().getString(2131369812), 0).b(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.getResources().getDimensionPixelSize(2131492908));
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
      return;
    }
    boolean bool;
    if (!jdField_a_of_type_Boolean)
    {
      bool = true;
      jdField_a_of_type_Boolean = bool;
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(jdField_a_of_type_Boolean);
      if (!jdField_a_of_type_Boolean) {
        break label706;
      }
      if (i == 0) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.a(jdField_a_of_type_JavaLangString);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.add(jdField_a_of_type_JavaLangString);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilArrayList.add(jdField_a_of_type_JavaLangInteger);
      i = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.indexOf(jdField_a_of_type_JavaLangString);
      ((NumberCheckBox)jdField_a_of_type_AndroidWidgetCheckBox).setCheckedNumber(i + 1);
      ReportController.b(null, "CliOper", "", "", "0X8005E08", "0X8005E08", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.c();
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.h();
      return;
      bool = false;
      break;
      label706:
      if (i == 0) {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.b(jdField_a_of_type_JavaLangString);
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilLinkedList.remove(jdField_a_of_type_JavaLangString);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoPhotoListPanel.jdField_a_of_type_JavaUtilArrayList.remove(jdField_a_of_type_JavaLangInteger);
    }
  }
}
