package org.apache.http.impl.client;

import java.net.URI;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class RedirectLocations
  extends AbstractList<Object>
{
  private final List<URI> all = new ArrayList();
  private final Set<URI> unique = new HashSet();
  
  public RedirectLocations() {}
  
  public void add(int paramInt, Object paramObject)
  {
    all.add(paramInt, (URI)paramObject);
    unique.add((URI)paramObject);
  }
  
  public void add(URI paramURI)
  {
    unique.add(paramURI);
    all.add(paramURI);
  }
  
  public boolean contains(Object paramObject)
  {
    return unique.contains(paramObject);
  }
  
  public boolean contains(URI paramURI)
  {
    return unique.contains(paramURI);
  }
  
  public URI get(int paramInt)
  {
    return (URI)all.get(paramInt);
  }
  
  public List<URI> getAll()
  {
    return new ArrayList(all);
  }
  
  public URI remove(int paramInt)
  {
    URI localURI = (URI)all.remove(paramInt);
    unique.remove(localURI);
    if (all.size() != unique.size()) {
      unique.addAll(all);
    }
    return localURI;
  }
  
  public boolean remove(URI paramURI)
  {
    boolean bool = unique.remove(paramURI);
    if (bool)
    {
      Iterator localIterator = all.iterator();
      while (localIterator.hasNext()) {
        if (((URI)localIterator.next()).equals(paramURI)) {
          localIterator.remove();
        }
      }
    }
    return bool;
  }
  
  public Object set(int paramInt, Object paramObject)
  {
    URI localURI = (URI)all.set(paramInt, (URI)paramObject);
    unique.remove(localURI);
    unique.add((URI)paramObject);
    if (all.size() != unique.size()) {
      unique.addAll(all);
    }
    return localURI;
  }
  
  public int size()
  {
    return all.size();
  }
}
