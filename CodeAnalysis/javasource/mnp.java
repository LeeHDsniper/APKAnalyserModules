import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberForReadJoyActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Iterator;

public class mnp
  implements View.OnClickListener
{
  public mnp(SelectMemberForReadJoyActivity paramSelectMemberForReadJoyActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new ArrayList();
    Object localObject = a.j.iterator();
    while (((Iterator)localObject).hasNext()) {
      paramView.add(nexta);
    }
    localObject = new Intent();
    ((Intent)localObject).putStringArrayListExtra("RESULT_UINS", paramView);
    a.setResult(-1, (Intent)localObject);
    a.finish();
  }
}
