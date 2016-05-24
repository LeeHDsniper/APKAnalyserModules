package com.behance.sdk.datamanager;

import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.asynctasks.BehanceSDKLoadCreativeFieldsAsyncTask;
import com.behance.sdk.datamanager.listeners.interfaces.IFiltersDataManagerListener;
import com.behance.sdk.datamanager.listeners.interfaces.IGetCreativeFieldsAsyncTaskListener;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FiltersDataManager
  implements IGetCreativeFieldsAsyncTaskListener
{
  private static final FiltersDataManager FILTERS_DATA_MANAGER = new FiltersDataManager();
  private List<BehanceSDKCreativeFieldDTO> creativeFields;
  private List<IFiltersDataManagerListener> listeners = new ArrayList();
  private BehanceSDKLoadCreativeFieldsAsyncTask loadCreativeFieldsAsyncTask;
  private boolean loadCreativeFieldsTaskInProgress;
  
  private FiltersDataManager() {}
  
  public static FiltersDataManager getInstance()
  {
    return FILTERS_DATA_MANAGER;
  }
  
  private void loadCreativeFieldsFromServer(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    if (loadCreativeFieldsAsyncTask == null)
    {
      setLoadCreativeFieldsTaskInProgress(true);
      loadCreativeFieldsAsyncTask = new BehanceSDKLoadCreativeFieldsAsyncTask(this);
      loadCreativeFieldsAsyncTask.setUserCredentials(paramIBehanceSDKUserCredentials);
      loadCreativeFieldsAsyncTask.execute(new Void[0]);
    }
  }
  
  private void notifyListenersOnLoadCreativeFieldSuccess()
  {
    if (!listeners.isEmpty())
    {
      Iterator localIterator = listeners.iterator();
      while (localIterator.hasNext()) {
        ((IFiltersDataManagerListener)localIterator.next()).onCreativeFieldsLoadingSuccess(creativeFields);
      }
    }
  }
  
  private void setLoadCreativeFieldsTaskInProgress(boolean paramBoolean)
  {
    loadCreativeFieldsTaskInProgress = paramBoolean;
  }
  
  public void addListener(IFiltersDataManagerListener paramIFiltersDataManagerListener)
  {
    if ((paramIFiltersDataManagerListener != null) && (!listeners.contains(paramIFiltersDataManagerListener))) {
      listeners.add(paramIFiltersDataManagerListener);
    }
  }
  
  public boolean isLoadCreativeFieldsTaskInProgress()
  {
    return loadCreativeFieldsTaskInProgress;
  }
  
  public void loadCreativeFields(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    if ((creativeFields == null) || (creativeFields.isEmpty()))
    {
      loadCreativeFieldsFromServer(paramIBehanceSDKUserCredentials);
      return;
    }
    notifyListenersOnLoadCreativeFieldSuccess();
  }
  
  public void onLoadCreativeFieldsFailure(Exception paramException)
  {
    if (!listeners.isEmpty())
    {
      Iterator localIterator = listeners.iterator();
      while (localIterator.hasNext()) {
        ((IFiltersDataManagerListener)localIterator.next()).onCreativeFieldsLoadingFailure(paramException);
      }
    }
    loadCreativeFieldsAsyncTask = null;
    setLoadCreativeFieldsTaskInProgress(false);
  }
  
  public void onLoadCreativeFieldsSuccess(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    if (creativeFields == null) {
      creativeFields = new ArrayList(paramList.size());
    }
    creativeFields.clear();
    creativeFields.addAll(paramList);
    notifyListenersOnLoadCreativeFieldSuccess();
    loadCreativeFieldsAsyncTask = null;
    setLoadCreativeFieldsTaskInProgress(false);
  }
}
