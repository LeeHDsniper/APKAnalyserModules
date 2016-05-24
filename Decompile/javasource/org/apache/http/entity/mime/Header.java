package org.apache.http.entity.mime;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class Header
  implements Iterable<MinimalField>
{
  private final Map<String, List<MinimalField>> fieldMap = new HashMap();
  private final List<MinimalField> fields = new LinkedList();
  
  public Header() {}
  
  public void addField(MinimalField paramMinimalField)
  {
    if (paramMinimalField == null) {
      return;
    }
    String str = paramMinimalField.getName().toLowerCase(Locale.US);
    List localList = (List)fieldMap.get(str);
    Object localObject = localList;
    if (localList == null)
    {
      localObject = new LinkedList();
      fieldMap.put(str, localObject);
    }
    ((List)localObject).add(paramMinimalField);
    fields.add(paramMinimalField);
  }
  
  public MinimalField getField(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return null;
      paramString = paramString.toLowerCase(Locale.US);
      paramString = (List)fieldMap.get(paramString);
    } while ((paramString == null) || (paramString.isEmpty()));
    return (MinimalField)paramString.get(0);
  }
  
  public List<MinimalField> getFields()
  {
    return new ArrayList(fields);
  }
  
  public List<MinimalField> getFields(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    paramString = paramString.toLowerCase(Locale.US);
    paramString = (List)fieldMap.get(paramString);
    if ((paramString == null) || (paramString.isEmpty())) {
      return Collections.emptyList();
    }
    return new ArrayList(paramString);
  }
  
  public Iterator<MinimalField> iterator()
  {
    return Collections.unmodifiableList(fields).iterator();
  }
  
  public int removeFields(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return 0;
      paramString = paramString.toLowerCase(Locale.US);
      paramString = (List)fieldMap.remove(paramString);
    } while ((paramString == null) || (paramString.isEmpty()));
    fields.removeAll(paramString);
    return paramString.size();
  }
  
  public void setField(MinimalField paramMinimalField)
  {
    if (paramMinimalField == null) {
      return;
    }
    Object localObject = paramMinimalField.getName().toLowerCase(Locale.US);
    localObject = (List)fieldMap.get(localObject);
    if ((localObject == null) || (((List)localObject).isEmpty()))
    {
      addField(paramMinimalField);
      return;
    }
    ((List)localObject).clear();
    ((List)localObject).add(paramMinimalField);
    int j = -1;
    int i = 0;
    localObject = fields.iterator();
    while (((Iterator)localObject).hasNext())
    {
      int k = j;
      if (((MinimalField)((Iterator)localObject).next()).getName().equalsIgnoreCase(paramMinimalField.getName()))
      {
        ((Iterator)localObject).remove();
        k = j;
        if (j == -1) {
          k = i;
        }
      }
      i += 1;
      j = k;
    }
    fields.add(j, paramMinimalField);
  }
  
  public String toString()
  {
    return fields.toString();
  }
}
