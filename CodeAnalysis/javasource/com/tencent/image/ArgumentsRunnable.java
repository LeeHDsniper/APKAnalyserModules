package com.tencent.image;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public abstract class ArgumentsRunnable<T>
  implements Runnable
{
  private ArrayList<T> args = null;
  
  public ArgumentsRunnable() {}
  
  private final List<T> getArguments()
  {
    try
    {
      ArrayList localArrayList = args;
      args = null;
      return localArrayList;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void add(T... paramVarArgs)
  {
    int i = 1;
    try
    {
      if (args == null)
      {
        i = 0;
        args = new ArrayList();
      }
      Collections.addAll(args, paramVarArgs);
      if (i == 0) {
        submit();
      }
      return;
    }
    finally {}
  }
  
  public final void run()
  {
    run(getArguments());
  }
  
  protected abstract void run(List<T> paramList);
  
  protected abstract void submit();
}
