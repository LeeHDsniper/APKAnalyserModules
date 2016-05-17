import android.os.Handler;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialCareManager;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundActivity.SpecialSoundAdapter;
import com.tencent.mobileqq.app.QvipSpecialCareObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mqg
  extends QvipSpecialCareObserver
{
  public mqg(QvipSpecialSoundActivity paramQvipSpecialSoundActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onSendErrorEvent(Object paramObject)
  {
    if (paramObject != null)
    {
      a.stopTitleProgress();
      if (QvipSpecialSoundActivity.a(a) != null) {
        QvipSpecialSoundActivity.a(a).removeMessages(2);
      }
      if (((Integer)paramObject).intValue() == 10010)
      {
        QvipSpecialSoundActivity.a(a, a.getString(2131370672));
        QvipSpecialCareManager.a(null, 1, null, a.app);
      }
    }
    else
    {
      return;
    }
    QvipSpecialSoundActivity.a(a, a.getString(2131370673));
  }
  
  public void onSpecialSoundEvent(Object paramObject)
  {
    if (paramObject != null)
    {
      a.stopTitleProgress();
      if (QvipSpecialSoundActivity.a(a) != null) {
        QvipSpecialSoundActivity.a(a).removeMessages(2);
      }
      switch (((Integer)paramObject).intValue())
      {
      }
    }
    do
    {
      do
      {
        return;
      } while (QvipSpecialSoundActivity.a(a) == null);
      QvipSpecialSoundActivity.b(a);
      QvipSpecialSoundActivity.a(a).notifyDataSetChanged();
      return;
      QvipSpecialSoundActivity.c(a);
    } while (QvipSpecialSoundActivity.a(a) == null);
    QvipSpecialSoundActivity.a(a).notifyDataSetChanged();
  }
}
