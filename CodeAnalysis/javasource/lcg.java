import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.BaseBubbleBuilder.ViewHolder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForTroopGift;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopGiftManager.DownloadGftData;
import java.util.Observable;
import java.util.Observer;

public abstract class lcg
  extends BaseBubbleBuilder.ViewHolder
  implements Observer
{
  public Button a;
  public ImageButton a;
  public ImageView a;
  public LinearLayout a;
  public TextView a;
  private QQAppInterface a;
  public MessageForTroopGift a;
  public View b;
  public TextView b;
  public View c;
  public TextView c;
  
  public lcg(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    paramObservable = (TroopGiftManager.DownloadGftData)paramObject;
    if ((a.equals(jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.animationPackageId + "")) && (jdField_a_of_type_ComTencentMobileqqDataMessageForTroopGift.isLoading)) {
      c.post(new lch(this, paramObservable));
    }
  }
}
