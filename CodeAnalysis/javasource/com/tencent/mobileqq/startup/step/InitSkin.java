package com.tencent.mobileqq.startup.step;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.app.OOMHandler;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.R.color;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinEngine;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import mqq.os.MqqHandler;
import rdw;

public class InitSkin
  extends Step
{
  public static boolean a;
  private static final int[] a;
  private static final int[] b = { 2130837523, 2130837524, 2130837526, 2130837527, 2130837529, 2130837530, 2130837532, 2130837533, 2130838168, 2130838167, 2130842479, 2130842787, 2130842786, 2130842013, 2130838442, 2130838441, 2130842902, 2130842611, 2130842614, 2130842619, 2130842620, 2130842621, 2130842622, 2130842623, 2130842624, 2130842625, 2130842905, 2130842955, 2130838470, 2130838468, 2130838469, 2130838467, 2130838465, 2130838466, 2130839750, 2130839748, 2130839749, 2130838473, 2130838471, 2130838472, 2130837736, 2130842982, 2130838650, 2130838651, 2130838652, 2130838653, 2130842766, 2130842557, 2130842595, 2130842597, 2130839155, 2130839153, 2130839159, 2130842655, 2130842651, 2130842658, 2130839160, 2130839162, 2130842609, 2130839166, 2130839165, 2130842561, 2130842720, 2130842718, 2130842712, 2130838286, 2130842727, 2130842729 };
  private static final int[] c = { 2130837523, 2130837524, 2130837526, 2130837527, 2130837529, 2130837530, 2130837532, 2130837533, 2130837543, 2130837568, 2130837622, 2130837686, 2130843018, 2130843015, 2130843016, 2130843013, 2130843014, 2130843020, 2130837736, 2130837737, 2130837738, 2130838033, 2130838053, 2130838055, 2130838099, 2130838100, 2130838102, 2130838103, 2130838109, 2130838110, 2130838112, 2130838113, 2130838167, 2130838168, 2130838171, 2130838188, 2130838192, 2130838194, 2130838220, 2130838226, 2130838243, 2130838286, 2130838299, 2130838315, 2130839941, 2130838365, 2130838383, 2130837760, 2130843017, 2130843008, 2130838435, 2130841796, 2130841797, 2130841798, 2130838463, 2130838464, 2130841913, 2130838551, 2130838573, 2130839059, 2130839060, 2130839061, 2130839062, 2130839459, 2130839460, 2130839494, 2130840083, 2130840084, 2130840794, 2130840795, 2130840799, 2130840800, 2130840802, 2130840803, 2130840804, 2130840805, 2130840816, 2130841322, 2130841323, 2130841324, 2130843022, 2130841356, 2130841357, 2130841358, 2130841385, 2130841386, 2130841391, 2130841404, 2130841407, 2130841408, 2130841409, 2130841416, 2130841421, 2130841427, 2130841428, 2130841429, 2130841430, 2130841431, 2130841432, 2130841433, 2130841435, 2130841436, 2130841438, 2130841440, 2130841441, 2130841442, 2130841443, 2130841444, 2130841446, 2130841447, 2130841449, 2130841452, 2130841454, 2130841455, 2130841456, 2130841463, 2130841479, 2130841480, 2130841481, 2130841482, 2130841483, 2130841484, 2130841485, 2130841486, 2130843027, 2130841487, 2130841488, 2130841489, 2130841490, 2130841491, 2130841492, 2130841493, 2130841494, 2130841495, 2130841496, 2130841497, 2130841498, 2130841499, 2130841500, 2130841501, 2130841502, 2130841503, 2130841504, 2130841505, 2130841506, 2130841507, 2130841508, 2130841509, 2130841510, 2130841511, 2130841512, 2130841513, 2130841514, 2130841515, 2130841516, 2130841517, 2130841518, 2130841519, 2130841520, 2130841521, 2130841522, 2130841523, 2130841524, 2130841525, 2130841526, 2130841527, 2130841528, 2130841529, 2130841530, 2130841531, 2130841532, 2130841533, 2130841534, 2130841543, 2130841544, 2130841545, 2130841546, 2130841555, 2130841556, 2130841557, 2130842691, 2130842689, 2130842690, 2130842694, 2130842692, 2130842695, 2130841576, 2130841577, 2130841578, 2130841579, 2130841580, 2130841591, 2130837529, 2130841592, 2130841593, 2130841594, 2130841595, 2130841596, 2130841597, 2130841602, 2130841603, 2130843010, 2130843011, 2130841611, 2130841618, 2130841623, 2130843021, 2130841628, 2130841629, 2130841630, 2130841637, 2130841638, 2130841639, 2130841640, 2130841641, 2130843024, 2130843026, 2130841642, 2130841643, 2130841644, 2130841645, 2130841692, 2130841694, 2130841695, 2130841701, 2130841702, 2130841703, 2130841704, 2130841706, 2130841707, 2130841708, 2130841710, 2130841712, 2130841713, 2130841714, 2130841715, 2130841717, 2130841718, 2130841719, 2130841731, 2130841732, 2130841733, 2130841734, 2130841735, 2130841736, 2130841737, 2130841738, 2130841739, 2130841741, 2130841745, 2130841747, 2130841751, 2130841754, 2130841755, 2130841756, 2130841757, 2130841758, 2130841762, 2130841763, 2130841764, 2130841765, 2130841766, 2130841767, 2130841774, 2130841776, 2130841777, 2130841790, 2130841791, 2130841792, 2130841794, 2130841795, 2130841800, 2130841802, 2130841803, 2130841806, 2130841808, 2130841810, 2130841811, 2130841812, 2130841871, 2130841882, 2130841883, 2130841884, 2130841885, 2130841886, 2130841887, 2130841888, 2130841889, 2130841890, 2130841891, 2130841892, 2130841895, 2130841900, 2130841902, 2130841903, 2130841904, 2130841906, 2130841907, 2130841908, 2130841909, 2130841910, 2130841911, 2130841912, 2130841936, 2130841941, 2130841945, 2130841949, 2130841951, 2130841954, 2130841956, 2130841957, 2130841958, 2130841959, 2130841960, 2130841961, 2130841964, 2130841973, 2130841976, 2130840424, 2130842001, 2130842002, 2130842009, 2130842010, 2130842011, 2130842012, 2130838152, 2130838151, 2130842679, 2130842014, 2130842015, 2130842016, 2130842017, 2130842018, 2130842019, 2130842020, 2130842021, 2130842022, 2130842023, 2130842024, 2130842041, 2130842095, 2130842096, 2130842102, 2130842111, 2130842117, 2130842182, 2130842193, 2130842194, 2130842196, 2130842198, 2130842199, 2130842200, 2130842203, 2130842204, 2130842210, 2130842212, 2130842214, 2130842229, 2130842230, 2130842232, 2130842233, 2130842239, 2130842240, 2130842241, 2130842242, 2130842243, 2130842245, 2130842251, 2130842252, 2130842253, 2130842254, 2130842255, 2130842256, 2130842257, 2130842258, 2130842259, 2130842270, 2130842271, 2130842272, 2130842273, 2130842274, 2130842275, 2130842276, 2130842278, 2130842280, 2130842281, 2130842282, 2130842283, 2130842284, 2130842285, 2130842286, 2130842337, 2130842338, 2130842339, 2130842340, 2130842342, 2130842344, 2130842378, 2130842389, 2130842390, 2130842391, 2130842413, 2130842411, 2130842412, 2130842414, 2130842415, 2130842417, 2130842557, 2130842575, 2130842576, 2130842577, 2130842578, 2130842579, 2130842583, 2130842584, 2130842585, 2130842591, 2130842592, 2130842593, 2130842594, 2130842595, 2130842596, 2130842597, 2130842611, 2130842614, 2130842619, 2130842620, 2130842621, 2130842622, 2130842623, 2130842624, 2130842625, 2130842626, 2130842632, 2130842633, 2130842634, 2130842635, 2130842636, 2130842637, 2130842638, 2130842641, 2130842642, 2130842645, 2130842646, 2130842651, 2130842682, 2130842683, 2130842684, 2130842685, 2130842686, 2130842687, 2130842688, 2130842696, 2130842698, 2130842699, 2130842700, 2130842701, 2130842702, 2130842709, 2130842712, 2130842714, 2130842716, 2130842718, 2130842720, 2130842723, 2130842725, 2130842727, 2130842729, 2130842736, 2130842738, 2130842742, 2130842744, 2130842774, 2130842775, 2130842803, 2130842894, 2130842896, 2130842897, 2130842899, 2130842900, 2130842901, 2130842982, 2130842912, 2130842914, 2130842980, 2130841778 };
  
  static
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfInt = new int[] { 2130837561, 2130837641, 2130837640, 2130837639, 2130838109, 2130838168, 2130838167, 2130838188, 2130838190, 2130838194, 2130838180, 2130838286, 2130838382, 2130838445, 2130838556, 2130839205, 2130839733, 2130840805, 2130840804, 2130840800, 2130840799, 2130840795, 2130840794, 2130839713, 2130839718, 2130839719, 2130839720, 2130839721, 2130839722, 2130839723, 2130839724, 2130839725, 2130839726, 2130839729, 2130839728, 2130839730, 2130839731, 2130839732, 2130839734, 2130839733, 2130839735, 2130839736, 2130839737, 2130839738, 2130839739, 2130839740, 2130839741, 2130839742, 2130839743, 2130839744, 2130839745, 2130840738, 2130840083, 2130840084, 2130839719, 2130839789, 2130840083, 2130840084, 2130839718, 2130842336, 2130842479, 2130842475, 2130842474, 2130842486, 2130842485, 2130842725, 2130842655, 2130842651, 2130842557, 2130842611, 2130842775, 2130842620, 2130842619, 2130842621, 2130842625, 2130842624, 2130842614, 2130842585, 2130842591, 2130842592, 2130842597, 2130842725, 2130842684, 2130842685, 2130842696, 2130842712, 2130842716, 2130842714, 2130842720, 2130842718, 2130838440, 2130838441, 2130842642, 2130839758, 2130839757, 2130838182, 2130838183, 2130842657, 2130842653 };
  }
  
  public InitSkin() {}
  
  public static final boolean a(Context paramContext)
  {
    for (;;)
    {
      try
      {
        localFile2 = paramContext.getCacheDir();
        l1 = SystemClock.uptimeMillis();
        SkinEngine.SWITCH_DEBUG = false;
        SkinEngine.DEBUG = false;
        localFile1 = new File(localFile2, "/skin/web_config");
        localFile2 = new File(localFile2, "/skin/web_skin_cache");
      }
      catch (Exception localException1)
      {
        File localFile2;
        long l1;
        File localFile1;
        ObjectInputStream localObjectInputStream;
        int i;
        String str;
        long l2;
        BaseApplicationImpl.jdField_a_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("SkinEngine", 2, "", localException1);
        paramContext = new File(paramContext.getCacheDir(), "/skin/unsupport");
        if (paramContext.exists()) {
          continue;
        }
        if (paramContext.getParentFile().exists()) {
          continue;
        }
        paramContext.getParentFile().mkdirs();
        try
        {
          paramContext.createNewFile();
        }
        catch (IOException paramContext) {}
        continue;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "No cache found");
        SkinEngine.init(paramContext, b, R.color.class, 2131427328, null);
        ThreadManager.b().postDelayed(new rdw("/skin/web_config", "/skin/web_skin_cache"), 10000L);
        continue;
      }
      try
      {
        if (!localFile1.exists()) {
          continue;
        }
        localObjectInputStream = new ObjectInputStream(new BufferedInputStream(new FileInputStream(localFile1)));
        i = localObjectInputStream.readInt();
        str = localObjectInputStream.readUTF();
        localObjectInputStream.close();
        if ((i != AppSetting.a) || (!"201932".equals(str))) {
          continue;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "web skin cache find, use cache file accered");
        }
        SkinEngine.init(paramContext, b, R.color.class, 2131427328, localFile2);
      }
      catch (Exception localException3)
      {
        if (localFile1.exists()) {
          continue;
        }
        localFile1.delete();
        if (localFile2.exists()) {
          continue;
        }
        localFile2.delete();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "web skin Cache load failed.", localException3);
        SkinEngine.init(paramContext, b, R.color.class, 2131427328, null);
        continue;
      }
      SkinEngine.getInstances().setSkinEngineHandler(new OOMHandler(BaseApplicationImpl.a()));
      SkinEngine.getInstances().addDrawableResource(2130837739);
      SkinEngine.getInstances().addDrawableResource(2130838185);
      l2 = SystemClock.uptimeMillis();
      try
      {
        paramContext.getResources().getDrawable(2130837504);
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "web skin init skin engine cost: " + (l2 - l1));
        }
        return true;
      }
      catch (Exception localException2)
      {
        if (!QLog.isColorLevel()) {
          break label507;
        }
        QLog.e("SkinEngine", 2, "", localException2);
        SkinEngine.getInstances().unInit();
        throw localException2;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SkinEngine", 2, "web skin cache time out");
      }
      SkinEngine.init(paramContext, b, R.color.class, 2131427328, null);
      ThreadManager.b().postDelayed(new rdw("/skin/web_config", "/skin/web_skin_cache"), 10000L);
    }
  }
  
  public static final boolean b(Context paramContext)
  {
    for (;;)
    {
      try
      {
        localFile2 = paramContext.getCacheDir();
        l1 = SystemClock.uptimeMillis();
        SkinEngine.SWITCH_DEBUG = false;
        SkinEngine.DEBUG = false;
        localFile1 = new File(localFile2, "/skin/qqfav_config");
        localFile2 = new File(localFile2, "/skin/qqfav_skin_cache");
      }
      catch (Exception localException1)
      {
        File localFile2;
        long l1;
        File localFile1;
        ObjectInputStream localObjectInputStream;
        int i;
        String str;
        long l2;
        BaseApplicationImpl.jdField_a_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("SkinEngine", 2, "", localException1);
        paramContext = new File(paramContext.getCacheDir(), "/skin/unsupport");
        if (paramContext.exists()) {
          continue;
        }
        if (paramContext.getParentFile().exists()) {
          continue;
        }
        paramContext.getParentFile().mkdirs();
        try
        {
          paramContext.createNewFile();
        }
        catch (IOException paramContext) {}
        continue;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "No cache found");
        SkinEngine.init(paramContext, jdField_a_of_type_ArrayOfInt, R.color.class, 2131427328, null);
        ThreadManager.b().postDelayed(new rdw("/skin/qqfav_config", "/skin/qqfav_skin_cache"), 10000L);
        continue;
      }
      try
      {
        if (!localFile1.exists()) {
          continue;
        }
        localObjectInputStream = new ObjectInputStream(new BufferedInputStream(new FileInputStream(localFile1)));
        i = localObjectInputStream.readInt();
        str = localObjectInputStream.readUTF();
        localObjectInputStream.close();
        if ((i != AppSetting.a) || (!"201932".equals(str))) {
          continue;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "qqfav skin cache find, use cache file accered");
        }
        SkinEngine.init(paramContext, jdField_a_of_type_ArrayOfInt, R.color.class, 2131427328, localFile2);
      }
      catch (Exception localException3)
      {
        if (localFile1.exists()) {
          continue;
        }
        localFile1.delete();
        if (localFile2.exists()) {
          continue;
        }
        localFile2.delete();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "qqfav skin Cache load failed.", localException3);
        SkinEngine.init(paramContext, jdField_a_of_type_ArrayOfInt, R.color.class, 2131427328, null);
        continue;
      }
      SkinEngine.getInstances().setSkinEngineHandler(new OOMHandler(BaseApplicationImpl.a()));
      SkinEngine.getInstances().addDrawableResource(2130837739);
      SkinEngine.getInstances().addDrawableResource(2130838046);
      SkinEngine.getInstances().addDrawableResource(2130838185);
      SkinEngine.getInstances().addDrawableResource(2130838054);
      l2 = SystemClock.uptimeMillis();
      try
      {
        paramContext.getResources().getDrawable(2130837504);
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "qqfav skin init skin engine cost: " + (l2 - l1));
        }
        return true;
      }
      catch (Exception localException2)
      {
        if (!QLog.isColorLevel()) {
          break label525;
        }
        QLog.e("SkinEngine", 2, "", localException2);
        SkinEngine.getInstances().unInit();
        throw localException2;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SkinEngine", 2, "qqfav skin cache time out");
      }
      SkinEngine.init(paramContext, jdField_a_of_type_ArrayOfInt, R.color.class, 2131427328, null);
      ThreadManager.b().postDelayed(new rdw("/skin/qqfav_config", "/skin/qqfav_skin_cache"), 10000L);
    }
  }
  
  public static final boolean c(Context paramContext)
  {
    for (;;)
    {
      try
      {
        localFile2 = paramContext.getCacheDir();
        l1 = SystemClock.uptimeMillis();
        SkinEngine.SWITCH_DEBUG = false;
        SkinEngine.DEBUG = false;
        localFile1 = new File(localFile2, "/skin/qzone_config");
        localFile2 = new File(localFile2, "/skin/qzone_skin_cache");
      }
      catch (Exception localException1)
      {
        File localFile2;
        long l1;
        File localFile1;
        ObjectInputStream localObjectInputStream;
        int i;
        String str;
        long l2;
        BaseApplicationImpl.jdField_a_of_type_Boolean = false;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("SkinEngine", 2, "", localException1);
        paramContext = new File(paramContext.getCacheDir(), "/skin/unsupport");
        if (paramContext.exists()) {
          continue;
        }
        if (paramContext.getParentFile().exists()) {
          continue;
        }
        paramContext.getParentFile().mkdirs();
        try
        {
          paramContext.createNewFile();
        }
        catch (IOException paramContext) {}
        continue;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "No cache found");
        SkinEngine.init(paramContext, c, R.color.class, 2131427328, null);
        ThreadManager.b().postDelayed(new rdw("/skin/qzone_config", "/skin/qzone_skin_cache"), 10000L);
        continue;
      }
      try
      {
        if (!localFile1.exists()) {
          continue;
        }
        localObjectInputStream = new ObjectInputStream(new BufferedInputStream(new FileInputStream(localFile1)));
        i = localObjectInputStream.readInt();
        str = localObjectInputStream.readUTF();
        localObjectInputStream.close();
        if ((i != AppSetting.a) || (!"201932".equals(str))) {
          continue;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "qzone skin cache find, use cache file accered");
        }
        SkinEngine.init(paramContext, c, R.color.class, 2131427328, localFile2);
      }
      catch (Exception localException3)
      {
        if (localFile1.exists()) {
          continue;
        }
        localFile1.delete();
        if (localFile2.exists()) {
          continue;
        }
        localFile2.delete();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("SkinEngine", 2, "qzone skin Cache load failed.", localException3);
        SkinEngine.init(paramContext, c, R.color.class, 2131427328, null);
        continue;
      }
      SkinEngine.getInstances().setSkinEngineHandler(new OOMHandler(BaseApplicationImpl.a()));
      SkinEngine.getInstances().addDrawableResource(2130837739);
      SkinEngine.getInstances().addDrawableResource(2130838046);
      SkinEngine.getInstances().addDrawableResource(2130838185);
      SkinEngine.getInstances().addDrawableResource(2130838054);
      l2 = SystemClock.uptimeMillis();
      try
      {
        paramContext.getResources().getDrawable(2130837504);
        if (QLog.isColorLevel()) {
          QLog.d("SkinEngine", 2, "qzone skin init skin engine cost: " + (l2 - l1));
        }
        return true;
      }
      catch (Exception localException2)
      {
        if (!QLog.isColorLevel()) {
          break label525;
        }
        QLog.e("SkinEngine", 2, "", localException2);
        SkinEngine.getInstances().unInit();
        throw localException2;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SkinEngine", 2, "qzone skin cache time out");
      }
      SkinEngine.init(paramContext, c, R.color.class, 2131427328, null);
      ThreadManager.b().postDelayed(new rdw("/skin/qzone_config", "/skin/qzone_skin_cache"), 10000L);
    }
  }
  
  /* Error */
  public static final boolean initSkin(Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 608	android/content/Context:getCacheDir	()Ljava/io/File;
    //   4: astore 8
    //   6: invokestatic 614	android/os/SystemClock:uptimeMillis	()J
    //   9: lstore_2
    //   10: iconst_0
    //   11: putstatic 619	com/tencent/theme/SkinEngine:SWITCH_DEBUG	Z
    //   14: iconst_0
    //   15: putstatic 622	com/tencent/theme/SkinEngine:DEBUG	Z
    //   18: new 698	com/tencent/common/app/OOMHandler
    //   21: dup
    //   22: invokestatic 703	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   25: invokespecial 706	com/tencent/common/app/OOMHandler:<init>	(Lcom/tencent/common/app/BaseApplicationImpl;)V
    //   28: astore 6
    //   30: aload 6
    //   32: invokestatic 825	com/tencent/theme/SkinEngine:setSKLog	(Lcom/tencent/theme/ISkinEngineLog;)V
    //   35: getstatic 828	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   38: astore 7
    //   40: aload 7
    //   42: invokevirtual 834	android/app/Application:getPackageManager	()Landroid/content/pm/PackageManager;
    //   45: aload 7
    //   47: invokevirtual 837	android/app/Application:getPackageName	()Ljava/lang/String;
    //   50: sipush 128
    //   53: invokevirtual 843	android/content/pm/PackageManager:getApplicationInfo	(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    //   56: getfield 849	android/content/pm/ApplicationInfo:metaData	Landroid/os/Bundle;
    //   59: ldc_w 851
    //   62: invokevirtual 857	android/os/Bundle:getBoolean	(Ljava/lang/String;)Z
    //   65: ifeq +45 -> 110
    //   68: ldc 27
    //   70: invokestatic 863	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   73: putstatic 867	com/tencent/theme/SkinEngine:mIconResourceID	Ljava/lang/Integer;
    //   76: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   79: ifeq +31 -> 110
    //   82: ldc_w 679
    //   85: iconst_2
    //   86: new 729	java/lang/StringBuilder
    //   89: dup
    //   90: invokespecial 730	java/lang/StringBuilder:<init>	()V
    //   93: ldc_w 869
    //   96: invokevirtual 736	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   99: ldc 27
    //   101: invokevirtual 872	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   104: invokevirtual 742	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   107: invokestatic 685	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   110: new 624	java/io/File
    //   113: dup
    //   114: aload 8
    //   116: ldc_w 874
    //   119: invokespecial 629	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   122: astore 7
    //   124: new 624	java/io/File
    //   127: dup
    //   128: aload 8
    //   130: ldc_w 876
    //   133: invokespecial 629	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   136: astore 8
    //   138: aload 7
    //   140: invokevirtual 635	java/io/File:exists	()Z
    //   143: ifeq +541 -> 684
    //   146: new 637	java/io/ObjectInputStream
    //   149: dup
    //   150: new 639	java/io/BufferedInputStream
    //   153: dup
    //   154: new 641	java/io/FileInputStream
    //   157: dup
    //   158: aload 7
    //   160: invokespecial 644	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   163: invokespecial 647	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   166: invokespecial 648	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   169: astore 9
    //   171: aload 9
    //   173: invokevirtual 652	java/io/ObjectInputStream:readInt	()I
    //   176: istore_1
    //   177: aload 9
    //   179: invokevirtual 656	java/io/ObjectInputStream:readUTF	()Ljava/lang/String;
    //   182: astore 10
    //   184: aload 9
    //   186: invokevirtual 659	java/io/ObjectInputStream:close	()V
    //   189: iload_1
    //   190: getstatic 664	com/tencent/common/config/AppSetting:a	I
    //   193: if_icmpne +364 -> 557
    //   196: ldc_w 666
    //   199: aload 10
    //   201: invokevirtual 672	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   204: ifeq +353 -> 557
    //   207: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   210: ifeq +13 -> 223
    //   213: ldc_w 679
    //   216: iconst_2
    //   217: ldc_w 878
    //   220: invokestatic 685	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   223: aload_0
    //   224: ldc_w 880
    //   227: ldc_w 721
    //   230: ldc_w 687
    //   233: ldc_w 688
    //   236: aload 8
    //   238: invokestatic 883	com/tencent/theme/SkinEngine:init	(Landroid/content/Context;Ljava/lang/Class;ILjava/lang/Class;ILjava/io/File;)V
    //   241: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   244: aload 6
    //   246: invokevirtual 710	com/tencent/theme/SkinEngine:setSkinEngineHandler	(Lcom/tencent/theme/SkinEngineHandler;)V
    //   249: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   252: ldc_w 711
    //   255: invokevirtual 715	com/tencent/theme/SkinEngine:addDrawableResource	(I)V
    //   258: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   261: ldc_w 799
    //   264: invokevirtual 715	com/tencent/theme/SkinEngine:addDrawableResource	(I)V
    //   267: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   270: ldc_w 884
    //   273: invokevirtual 715	com/tencent/theme/SkinEngine:addDrawableResource	(I)V
    //   276: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   279: ldc_w 716
    //   282: invokevirtual 715	com/tencent/theme/SkinEngine:addDrawableResource	(I)V
    //   285: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   288: ldc_w 800
    //   291: invokevirtual 715	com/tencent/theme/SkinEngine:addDrawableResource	(I)V
    //   294: invokestatic 614	android/os/SystemClock:uptimeMillis	()J
    //   297: lstore 4
    //   299: new 886	com/tencent/theme/SkinEngine$BackupForOOMData
    //   302: dup
    //   303: ldc_w 887
    //   306: ldc_w 888
    //   309: getstatic 894	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   312: invokespecial 897	com/tencent/theme/SkinEngine$BackupForOOMData:<init>	(IILandroid/graphics/Bitmap$Config;)V
    //   315: astore 6
    //   317: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   320: ldc_w 887
    //   323: invokestatic 863	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   326: aload 6
    //   328: invokevirtual 901	com/tencent/theme/SkinEngine:addBackupForOOMData	(Ljava/lang/Integer;Lcom/tencent/theme/SkinEngine$BackupForOOMData;)V
    //   331: new 886	com/tencent/theme/SkinEngine$BackupForOOMData
    //   334: dup
    //   335: ldc_w 902
    //   338: ldc_w 888
    //   341: getstatic 894	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   344: invokespecial 897	com/tencent/theme/SkinEngine$BackupForOOMData:<init>	(IILandroid/graphics/Bitmap$Config;)V
    //   347: astore 6
    //   349: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   352: ldc_w 902
    //   355: invokestatic 863	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   358: aload 6
    //   360: invokevirtual 901	com/tencent/theme/SkinEngine:addBackupForOOMData	(Ljava/lang/Integer;Lcom/tencent/theme/SkinEngine$BackupForOOMData;)V
    //   363: new 886	com/tencent/theme/SkinEngine$BackupForOOMData
    //   366: dup
    //   367: ldc_w 903
    //   370: ldc_w 888
    //   373: getstatic 894	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   376: invokespecial 897	com/tencent/theme/SkinEngine$BackupForOOMData:<init>	(IILandroid/graphics/Bitmap$Config;)V
    //   379: astore 6
    //   381: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   384: ldc_w 903
    //   387: invokestatic 863	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   390: aload 6
    //   392: invokevirtual 901	com/tencent/theme/SkinEngine:addBackupForOOMData	(Ljava/lang/Integer;Lcom/tencent/theme/SkinEngine$BackupForOOMData;)V
    //   395: new 886	com/tencent/theme/SkinEngine$BackupForOOMData
    //   398: dup
    //   399: ldc_w 904
    //   402: ldc_w 888
    //   405: getstatic 894	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   408: invokespecial 897	com/tencent/theme/SkinEngine$BackupForOOMData:<init>	(IILandroid/graphics/Bitmap$Config;)V
    //   411: astore 6
    //   413: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   416: ldc_w 904
    //   419: invokestatic 863	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   422: aload 6
    //   424: invokevirtual 901	com/tencent/theme/SkinEngine:addBackupForOOMData	(Ljava/lang/Integer;Lcom/tencent/theme/SkinEngine$BackupForOOMData;)V
    //   427: aload_0
    //   428: invokevirtual 720	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   431: ldc_w 721
    //   434: invokevirtual 727	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   437: pop
    //   438: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   441: ifeq +325 -> 766
    //   444: ldc_w 679
    //   447: iconst_2
    //   448: new 729	java/lang/StringBuilder
    //   451: dup
    //   452: invokespecial 730	java/lang/StringBuilder:<init>	()V
    //   455: ldc_w 906
    //   458: invokevirtual 736	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   461: lload 4
    //   463: lload_2
    //   464: lsub
    //   465: invokevirtual 739	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   468: invokevirtual 742	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   471: invokestatic 685	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   474: goto +292 -> 766
    //   477: astore 7
    //   479: aload 7
    //   481: invokevirtual 909	android/content/pm/PackageManager$NameNotFoundException:printStackTrace	()V
    //   484: goto -374 -> 110
    //   487: astore 6
    //   489: iconst_0
    //   490: putstatic 771	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_Boolean	Z
    //   493: ldc_w 679
    //   496: iconst_1
    //   497: ldc_w 911
    //   500: aload 6
    //   502: invokestatic 776	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   505: new 624	java/io/File
    //   508: dup
    //   509: aload_0
    //   510: invokevirtual 608	android/content/Context:getCacheDir	()Ljava/io/File;
    //   513: ldc_w 778
    //   516: invokespecial 629	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   519: astore_0
    //   520: aload_0
    //   521: invokevirtual 635	java/io/File:exists	()Z
    //   524: ifne +242 -> 766
    //   527: aload_0
    //   528: invokevirtual 781	java/io/File:getParentFile	()Ljava/io/File;
    //   531: invokevirtual 635	java/io/File:exists	()Z
    //   534: ifne +11 -> 545
    //   537: aload_0
    //   538: invokevirtual 781	java/io/File:getParentFile	()Ljava/io/File;
    //   541: invokevirtual 784	java/io/File:mkdirs	()Z
    //   544: pop
    //   545: aload_0
    //   546: invokevirtual 787	java/io/File:createNewFile	()Z
    //   549: pop
    //   550: goto +216 -> 766
    //   553: astore_0
    //   554: goto +212 -> 766
    //   557: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   560: ifeq +13 -> 573
    //   563: ldc_w 679
    //   566: iconst_2
    //   567: ldc_w 913
    //   570: invokestatic 685	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   573: aload_0
    //   574: ldc_w 880
    //   577: ldc_w 721
    //   580: ldc_w 687
    //   583: ldc_w 688
    //   586: aconst_null
    //   587: invokestatic 883	com/tencent/theme/SkinEngine:init	(Landroid/content/Context;Ljava/lang/Class;ILjava/lang/Class;ILjava/io/File;)V
    //   590: invokestatic 749	com/tencent/mobileqq/app/ThreadManager:b	()Lmqq/os/MqqHandler;
    //   593: new 751	rdw
    //   596: dup
    //   597: ldc_w 874
    //   600: ldc_w 876
    //   603: invokespecial 754	rdw:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   606: ldc2_w 755
    //   609: invokevirtual 762	mqq/os/MqqHandler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   612: pop
    //   613: goto -372 -> 241
    //   616: astore 9
    //   618: aload 7
    //   620: invokevirtual 635	java/io/File:exists	()Z
    //   623: ifeq +9 -> 632
    //   626: aload 7
    //   628: invokevirtual 765	java/io/File:delete	()Z
    //   631: pop
    //   632: aload 8
    //   634: invokevirtual 635	java/io/File:exists	()Z
    //   637: ifeq +9 -> 646
    //   640: aload 8
    //   642: invokevirtual 765	java/io/File:delete	()Z
    //   645: pop
    //   646: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   649: ifeq +15 -> 664
    //   652: ldc_w 679
    //   655: iconst_2
    //   656: ldc_w 915
    //   659: aload 9
    //   661: invokestatic 770	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   664: aload_0
    //   665: ldc_w 880
    //   668: ldc_w 721
    //   671: ldc_w 687
    //   674: ldc_w 688
    //   677: aconst_null
    //   678: invokestatic 883	com/tencent/theme/SkinEngine:init	(Landroid/content/Context;Ljava/lang/Class;ILjava/lang/Class;ILjava/io/File;)V
    //   681: goto -440 -> 241
    //   684: invokestatic 677	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   687: ifeq +13 -> 700
    //   690: ldc_w 679
    //   693: iconst_2
    //   694: ldc_w 789
    //   697: invokestatic 685	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   700: aload_0
    //   701: ldc_w 880
    //   704: ldc_w 721
    //   707: ldc_w 687
    //   710: ldc_w 688
    //   713: aconst_null
    //   714: invokestatic 883	com/tencent/theme/SkinEngine:init	(Landroid/content/Context;Ljava/lang/Class;ILjava/lang/Class;ILjava/io/File;)V
    //   717: invokestatic 749	com/tencent/mobileqq/app/ThreadManager:b	()Lmqq/os/MqqHandler;
    //   720: new 751	rdw
    //   723: dup
    //   724: ldc_w 874
    //   727: ldc_w 876
    //   730: invokespecial 754	rdw:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   733: ldc2_w 755
    //   736: invokevirtual 762	mqq/os/MqqHandler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   739: pop
    //   740: goto -499 -> 241
    //   743: astore 6
    //   745: ldc_w 679
    //   748: iconst_1
    //   749: ldc_w 917
    //   752: aload 6
    //   754: invokestatic 776	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   757: invokestatic 696	com/tencent/theme/SkinEngine:getInstances	()Lcom/tencent/theme/SkinEngine;
    //   760: invokevirtual 792	com/tencent/theme/SkinEngine:unInit	()V
    //   763: aload 6
    //   765: athrow
    //   766: iconst_1
    //   767: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	768	0	paramContext	Context
    //   176	18	1	i	int
    //   9	455	2	l1	long
    //   297	165	4	l2	long
    //   28	395	6	localObject1	Object
    //   487	14	6	localException1	Exception
    //   743	21	6	localException2	Exception
    //   38	121	7	localObject2	Object
    //   477	150	7	localNameNotFoundException	android.content.pm.PackageManager.NameNotFoundException
    //   4	637	8	localFile	File
    //   169	16	9	localObjectInputStream	ObjectInputStream
    //   616	44	9	localException3	Exception
    //   182	18	10	str	String
    // Exception table:
    //   from	to	target	type
    //   35	110	477	android/content/pm/PackageManager$NameNotFoundException
    //   0	35	487	java/lang/Exception
    //   35	110	487	java/lang/Exception
    //   110	138	487	java/lang/Exception
    //   241	427	487	java/lang/Exception
    //   438	474	487	java/lang/Exception
    //   479	484	487	java/lang/Exception
    //   618	632	487	java/lang/Exception
    //   632	646	487	java/lang/Exception
    //   646	664	487	java/lang/Exception
    //   664	681	487	java/lang/Exception
    //   745	766	487	java/lang/Exception
    //   545	550	553	java/io/IOException
    //   138	223	616	java/lang/Exception
    //   223	241	616	java/lang/Exception
    //   557	573	616	java/lang/Exception
    //   573	613	616	java/lang/Exception
    //   684	700	616	java/lang/Exception
    //   700	740	616	java/lang/Exception
    //   427	438	743	java/lang/Exception
  }
  
  protected boolean a()
  {
    if (jdField_a_of_type_Boolean) {}
    String str;
    do
    {
      return true;
      jdField_a_of_type_Boolean = true;
      String[] arrayOfString = BaseApplicationImpl.processName.split(":");
      str = null;
      if (arrayOfString.length > 1) {
        str = arrayOfString[1];
      }
      if ((str == null) || (str.endsWith("map")) || (str.equals("pedit")) || (str.equals("plugin")) || (str.equals("demoji")) || (str.equals("peak")) || (str.equals("readinjoy")) || (str.endsWith("nearby")))
      {
        initSkin(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
        return true;
      }
      if (str.equals("qzone"))
      {
        c(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
        return true;
      }
      if (str.equals("web"))
      {
        a(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
        return true;
      }
    } while (!str.equals("qqfav"));
    b(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
    return true;
  }
}
