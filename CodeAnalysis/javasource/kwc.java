import android.view.View;
import com.tencent.mobileqq.activity.aio.item.FrameAnimationActor;
import com.tencent.mobileqq.activity.aio.item.FrameAnimationActor.Listener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kwc
  implements Runnable
{
  public kwc(FrameAnimationActor paramFrameAnimationActor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (a.jdField_a_of_type_AndroidViewView == null) {}
    do
    {
      return;
      if ((a.jdField_a_of_type_Int == 0) && (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener != null)) {
        a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener.a();
      }
      if (a.jdField_a_of_type_Int < a.jdField_a_of_type_ArrayOfInt.length) {
        break;
      }
      a.jdField_a_of_type_AndroidViewView.setBackgroundResource(a.jdField_a_of_type_ArrayOfInt[a.b]);
    } while (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener == null);
    a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener.b();
    return;
    a.jdField_a_of_type_AndroidViewView.setBackgroundResource(a.jdField_a_of_type_ArrayOfInt[a.jdField_a_of_type_Int]);
    if (a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener.a(a.jdField_a_of_type_Int);
    }
    a.jdField_a_of_type_AndroidViewView.postDelayed(FrameAnimationActor.a(a), a.c);
    FrameAnimationActor localFrameAnimationActor = a;
    jdField_a_of_type_Int += 1;
  }
}
