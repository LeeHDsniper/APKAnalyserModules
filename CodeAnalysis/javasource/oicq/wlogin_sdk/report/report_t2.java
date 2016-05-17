package oicq.wlogin_sdk.report;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;
import oicq.wlogin_sdk.tools.util;
import org.json.JSONArray;
import org.json.JSONObject;

public class report_t2
  extends report_t
{
  private static final long serialVersionUID = 1L;
  public long _app = 0L;
  public long[] _app_list = null;
  public TreeMap<Integer, report_t3> _log = new TreeMap();
  public String _name = new String("");
  public String _oper = new String("");
  public int _rlen = 0;
  public int _rst1 = 0;
  public int _rst2 = 0;
  public int _slen = 0;
  public long _start = 0L;
  public long _sub_app = 0L;
  public String _type = new String("");
  public long _uin = 0L;
  public int _used = 0;
  
  public report_t2(String paramString1, String paramString2, long paramLong1, long paramLong2, long paramLong3, long[] paramArrayOfLong)
  {
    _type = paramString1;
    _oper = paramString2;
    _start = paramLong1;
    _app = paramLong2;
    _sub_app = paramLong3;
    _app_list = paramArrayOfLong;
  }
  
  public void add_t3(report_t3 paramReport_t3)
  {
    _rlen += _rlen;
    _slen += _slen;
    _log.put(Integer.valueOf(_log.size()), paramReport_t3);
  }
  
  public void clear_t3()
  {
    _log.clear();
  }
  
  public void commit(long paramLong, String paramString, int paramInt1, int paramInt2)
  {
    _uin = paramLong;
    _name = paramString;
    _rst1 = paramInt1;
    _rst2 = paramInt2;
    _used = ((int)(System.currentTimeMillis() - _start));
  }
  
  public JSONObject toJasonObj()
  {
    for (;;)
    {
      Object localObject3;
      Object localObject1;
      int i;
      try
      {
        localObject3 = new JSONObject();
      }
      catch (Exception localException1)
      {
        Object localObject2;
        localObject1 = null;
        localObject3 = new StringWriter();
        PrintWriter localPrintWriter = new PrintWriter((Writer)localObject3, true);
        localException1.printStackTrace(localPrintWriter);
        localPrintWriter.flush();
        ((StringWriter)localObject3).flush();
        util.LOGD("exception", ((StringWriter)localObject3).toString());
        return localObject1;
      }
      try
      {
        ((JSONObject)localObject3).put("type", _type);
        ((JSONObject)localObject3).put("oper", _oper);
        ((JSONObject)localObject3).put("start", String.format("%d", new Object[] { Long.valueOf(_start / 1000L & 0xFFFFFFFF) }));
        ((JSONObject)localObject3).put("used", String.format("%d", new Object[] { Long.valueOf(_used & 0xFFFFFFFF) }));
        ((JSONObject)localObject3).put("uin", String.format("%d", new Object[] { Long.valueOf(_uin & 0xFFFFFFFF) }));
        ((JSONObject)localObject3).put("app", String.format("%d", new Object[] { Long.valueOf(_app & 0xFFFFFFFF) }));
        ((JSONObject)localObject3).put("subapp", String.format("%d", new Object[] { Long.valueOf(_sub_app & 0xFFFFFFFF) }));
        ((JSONObject)localObject3).put("email", _name);
        localObject1 = "";
        localObject2 = localObject1;
        if (_app_list == null) {
          continue;
        }
        i = 0;
      }
      catch (Exception localException2)
      {
        localObject1 = localObject3;
        continue;
        i += 1;
      }
    }
    localObject2 = localObject1;
    if (i < _app_list.length)
    {
      if (i == _app_list.length - 1) {
        localObject1 = (String)localObject1 + String.format("%d", new Object[] { Long.valueOf(_app_list[i] & 0xFFFFFFFF) });
      } else {
        localObject1 = (String)localObject1 + String.format("%d,", new Object[] { Long.valueOf(_app_list[i] & 0xFFFFFFFF) });
      }
    }
    else
    {
      ((JSONObject)localObject3).put("applist", localObject2);
      ((JSONObject)localObject3).put("rst1", String.format("%d", new Object[] { Long.valueOf(_rst1 & 0xFFFFFFFF) }));
      ((JSONObject)localObject3).put("rst2", String.format("%d", new Object[] { Long.valueOf(_rst2 & 0xFFFFFFFF) }));
      localObject1 = new JSONArray();
      localObject2 = _log.keySet().iterator();
      i = 0;
      while (((Iterator)localObject2).hasNext())
      {
        ((JSONArray)localObject1).put(i, ((report_t3)_log.get(((Iterator)localObject2).next())).toJasonObj());
        i += 1;
      }
      ((JSONObject)localObject3).put("log", localObject1);
      return localObject3;
    }
  }
}
