import android.content.res.Resources;
import android.support.v4.app.FragmentActivity;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.rebuild.TroopChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class llx
  implements Runnable
{
  llx(llw paramLlw, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    TroopChatPie.b(jdField_a_of_type_Llw.a).setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
    TroopChatPie.c(jdField_a_of_type_Llw.a).setText(jdField_a_of_type_Llw.a.a.getResources().getString(2131364804) + jdField_a_of_type_JavaLangString);
    TroopChatPie.b(jdField_a_of_type_Llw.a).setOnClickListener(null);
  }
}
