import android.content.Intent;
import android.content.res.Resources;
import android.util.Pair;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.MimeHelper;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.activity.photo.StatisticConstants;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.mobileqq.utils.AlbumUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.GestureSelectGridView;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class mbg
  implements View.OnClickListener
{
  int jdField_a_of_type_Int;
  CheckBox jdField_a_of_type_AndroidWidgetCheckBox;
  
  public mbg(PhotoListActivity paramPhotoListActivity)
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
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) {
      return;
    }
    LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(jdField_a_of_type_Int);
    int i = jdField_b_of_type_Int;
    if ((!jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.A) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.o == 9501) && (i == 2) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.size() >= 1))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity, "最多只能选择1张图片", 0).b(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.r);
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    if ((i != 1) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.size() >= jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.n))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity, "最多只能选择" + jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.n + "张图片", 0).b(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.r);
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      return;
    }
    boolean bool;
    label212:
    String str;
    Object localObject;
    if (i == 1)
    {
      i = 2;
      jdField_b_of_type_Int = i;
      if (jdField_b_of_type_Int != 1) {
        break label597;
      }
      bool = true;
      str = jdField_a_of_type_JavaLangString;
      paramView = PresendPicMgr.a();
      if (!bool) {
        break label602;
      }
      localObject = MimeHelper.a(jdField_b_of_type_JavaLangString);
      if ((jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.B) && (localObject != null) && ("video".equals(localObject[0])))
      {
        localObject = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity;
        s += 1;
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.s == 1) {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = localLocalMediaInfo;
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.add(str);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d.add(jdField_a_of_type_JavaLangInteger);
      if (paramView != null) {
        paramView.a(str, 1007);
      }
      StatisticConstants.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.getIntent(), "param_totalSelNum");
      paramView = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.getIntent();
      if (!paramView.hasExtra("param_initTime")) {
        paramView.putExtra("param_initTime", System.currentTimeMillis());
      }
      localObject = (LinkedHashMap)AlbumUtil.b.get(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.j);
      paramView = (View)localObject;
      if (localObject == null)
      {
        paramView = new LinkedHashMap();
        AlbumUtil.b.put(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.j, paramView);
      }
      paramView.put(str, Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.s()));
      paramView = AlbumUtil.c;
      if (!paramView.containsKey(str)) {
        paramView.put(str, new Pair(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.j, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.i));
      }
    }
    for (;;)
    {
      PhotoListActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity, jdField_a_of_type_Int, bool);
      if ((jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.p == 2) && (new File(jdField_a_of_type_JavaLangString).length() > 19922944L))
      {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity, jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.getResources().getString(2131369812), 0).b(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.r);
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.p = 0;
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f();
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d();
      return;
      i = 1;
      break;
      label597:
      bool = false;
      break label212;
      label602:
      localObject = MimeHelper.a(jdField_b_of_type_JavaLangString);
      if ((jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.B) && (localObject != null) && ("video".equals(localObject[0])))
      {
        localObject = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity;
        s -= 1;
        if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.s == 1) {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = localLocalMediaInfo;
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.remove(str);
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d.remove(jdField_a_of_type_JavaLangInteger);
      if (paramView != null) {
        paramView.b(str, 1013);
      }
      StatisticConstants.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.getIntent(), "param_cancelSelNum");
      paramView = (HashMap)AlbumUtil.b.get(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.j);
      if (paramView != null) {
        paramView.remove(str);
      }
      paramView = AlbumUtil.c;
      if (paramView.containsKey(str)) {
        paramView.remove(str);
      }
    }
  }
}
