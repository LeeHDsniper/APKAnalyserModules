package oicq.wlogin_sdk.request;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;
import oicq.wlogin_sdk.tools.cryptor;
import oicq.wlogin_sdk.tools.util;

public class j
{
  protected u a;
  
  public j() {}
  
  public String a(int paramInt)
  {
    String[] arrayOfString = new String[2];
    arrayOfString[0] = "log.wtlogin.qq.com";
    arrayOfString[1] = "log1.wtlogin.qq.com";
    return arrayOfString[Math.abs(paramInt % arrayOfString.length)];
  }
  
  protected byte[] a(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte1 = util.get_rand_16byte(u.a);
    paramArrayOfByte = cryptor.encrypt(paramArrayOfByte, 0, paramArrayOfByte.length, arrayOfByte1);
    byte[] arrayOfByte2 = new byte[paramArrayOfByte.length + arrayOfByte1.length];
    System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, arrayOfByte1.length);
    System.arraycopy(paramArrayOfByte, 0, arrayOfByte2, arrayOfByte1.length, paramArrayOfByte.length);
    return arrayOfByte2;
  }
  
  public int b(byte[] paramArrayOfByte)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0)) {
      return 0;
    }
    util.LOGI(getClass().getName() + ":snd_rcv_req_error ...", "" + a.f);
    int i = new Random().nextInt();
    int j = 0;
    while (j < 2)
    {
      util.LOGI("try http connect " + j + " ...", "" + a.f);
      Object localObject = a(i);
      try
      {
        localObject = new URL("http://" + (String)localObject + "/cgi-bin/wlogin_proxy_log");
        util.LOGI("url=" + localObject, "" + a.f);
        localObject = (HttpURLConnection)((URL)localObject).openConnection();
        ((HttpURLConnection)localObject).setRequestMethod("POST");
        ((HttpURLConnection)localObject).setRequestProperty("Content-Type", "application/octet-stream");
        ((HttpURLConnection)localObject).setRequestProperty("Content-Disposition", "attachment; filename=micromsgresp.dat");
        ((HttpURLConnection)localObject).setRequestProperty("Content-Length", new Integer(paramArrayOfByte.length).toString());
        ((HttpURLConnection)localObject).setConnectTimeout(a.l);
        ((HttpURLConnection)localObject).setReadTimeout(a.l);
        ((HttpURLConnection)localObject).setDoOutput(true);
        util.LOGI("http request connect ...", "" + a.f);
        if (!i.a((HttpURLConnection)localObject, a.l))
        {
          util.LOGI("http request connect failed", "" + a.f);
          j += 1;
          i += 1;
        }
        else
        {
          util.LOGI("http request write ...", "" + a.f);
          OutputStream localOutputStream = ((HttpURLConnection)localObject).getOutputStream();
          localOutputStream.write(paramArrayOfByte, 0, paramArrayOfByte.length);
          localOutputStream.flush();
          int k = ((HttpURLConnection)localObject).getResponseCode();
          util.LOGI("http request response code=" + k, "" + a.f);
          if (200 == k) {
            break;
          }
          j += 1;
          i += 1;
        }
      }
      catch (Exception localException)
      {
        util.printException(localException, "" + a.f);
        j += 1;
        i += 1;
      }
    }
    if (j >= 1) {}
    for (i = 64536;; i = 0)
    {
      util.LOGI(getClass().getName() + ":snd_rcv_req_error ret=" + i, "" + a.f);
      return i;
    }
  }
}
