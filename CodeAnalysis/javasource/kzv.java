import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.item.ReplyTextItemBuilder;
import com.tencent.mobileqq.activity.aio.item.TextItemBuilder.Holder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kzv
  extends TextItemBuilder.Holder
{
  public TextView a;
  
  public kzv(ReplyTextItemBuilder paramReplyTextItemBuilder)
  {
    super(paramReplyTextItemBuilder);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
