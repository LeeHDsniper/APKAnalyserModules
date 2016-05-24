package org.apache.commons.io;

import java.io.Serializable;

public final class IOCase
  implements Serializable
{
  public static final IOCase INSENSITIVE;
  public static final IOCase SENSITIVE;
  public static final IOCase SYSTEM;
  private static final long serialVersionUID = -6343169151696340687L;
  private final String name;
  private final transient boolean sensitive;
  
  static
  {
    boolean bool = true;
    SENSITIVE = new IOCase("Sensitive", true);
    INSENSITIVE = new IOCase("Insensitive", false);
    if (!FilenameUtils.isSystemWindows()) {}
    for (;;)
    {
      SYSTEM = new IOCase("System", bool);
      return;
      bool = false;
    }
  }
  
  private IOCase(String paramString, boolean paramBoolean)
  {
    name = paramString;
    sensitive = paramBoolean;
  }
  
  public static IOCase forName(String paramString)
  {
    if (SENSITIVEname.equals(paramString)) {
      return SENSITIVE;
    }
    if (INSENSITIVEname.equals(paramString)) {
      return INSENSITIVE;
    }
    if (SYSTEMname.equals(paramString)) {
      return SYSTEM;
    }
    throw new IllegalArgumentException("Invalid IOCase name: " + paramString);
  }
  
  private Object readResolve()
  {
    return forName(name);
  }
  
  public boolean checkEquals(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      throw new NullPointerException("The strings must not be null");
    }
    if (sensitive) {
      return paramString1.equals(paramString2);
    }
    return paramString1.equalsIgnoreCase(paramString2);
  }
  
  public String toString()
  {
    return name;
  }
}
