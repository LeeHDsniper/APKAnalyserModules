import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.GestureSelectGridView;
import com.tencent.widget.GestureSelectGridView.OnSelectListener;
import java.util.HashSet;
import java.util.Iterator;

public class max
  implements GestureSelectGridView.OnSelectListener
{
  int jdField_a_of_type_Int;
  boolean jdField_a_of_type_Boolean;
  int b;
  
  public max(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) {}
    do
    {
      return;
      PresendPicMgr localPresendPicMgr = PresendPicMgr.a();
      if (localPresendPicMgr != null)
      {
        Iterator localIterator = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.b.iterator();
        while (localIterator.hasNext()) {
          localPresendPicMgr.a((String)localIterator.next(), 1007);
        }
        localIterator = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.iterator();
        while (localIterator.hasNext()) {
          localPresendPicMgr.b((String)localIterator.next(), 1013);
        }
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.b.clear();
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.clear();
    } while (!QLog.isColorLevel());
    QLog.d("OnSelectListener", 2, "onSelectEnd");
  }
  
  public void a(int paramInt)
  {
    boolean bool = false;
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) {}
    LocalMediaInfo localLocalMediaInfo;
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("OnSelectListener", 2, "onSelectBegin beginIndex:" + paramInt);
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.b.clear();
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.c.clear();
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.C = false;
      jdField_a_of_type_Boolean = false;
      b = paramInt;
      jdField_a_of_type_Int = paramInt;
      localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(paramInt);
      if (b == 2) {
        bool = true;
      }
      jdField_a_of_type_Boolean = bool;
    } while (!jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.a(localLocalMediaInfo, jdField_a_of_type_Boolean));
    jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d();
    jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.o();
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.f) {}
    int j;
    int k;
    do
    {
      do
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("OnSelectListener", 2, "onSelectChanged beginIndex:" + paramInt1 + " selectIndex:" + paramInt2);
        }
        j = Math.min(paramInt1, paramInt2);
        k = Math.max(paramInt1, paramInt2);
        if (paramInt2 >= paramInt1) {
          break;
        }
        i = b;
        b = Math.min(paramInt2, b);
        if (paramInt2 >= i) {
          break label296;
        }
      } while ((jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.C));
      i -= 1;
      while (i >= paramInt2)
      {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(i), jdField_a_of_type_Boolean);
        if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.C))
        {
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d();
          jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.o();
          return;
        }
        i -= 1;
      }
      i = jdField_a_of_type_Int;
      jdField_a_of_type_Int = Math.max(paramInt2, jdField_a_of_type_Int);
      if (paramInt2 <= i) {
        break;
      }
    } while ((jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.C));
    i += 1;
    while (i <= paramInt2)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(i), jdField_a_of_type_Boolean);
      if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.C))
      {
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d();
        jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.o();
        return;
      }
      i += 1;
    }
    label296:
    int i = b;
    PhotoListActivity localPhotoListActivity;
    LocalMediaInfo localLocalMediaInfo;
    boolean bool;
    if (i < j)
    {
      localPhotoListActivity = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity;
      localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(i);
      if (!jdField_a_of_type_Boolean) {}
      for (bool = true;; bool = false)
      {
        localPhotoListActivity.a(localLocalMediaInfo, bool);
        i += 1;
        break;
      }
    }
    i = k + 1;
    if (i <= jdField_a_of_type_Int)
    {
      localPhotoListActivity = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity;
      localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_Mbi.a(i);
      if (!jdField_a_of_type_Boolean) {}
      for (bool = true;; bool = false)
      {
        localPhotoListActivity.a(localLocalMediaInfo, bool);
        i += 1;
        break;
      }
    }
    if (paramInt2 < paramInt1)
    {
      b = paramInt2;
      if (jdField_a_of_type_Int > paramInt1) {
        jdField_a_of_type_Int = paramInt1;
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.d();
      jdField_a_of_type_ComTencentMobileqqActivityPhotoPhotoListActivity.jdField_a_of_type_ComTencentWidgetGestureSelectGridView.o();
      return;
      jdField_a_of_type_Int = paramInt2;
      if (b < paramInt1) {
        b = paramInt1;
      }
    }
  }
}
