package com.qq.jce.wup;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceUtil;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class UniAttribute
  extends OldUniAttribute
{
  JceInputStream _is = new JceInputStream();
  protected HashMap<String, byte[]> _newData = null;
  private HashMap<String, Object> cachedData = new HashMap();
  
  public UniAttribute() {}
  
  private Object decodeData(byte[] paramArrayOfByte, Object paramObject)
  {
    _is.wrap(paramArrayOfByte);
    _is.setServerEncoding(encodeName);
    return _is.read(paramObject, 0, true);
  }
  
  private void saveDataCache(String paramString, Object paramObject)
  {
    cachedData.put(paramString, paramObject);
  }
  
  public void clearCacheData()
  {
    cachedData.clear();
  }
  
  public boolean containsKey(String paramString)
  {
    if (_newData != null) {
      return _newData.containsKey(paramString);
    }
    return _data.containsKey(paramString);
  }
  
  public void decode(byte[] paramArrayOfByte)
  {
    try
    {
      super.decode(paramArrayOfByte);
      return;
    }
    catch (Exception localException)
    {
      _is.wrap(paramArrayOfByte);
      _is.setServerEncoding(encodeName);
      paramArrayOfByte = new HashMap(1);
      paramArrayOfByte.put("", new byte[0]);
      _newData = _is.readMap(paramArrayOfByte, 0, false);
    }
  }
  
  public void decodeVersion2(byte[] paramArrayOfByte)
  {
    super.decode(paramArrayOfByte);
  }
  
  public void decodeVersion3(byte[] paramArrayOfByte)
  {
    _is.wrap(paramArrayOfByte);
    _is.setServerEncoding(encodeName);
    paramArrayOfByte = new HashMap(1);
    paramArrayOfByte.put("", new byte[0]);
    _newData = _is.readMap(paramArrayOfByte, 0, false);
  }
  
  public byte[] encode()
  {
    if (_newData != null)
    {
      JceOutputStream localJceOutputStream = new JceOutputStream(0);
      localJceOutputStream.setServerEncoding(encodeName);
      localJceOutputStream.write(_newData, 0);
      return JceUtil.getJceBufArray(localJceOutputStream.getByteBuffer());
    }
    return super.encode();
  }
  
  public <T> T get(String paramString)
    throws ObjectCreateException
  {
    if (_newData != null) {
      throw new RuntimeException("data is encoded by new version, please use getByClass(String name, T proxy)");
    }
    return super.get(paramString);
  }
  
  public <T> T get(String paramString, Object paramObject)
  {
    if (_newData != null) {
      throw new RuntimeException("data is encoded by new version, please use get(String name, T proxy, Object defaultValue)");
    }
    return super.get(paramString, paramObject);
  }
  
  public <T> T get(String paramString, T paramT, Object paramObject)
  {
    if (!_newData.containsKey(paramString)) {
      return paramObject;
    }
    return getByClass(paramString, paramT);
  }
  
  public <T> T getByClass(String paramString, T paramT)
    throws ObjectCreateException
  {
    Object localObject1 = null;
    if (_newData != null) {
      if (_newData.containsKey(paramString)) {}
    }
    while (!_data.containsKey(paramString)) {
      for (;;)
      {
        return localObject1;
        if (cachedData.containsKey(paramString)) {
          return cachedData.get(paramString);
        }
        localObject1 = (byte[])_newData.get(paramString);
        try
        {
          paramT = decodeData((byte[])localObject1, paramT);
          localObject1 = paramT;
          if (paramT != null)
          {
            saveDataCache(paramString, paramT);
            return paramT;
          }
        }
        catch (Exception paramString)
        {
          throw new ObjectCreateException(paramString);
        }
      }
    }
    if (cachedData.containsKey(paramString)) {
      return cachedData.get(paramString);
    }
    Object localObject2 = (HashMap)_data.get(paramString);
    localObject1 = new byte[0];
    localObject2 = ((HashMap)localObject2).entrySet().iterator();
    if (((Iterator)localObject2).hasNext())
    {
      localObject1 = (Map.Entry)((Iterator)localObject2).next();
      localObject2 = (String)((Map.Entry)localObject1).getKey();
      localObject1 = (byte[])((Map.Entry)localObject1).getValue();
    }
    try
    {
      _is.wrap((byte[])localObject1);
      _is.setServerEncoding(encodeName);
      paramT = _is.read(paramT, 0, true);
      saveDataCache(paramString, paramT);
      return paramT;
    }
    catch (Exception paramString)
    {
      throw new ObjectCreateException(paramString);
    }
  }
  
  public <T> T getByClass(String paramString, T paramT1, T paramT2)
    throws ObjectCreateException
  {
    if (_newData != null) {
      if (_newData.containsKey(paramString)) {}
    }
    while (!_data.containsKey(paramString))
    {
      return paramT2;
      if (cachedData.containsKey(paramString)) {
        return cachedData.get(paramString);
      }
      paramT2 = (byte[])_newData.get(paramString);
      try
      {
        paramT1 = decodeData(paramT2, paramT1);
        if (paramT1 != null) {
          saveDataCache(paramString, paramT1);
        }
        return paramT1;
      }
      catch (Exception paramString)
      {
        throw new ObjectCreateException(paramString);
      }
    }
    if (cachedData.containsKey(paramString)) {
      return cachedData.get(paramString);
    }
    Object localObject = (HashMap)_data.get(paramString);
    paramT2 = new byte[0];
    localObject = ((HashMap)localObject).entrySet().iterator();
    if (((Iterator)localObject).hasNext())
    {
      paramT2 = (Map.Entry)((Iterator)localObject).next();
      localObject = (String)paramT2.getKey();
      paramT2 = (byte[])paramT2.getValue();
    }
    try
    {
      _is.wrap(paramT2);
      _is.setServerEncoding(encodeName);
      paramT1 = _is.read(paramT1, 0, true);
      saveDataCache(paramString, paramT1);
      return paramT1;
    }
    catch (Exception paramString)
    {
      throw new ObjectCreateException(paramString);
    }
  }
  
  public <T> T getJceStruct(String paramString)
    throws ObjectCreateException
  {
    if (_newData != null) {
      throw new RuntimeException("data is encoded by new version, please use getJceStruct(String name,T proxy)");
    }
    return super.getJceStruct(paramString);
  }
  
  public <T> T getJceStruct(String paramString, T paramT)
    throws ObjectCreateException
  {
    if (!_newData.containsKey(paramString)) {
      paramT = null;
    }
    for (;;)
    {
      return paramT;
      if (cachedData.containsKey(paramString)) {
        return cachedData.get(paramString);
      }
      Object localObject = (byte[])_newData.get(paramString);
      try
      {
        localObject = decodeData((byte[])localObject, paramT);
        paramT = (TT)localObject;
        if (localObject == null) {
          continue;
        }
        saveDataCache(paramString, localObject);
        return localObject;
      }
      catch (Exception paramString)
      {
        throw new ObjectCreateException(paramString);
      }
    }
  }
  
  public Set<String> getKeySet()
  {
    if (_newData != null) {
      return Collections.unmodifiableSet(_newData.keySet());
    }
    return Collections.unmodifiableSet(_data.keySet());
  }
  
  public boolean isEmpty()
  {
    if (_newData != null) {
      return _newData.isEmpty();
    }
    return _data.isEmpty();
  }
  
  public <T> void put(String paramString, T paramT)
  {
    if (_newData != null)
    {
      if (paramString == null) {
        throw new IllegalArgumentException("put key can not is null");
      }
      if (paramT == null) {
        throw new IllegalArgumentException("put value can not is null");
      }
      if ((paramT instanceof Set)) {
        throw new IllegalArgumentException("can not support Set");
      }
      JceOutputStream localJceOutputStream = new JceOutputStream();
      localJceOutputStream.setServerEncoding(encodeName);
      localJceOutputStream.write(paramT, 0);
      paramT = JceUtil.getJceBufArray(localJceOutputStream.getByteBuffer());
      _newData.put(paramString, paramT);
      return;
    }
    super.put(paramString, paramT);
  }
  
  public <T> T remove(String paramString)
    throws ObjectCreateException
  {
    if (_newData != null)
    {
      if (!_newData.containsKey(paramString)) {
        return null;
      }
      _newData.remove(paramString);
      return null;
    }
    return super.remove(paramString);
  }
  
  public <T> T remove(String paramString, T paramT)
    throws ObjectCreateException
  {
    if (!_newData.containsKey(paramString)) {
      return null;
    }
    if (paramT != null) {
      return decodeData((byte[])_newData.remove(paramString), paramT);
    }
    _newData.remove(paramString);
    return null;
  }
  
  public int size()
  {
    if (_newData != null) {
      return _newData.size();
    }
    return _data.size();
  }
  
  public void useVersion3()
  {
    _newData = new HashMap();
  }
}
