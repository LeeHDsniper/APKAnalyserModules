import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.PublicAccountHandler.IWeatherInfoListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import org.json.JSONException;
import org.json.JSONObject;

public class ljn
  implements PublicAccountHandler.IWeatherInfoListener
{
  public ljn(PublicAccountChatPie paramPublicAccountChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString)
  {
    int j = 0;
    String str = "";
    Object localObject = str;
    for (;;)
    {
      try
      {
        JSONObject localJSONObject = new JSONObject(paramString);
        localObject = str;
        paramString = localJSONObject.getString("area");
        localObject = paramString;
        int i = localJSONObject.getInt("area_id");
        int k;
        localJSONException1.printStackTrace();
      }
      catch (JSONException localJSONException1)
      {
        try
        {
          k = localJSONObject.getInt("switch");
          j = k;
          localObject = Message.obtain();
          what = 6;
          arg1 = i;
          arg2 = j;
          obj = paramString;
          a.a.sendMessage((Message)localObject);
          return;
        }
        catch (JSONException localJSONException2)
        {
          for (;;) {}
        }
        localJSONException1 = localJSONException1;
        i = 0;
        paramString = (String)localObject;
      }
    }
  }
}
