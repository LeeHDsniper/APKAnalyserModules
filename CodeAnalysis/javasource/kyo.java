import android.content.Context;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.MarketFaceItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.emoticonview.PicEmoticonInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.widget.QQProgressDialog;

public class kyo
  extends DownloadListener
{
  private kyo(MarketFaceItemBuilder paramMarketFaceItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, PicEmoticonInfo paramPicEmoticonInfo, QQProgressDialog paramQQProgressDialog, SessionInfo paramSessionInfo) {}
  
  public void onDone(DownloadTask paramDownloadTask) {}
}
