package com.adobe.creativesdk.aviary.internal.headless.moa;

public final class MoaActionFactory
{
  public static MoaAction action(String paramString)
  {
    return new MoaAction(paramString);
  }
  
  public static MoaActionList actionList()
  {
    return new MoaActionList();
  }
  
  public static MoaActionList actionList(String... paramVarArgs)
  {
    MoaActionList localMoaActionList = new MoaActionList();
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      localMoaActionList.add(action(paramVarArgs[i]));
      i += 1;
    }
    return localMoaActionList;
  }
  
  public static MoaMetadata metadata()
  {
    return new MoaMetadata();
  }
}
