package org.apache.http.client.methods;

import org.apache.http.client.config.RequestConfig;

public abstract interface Configurable
{
  public abstract RequestConfig getConfig();
}
