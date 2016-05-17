import com.tencent.mobileqq.activity.aio.photo.AIOImageListModel;
import com.tencent.mobileqq.activity.aio.photo.AIOImageListScene;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.GestureSelectGridView;
import com.tencent.widget.GestureSelectGridView.OnSelectListener;

public class leb
  implements GestureSelectGridView.OnSelectListener
{
  int jdField_a_of_type_Int;
  boolean jdField_a_of_type_Boolean;
  int jdField_b_of_type_Int;
  boolean jdField_b_of_type_Boolean;
  
  public leb(AIOImageListScene paramAIOImageListScene)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = Integer.MIN_VALUE;
    jdField_b_of_type_Int = Integer.MAX_VALUE;
  }
  
  public void a()
  {
    if (!AIOImageListScene.d(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene)) {}
    while ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a() == 2) || (!jdField_b_of_type_Boolean)) {
      return;
    }
    jdField_b_of_type_Boolean = false;
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "onSelectEnd");
    }
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = Integer.MIN_VALUE;
    jdField_b_of_type_Int = Integer.MAX_VALUE;
  }
  
  public void a(int paramInt)
  {
    boolean bool2 = false;
    if (!AIOImageListScene.b(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene)) {
      break label12;
    }
    label12:
    while (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a() == 2) {
      return;
    }
    AIORichMediaInfo localAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a.a(paramInt);
    if (localAIORichMediaInfo.b() == 1) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      jdField_a_of_type_Boolean = bool1;
      AIOImageListScene localAIOImageListScene = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene;
      bool1 = bool2;
      if (!jdField_a_of_type_Boolean) {
        bool1 = true;
      }
      if (localAIOImageListScene.a(localAIORichMediaInfo, bool1, true))
      {
        jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.t();
        AIOImageListScene.g(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).o();
      }
      jdField_b_of_type_Boolean = true;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("AIOImageListScene", 2, "onSelectBegin beginIndex:" + paramInt);
      return;
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (!AIOImageListScene.c(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene)) {}
    while ((jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a() == 2) || (!jdField_b_of_type_Boolean)) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("AIOImageListScene", 2, "onSelectChanged beginIndex:" + paramInt1 + " selectIndex:" + paramInt2);
    }
    int j;
    int i;
    label99:
    AIORichMediaInfo localAIORichMediaInfo;
    AIOImageListScene localAIOImageListScene;
    if (paramInt2 < paramInt1)
    {
      j = paramInt1;
      i = paramInt2;
      if (jdField_b_of_type_Int > paramInt2)
      {
        jdField_b_of_type_Int = paramInt2;
        i = paramInt2;
        j = paramInt1;
      }
      paramInt1 = i;
      if (paramInt1 > j) {
        break label179;
      }
      localAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a.a(paramInt1);
      localAIOImageListScene = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene;
      if (jdField_a_of_type_Boolean) {
        break label173;
      }
    }
    label173:
    for (boolean bool = true;; bool = false)
    {
      localAIOImageListScene.a(localAIORichMediaInfo, bool, true);
      paramInt1 += 1;
      break label99;
      if (jdField_a_of_type_Int < paramInt2) {
        jdField_a_of_type_Int = paramInt2;
      }
      j = paramInt2;
      i = paramInt1;
      break;
    }
    label179:
    paramInt1 = j + 1;
    while (paramInt1 <= jdField_a_of_type_Int)
    {
      localAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a.a(paramInt1);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a(localAIORichMediaInfo, jdField_a_of_type_Boolean, true);
      paramInt1 += 1;
    }
    paramInt1 = jdField_b_of_type_Int;
    while (paramInt1 < i)
    {
      localAIORichMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a.a(paramInt1);
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.a(localAIORichMediaInfo, jdField_a_of_type_Boolean, true);
      paramInt1 += 1;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene.t();
    AIOImageListScene.h(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIOImageListScene).o();
  }
}
