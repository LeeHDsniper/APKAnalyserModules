package org.apache.http;

import java.util.Locale;

public abstract interface ReasonPhraseCatalog
{
  public abstract String getReason(int paramInt, Locale paramLocale);
}
