import android.view.View;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class kxo
  implements FileManagerUtil.TipsClickedInterface
{
  public kxo(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    paramView = DialogUtil.a(a.a, 230);
    paramView.setTitle(2131371593);
    paramView.setMessage(2131371607);
    paramView.setNegativeButton(2131366996, new kxp(this, paramView));
    paramView.setPositiveButton(2131366997, new kxq(this));
    paramView.show();
  }
}
