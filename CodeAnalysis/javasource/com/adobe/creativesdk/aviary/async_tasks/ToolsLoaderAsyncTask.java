package com.adobe.creativesdk.aviary.async_tasks;

import android.content.Context;
import android.util.Pair;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.cds.Cds.Permission;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.panels.AbstractPanelLoaderService;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import de.greenrobot.event.EventBus;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ToolsLoaderAsyncTask
  extends AdobeImageAsyncTask<AdobeImageEditorActivity, Void, ToolLoadResult>
{
  private final List<String> mToolList;
  
  public ToolsLoaderAsyncTask(List<String> paramList)
  {
    mToolList = paramList;
  }
  
  protected ToolLoadResult doInBackground(AdobeImageEditorActivity... paramVarArgs)
  {
    Object localObject = paramVarArgs[0];
    if (localObject == null) {
      return null;
    }
    paramVarArgs = loadTools((AdobeImageEditorActivity)localObject, mToolList);
    localObject = CdsUtils.getPermissions((Context)localObject);
    ToolLoadResult localToolLoadResult = new ToolLoadResult();
    tools = ((List)first);
    entries = ((List)second);
    if ((localObject != null) && (((List)localObject).contains(Cds.Permission.whitelabel.name()))) {}
    for (boolean bool = true;; bool = false)
    {
      whiteLabel = bool;
      return localToolLoadResult;
    }
  }
  
  protected void doPostExecute(ToolLoadResult paramToolLoadResult)
  {
    if (paramToolLoadResult != null) {
      EventBusUtils.getInstance().post(new ToolsLoadedEvent(tools, entries, whiteLabel));
    }
  }
  
  protected void doPreExecute() {}
  
  public List<String> loadStandaloneTools(Context paramContext)
  {
    paramContext = SharedPreferencesUtils.getInstance(paramContext).getToolList();
    if (paramContext != null) {
      return Arrays.asList(paramContext);
    }
    return null;
  }
  
  Pair<List<String>, List<ToolEntry>> loadTools(AdobeImageEditorActivity paramAdobeImageEditorActivity, List<String> paramList)
  {
    Object localObject1 = paramList;
    if (paramList == null)
    {
      paramAdobeImageEditorActivity = loadStandaloneTools(paramAdobeImageEditorActivity);
      localObject1 = paramAdobeImageEditorActivity;
      if (paramAdobeImageEditorActivity == null) {
        localObject1 = Arrays.asList(ToolLoaderFactory.getDefaultTools());
      }
    }
    paramAdobeImageEditorActivity = new ArrayList();
    paramList = new HashMap();
    Object localObject2 = AbstractPanelLoaderService.getToolsEntries();
    int j = localObject2.length;
    int i = 0;
    Object localObject3;
    if (i < j)
    {
      localObject3 = localObject2[i];
      ToolLoaderFactory.Tools localTools = name;
      if ((localObject1 != null) && (!((List)localObject1).contains(localTools.name()))) {}
      for (;;)
      {
        i += 1;
        break;
        paramList.put(localTools.name(), localObject3);
      }
    }
    if (localObject1 != null)
    {
      localObject2 = ((List)localObject1).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (String)((Iterator)localObject2).next();
        if (paramList.containsKey(localObject3)) {
          paramAdobeImageEditorActivity.add(paramList.get(localObject3));
        }
      }
    }
    return new Pair(localObject1, paramAdobeImageEditorActivity);
  }
  
  static class ToolLoadResult
  {
    public List<ToolEntry> entries;
    public List<String> tools;
    public boolean whiteLabel;
    
    ToolLoadResult() {}
  }
  
  public static final class ToolsLoadedEvent
  {
    public final List<ToolEntry> entries;
    public final List<String> labels;
    public final boolean whiteLabel;
    
    public ToolsLoadedEvent(List<String> paramList, List<ToolEntry> paramList1, boolean paramBoolean)
    {
      labels = paramList;
      entries = paramList1;
      whiteLabel = paramBoolean;
    }
  }
}
