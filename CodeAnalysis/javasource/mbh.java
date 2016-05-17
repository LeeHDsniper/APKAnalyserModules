import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.photo.LocalMediaInfo;
import com.tencent.mobileqq.activity.photo.PhotoListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public class mbh
  extends Handler
{
  private final WeakReference a;
  
  public mbh(PhotoListActivity paramPhotoListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramPhotoListActivity);
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
        } while (a == null);
        localObject = (PhotoListActivity)a.get();
      } while (localObject == null);
      localObject = a;
    } while (localObject == null);
    ArrayList localArrayList = new ArrayList();
    localArrayList.addAll(a);
    paramMessage = paramMessage.getData();
    int i = paramMessage.getInt("ALBUMLIST_POSITION");
    long l = paramMessage.getLong("ALBUMLIST_ITEM_DURATION");
    paramMessage = (LocalMediaInfo)localArrayList.get(i);
    e = l;
    localArrayList.set(i, paramMessage);
    ((mbi)localObject).a(localArrayList);
    ((mbi)localObject).notifyDataSetChanged();
  }
}
