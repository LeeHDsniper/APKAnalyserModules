package org.apache.http.pool;

import org.apache.http.annotation.Immutable;

@Immutable
public class PoolStats
{
  private final int available;
  private final int leased;
  private final int max;
  private final int pending;
  
  public PoolStats(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    leased = paramInt1;
    pending = paramInt2;
    available = paramInt3;
    max = paramInt4;
  }
  
  public int getAvailable()
  {
    return available;
  }
  
  public int getLeased()
  {
    return leased;
  }
  
  public int getMax()
  {
    return max;
  }
  
  public int getPending()
  {
    return pending;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[leased: ");
    localStringBuilder.append(leased);
    localStringBuilder.append("; pending: ");
    localStringBuilder.append(pending);
    localStringBuilder.append("; available: ");
    localStringBuilder.append(available);
    localStringBuilder.append("; max: ");
    localStringBuilder.append(max);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
