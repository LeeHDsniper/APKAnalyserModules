import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.GetBigEmoticonStep;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class nho
  implements Runnable
{
  public nho(GetBigEmoticonStep paramGetBigEmoticonStep)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject1 = new StringBuilder();
    ((StringBuilder)localObject1).append(AppConstants.bM);
    ((StringBuilder)localObject1).append("emojiIds.txt");
    Object localObject2 = new File(((StringBuilder)localObject1).toString());
    if (!((File)localObject2).exists()) {
      if (QLog.isColorLevel()) {
        QLog.d("GetBigEmoticonStep", 2, "doStep ends, file not exist.");
      }
    }
    for (;;)
    {
      return;
      localObject1 = new ArrayList();
      nhp localNhp;
      try
      {
        localObject2 = new JSONObject(FileUtils.a((File)localObject2)).getJSONArray("data");
        if ((localObject2 == null) || (((JSONArray)localObject2).length() == 0)) {
          continue;
        }
        i = 0;
        while (i < ((JSONArray)localObject2).length())
        {
          int j = ((JSONArray)localObject2).getJSONObject(i).getInt("epId");
          int k = ((JSONArray)localObject2).getJSONObject(i).getInt("type");
          localNhp = new nhp();
          jdField_a_of_type_JavaLangString = Integer.toString(j);
          jdField_a_of_type_Int = k;
          ((List)localObject1).add(localNhp);
          i += 1;
        }
        if (localJSONException.size() == 0) {
          continue;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
      localObject2 = (EmojiManager)aa).b.getManager(42);
      int i = 0;
      while (i < localJSONException.size())
      {
        localNhp = (nhp)localJSONException.get(i);
        EmoticonPackage localEmoticonPackage = new EmoticonPackage();
        jobType = jdField_a_of_type_Int;
        epId = jdField_a_of_type_JavaLangString;
        ((EmojiManager)localObject2).a(localEmoticonPackage, true);
        i += 1;
      }
    }
  }
}
