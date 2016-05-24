package com.behance.sdk.datamanager;

import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.asynctask.params.BehanceSDKAbstractTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKGetCitiesAsyncTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKGetStatesOfCountryAsyncTaskParams;
import com.behance.sdk.asynctasks.BehanceSDKGetCitiesAsyncTask;
import com.behance.sdk.asynctasks.BehanceSDKGetCountriesAsyncTask;
import com.behance.sdk.asynctasks.BehanceSDKGetStatesOfCountryAsyncTask;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import com.behance.sdk.listeners.IGetCitiesAsyncTaskListener;
import com.behance.sdk.listeners.IGetCountriesAsyncTaskListener;
import com.behance.sdk.listeners.IGetStatesOfCountryAsyncTaskListener;
import com.behance.sdk.listeners.ILocationFiltersDataManagerListener;
import com.behance.sdk.managers.BehanceSDKEditProfileManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;

public class BehanceSDKProfileLocationsDataManager
  implements IGetCitiesAsyncTaskListener, IGetCountriesAsyncTaskListener, IGetStatesOfCountryAsyncTaskListener
{
  private static BehanceSDKProfileLocationsDataManager instance;
  private String activeCountryId;
  private BehanceSDKGetCitiesAsyncTaskParams activeGetCitiesParams;
  private List<BehanceSDKCityDTO> citiesList;
  private String clientId;
  private List<BehanceSDKCountryDTO> countriesList = new ArrayList();
  private BehanceSDKGetCitiesAsyncTask getCitiesAsyncTask;
  private boolean getCitiesAsyncTaskInProgress;
  private BehanceSDKGetCountriesAsyncTask getCountriesAsyncTask;
  private boolean getCountriesTaskInProgress;
  private BehanceSDKGetStatesOfCountryAsyncTask getStatesAsyncTask;
  private boolean getStatesAsyncTaskInProgress;
  private CopyOnWriteArraySet<ILocationFiltersDataManagerListener> listenersSet = new CopyOnWriteArraySet();
  private List<BehanceSDKStateDTO> statesList = new ArrayList();
  
  private BehanceSDKProfileLocationsDataManager()
  {
    setCredentials();
  }
  
  public static BehanceSDKProfileLocationsDataManager getInstance()
  {
    if (instance == null) {
      instance = new BehanceSDKProfileLocationsDataManager();
    }
    return instance;
  }
  
  private void loadCountriesFromServer()
  {
    if (getCountriesAsyncTask == null)
    {
      setGetCountriesTaskInProgress(true);
      getCountriesAsyncTask = new BehanceSDKGetCountriesAsyncTask(this);
      BehanceSDKAbstractTaskParams localBehanceSDKAbstractTaskParams = new BehanceSDKAbstractTaskParams();
      if (clientId == null) {
        setCredentials();
      }
      localBehanceSDKAbstractTaskParams.setClientId(clientId);
      getCountriesAsyncTask.execute(new BehanceSDKAbstractTaskParams[] { localBehanceSDKAbstractTaskParams });
    }
  }
  
  private void loadStatesFromServer(String paramString)
  {
    if ((!isGetStatesAsyncTaskInProgress()) && (getStatesAsyncTask == null))
    {
      setGetStatesAsyncTaskInProgress(true);
      getStatesAsyncTask = new BehanceSDKGetStatesOfCountryAsyncTask(this);
      BehanceSDKGetStatesOfCountryAsyncTaskParams localBehanceSDKGetStatesOfCountryAsyncTaskParams = new BehanceSDKGetStatesOfCountryAsyncTaskParams();
      localBehanceSDKGetStatesOfCountryAsyncTaskParams.setCountryId(paramString);
      if (clientId == null) {
        setCredentials();
      }
      localBehanceSDKGetStatesOfCountryAsyncTaskParams.setClientId(clientId);
      getStatesAsyncTask.execute(new BehanceSDKGetStatesOfCountryAsyncTaskParams[] { localBehanceSDKGetStatesOfCountryAsyncTaskParams });
    }
  }
  
  private void notifyListenersOnGetCountriesSuccess()
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onCountriesLoadingSuccess(countriesList);
      }
    }
  }
  
  private void notifyListenersOnGetStatesSuccess(String paramString, List<BehanceSDKStateDTO> paramList)
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onStatesLoadingSuccess(paramString, paramList);
      }
    }
  }
  
  private void notifyOnGetCitiesSuccessListeners(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, List<BehanceSDKCityDTO> paramList)
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onCitiesLoadingSuccess(paramBehanceSDKGetCitiesAsyncTaskParams, paramList);
      }
    }
    getCitiesAsyncTask = null;
    setGetCitiesAsyncTaskInProgress(false);
  }
  
  private void searchCitiesOnServer(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams)
  {
    activeGetCitiesParams = paramBehanceSDKGetCitiesAsyncTaskParams;
    setGetCitiesAsyncTaskInProgress(true);
    if (getCitiesAsyncTask != null)
    {
      getCitiesAsyncTask.cancel(true);
      getCitiesAsyncTask = null;
    }
    if (clientId == null) {
      setCredentials();
    }
    paramBehanceSDKGetCitiesAsyncTaskParams.setClientId(clientId);
    getCitiesAsyncTask = new BehanceSDKGetCitiesAsyncTask(this);
    getCitiesAsyncTask.execute(new BehanceSDKGetCitiesAsyncTaskParams[] { paramBehanceSDKGetCitiesAsyncTaskParams });
  }
  
  private void setCredentials()
  {
    clientId = BehanceSDKEditProfileManager.getInstance().getUserCredentials().getClientId();
  }
  
  private void setGetCitiesAsyncTaskInProgress(boolean paramBoolean)
  {
    getCitiesAsyncTaskInProgress = paramBoolean;
  }
  
  private void setGetCountriesTaskInProgress(boolean paramBoolean)
  {
    getCountriesTaskInProgress = paramBoolean;
  }
  
  private void setGetStatesAsyncTaskInProgress(boolean paramBoolean)
  {
    getStatesAsyncTaskInProgress = paramBoolean;
  }
  
  public void addListener(ILocationFiltersDataManagerListener paramILocationFiltersDataManagerListener)
  {
    if ((paramILocationFiltersDataManagerListener != null) && (!listenersSet.contains(paramILocationFiltersDataManagerListener))) {
      listenersSet.add(paramILocationFiltersDataManagerListener);
    }
  }
  
  public boolean isGetCountriesTaskInProgress()
  {
    return getCountriesTaskInProgress;
  }
  
  public boolean isGetStatesAsyncTaskInProgress()
  {
    return getStatesAsyncTaskInProgress;
  }
  
  public void loadCountries()
  {
    if ((countriesList == null) || (countriesList.isEmpty()))
    {
      loadCountriesFromServer();
      return;
    }
    notifyListenersOnGetCountriesSuccess();
  }
  
  public void loadStates(String paramString)
  {
    if ((activeCountryId != null) && (activeCountryId.equals(paramString)) && (statesList != null))
    {
      notifyListenersOnGetStatesSuccess(activeCountryId, statesList);
      return;
    }
    activeCountryId = paramString;
    loadStatesFromServer(paramString);
  }
  
  public void onGetCitiesFailure(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, Exception paramException)
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onCitiesLoadingFailure(paramBehanceSDKGetCitiesAsyncTaskParams, paramException);
      }
    }
    getCitiesAsyncTask = null;
    setGetCitiesAsyncTaskInProgress(false);
  }
  
  public void onGetCitiesSuccess(BehanceSDKGetCitiesAsyncTaskParams paramBehanceSDKGetCitiesAsyncTaskParams, List<BehanceSDKCityDTO> paramList)
  {
    if (paramBehanceSDKGetCitiesAsyncTaskParams.equals(activeGetCitiesParams)) {
      notifyOnGetCitiesSuccessListeners(paramBehanceSDKGetCitiesAsyncTaskParams, paramList);
    }
  }
  
  public void onGetCountriesFailure(Exception paramException)
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onCountriesLoadingFailure(paramException);
      }
    }
    getCountriesAsyncTask = null;
    setGetCountriesTaskInProgress(false);
  }
  
  public void onGetCountriesSuccess(List<BehanceSDKCountryDTO> paramList)
  {
    countriesList.clear();
    countriesList.addAll(paramList);
    notifyListenersOnGetCountriesSuccess();
    getCountriesAsyncTask = null;
    setGetCountriesTaskInProgress(false);
  }
  
  public void onGetStatesFailure(String paramString, Exception paramException)
  {
    if (!listenersSet.isEmpty())
    {
      Iterator localIterator = listenersSet.iterator();
      while (localIterator.hasNext()) {
        ((ILocationFiltersDataManagerListener)localIterator.next()).onStatesLoadingFailure(paramString, paramException);
      }
    }
    getStatesAsyncTask = null;
    setGetStatesAsyncTaskInProgress(false);
  }
  
  public void onGetStatesSuccess(String paramString, List<BehanceSDKStateDTO> paramList)
  {
    statesList.clear();
    statesList.addAll(paramList);
    notifyListenersOnGetStatesSuccess(paramString, paramList);
    getStatesAsyncTask = null;
    setGetStatesAsyncTaskInProgress(false);
  }
  
  public void removeListener(ILocationFiltersDataManagerListener paramILocationFiltersDataManagerListener)
  {
    if (paramILocationFiltersDataManagerListener != null) {
      listenersSet.remove(paramILocationFiltersDataManagerListener);
    }
  }
  
  public void searchForCities(String paramString1, String paramString2, String paramString3)
  {
    BehanceSDKGetCitiesAsyncTaskParams localBehanceSDKGetCitiesAsyncTaskParams = new BehanceSDKGetCitiesAsyncTaskParams();
    localBehanceSDKGetCitiesAsyncTaskParams.setCountryId(paramString1);
    localBehanceSDKGetCitiesAsyncTaskParams.setStateId(paramString2);
    localBehanceSDKGetCitiesAsyncTaskParams.setCitySearchStr(paramString3);
    if ((citiesList != null) && (activeGetCitiesParams != null) && (activeGetCitiesParams.equals(localBehanceSDKGetCitiesAsyncTaskParams)))
    {
      notifyOnGetCitiesSuccessListeners(activeGetCitiesParams, citiesList);
      return;
    }
    searchCitiesOnServer(localBehanceSDKGetCitiesAsyncTaskParams);
  }
}
