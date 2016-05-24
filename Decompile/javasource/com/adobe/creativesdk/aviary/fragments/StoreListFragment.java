package com.adobe.creativesdk.aviary.fragments;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.dialogs.PromoDialogFragment;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus.Type;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOption;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOptionWithPrice;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.cds.util.Purchase;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.PackIconTransformer.Builder;
import com.adobe.creativesdk.aviary.widget.IAPBuyButton;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.picasso.Callback;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import java.util.HashMap;
import java.util.Map;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.android.app.AppObservable;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.schedulers.Schedulers;
import rx.subscriptions.CompositeSubscription;

public class StoreListFragment
  extends StoreListFragmentAbstract
  implements View.OnClickListener
{
  protected CursorAdapter adapter;
  protected long autoSelectedPackId = -1L;
  int maxRetry = 2;
  private HashMap<Long, CdsUtils.PackOptionWithPrice> packOptionMap = new HashMap();
  protected Picasso picasso;
  ProgressBar progressBar;
  
  public StoreListFragment() {}
  
  public static StoreListFragment newInstance(Cds.PackType paramPackType)
  {
    StoreListFragment localStoreListFragment = new StoreListFragment();
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("extra-pack-type", paramPackType);
    localStoreListFragment.setArguments(localBundle);
    return localStoreListFragment;
  }
  
  private void onAskToLogin()
  {
    logger.info("onAskToLogin");
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(getActivity());
    if (!ApiHelper.AT_LEAST_21) {
      localBuilder.setTitle(R.string.feather_have_an_adobe_id);
    }
    localBuilder.setMessage(R.string.feather_ask_to_login_before_restore).setNegativeButton(R.string.feather_no_thanks, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        StoreListFragment.this.onRestoreAllInternal();
      }
    }).setPositiveButton(R.string.feather_signin, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface = new Bundle();
        paramAnonymousDialogInterface.putString("uuid", getUUID());
        paramAnonymousDialogInterface.putString("from", "shop_list");
        paramAnonymousDialogInterface.putBoolean("restore-all", true);
        getContentService().requestLogin(getActivity(), paramAnonymousDialogInterface);
      }
    }).show();
  }
  
  private void onRestoreAll()
  {
    logger.info("onRestoreAll");
    if (isContentServiceConnected())
    {
      if (getContentService().isAuthenticated())
      {
        onRestoreAllInternal();
        return;
      }
      onAskToLogin();
      return;
    }
    logger.warn("account not available.. just proceed");
    onRestoreAllInternal();
  }
  
  private void onRestoreAllInternal()
  {
    logger.info("onRestoreAllInternal");
    Toast.makeText(getActivity(), R.string.feather_restore_all_request_sent, 0).show();
    Intent localIntent = AdobeImageIntent.createCdsRestoreAllIntent(getActivity(), null);
    logger.verbose("intent: %s", new Object[] { localIntent });
    getActivity().startService(localIntent);
    AdobeImageAnalyticsTracker.getInstance(getActivity()).tagEvent("shop_list: restore_all_initiated");
  }
  
  private void purchasePackItem(long paramLong, String paramString1, String paramString2)
  {
    logger.info("purchasePackItem: %s", new Object[] { paramString1 });
    if (!isContentServiceConnected())
    {
      logger.error("Content Manager Service Unavailable");
      Toast.makeText(getActivity(), R.string.common_google_play_services_network_error_title, 0).show();
      return;
    }
    AppObservable.bindSupportFragment(this, getContentService().purchase(getActivity(), getClass().hashCode(), paramLong, paramString1, getPackType().toCdsString(), getTrackerName(), paramString2)).subscribe(new Action1()new Action1
    {
      public void call(Pair<IabResult, Integer> paramAnonymousPair)
      {
        StoreListFragmentAbstract.logger.log("purchasePackItem.onNext: %s, %d", new Object[] { first, second });
        StoreListFragmentAbstract.logger.verbose("thread: %s", new Object[] { Thread.currentThread() });
        if (((IabResult)first).isFailure())
        {
          if (((IabResult)first).getResponse() != 64531) {
            Toast.makeText(getActivity(), ((IabResult)first).getMessage(), 0).show();
          }
        }
        else {
          return;
        }
        StoreListFragmentAbstract.logger.warn("purchase failed: %s", new Object[] { first });
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        StoreListFragmentAbstract.logger.error("purchasePackItem.onError: %s", new Object[] { paramAnonymousThrowable.getMessage() });
        StoreListFragmentAbstract.logger.verbose("current thread: %s", new Object[] { Thread.currentThread() });
        Toast.makeText(getActivity(), paramAnonymousThrowable.getMessage(), 0).show();
      }
    });
  }
  
  private void restorePackItem(final long paramLong, String paramString1, String paramString2, String paramString3, final IAPBuyButton paramIAPBuyButton)
  {
    if (paramIAPBuyButton != null) {}
    for (final CdsUtils.PackOptionWithPrice localPackOptionWithPrice = paramIAPBuyButton.getPackOption(); !isContentServiceConnected(); localPackOptionWithPrice = null)
    {
      logger.error("service not connected");
      return;
    }
    AppObservable.bindSupportFragment(this, getContentService().restore(paramLong, paramString1, paramString2, paramString3).observeOn(AndroidSchedulers.mainThread()).doOnRequest(new Action1()
    {
      public void call(Long paramAnonymousLong)
      {
        if (paramIAPBuyButton != null) {
          paramIAPBuyButton.setPackOption(CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.DOWNLOADING), paramLong);
        }
      }
    })).subscribe(new Action1()new Action1
    {
      public void call(Integer paramAnonymousInteger)
      {
        paramAnonymousInteger = CdsUtils.PackOption.fromDownloadManagerStatus(paramAnonymousInteger.intValue());
        if ((paramAnonymousInteger != null) && (paramIAPBuyButton != null)) {
          paramIAPBuyButton.setPackOption(CdsUtils.PackOptionWithPrice.from(paramAnonymousInteger), paramLong);
        }
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        StoreListFragmentAbstract.logger.error("restore::onError");
        paramAnonymousThrowable.printStackTrace();
        Toast.makeText(getActivity(), paramAnonymousThrowable.getMessage(), 0).show();
        if (paramIAPBuyButton != null) {
          paramIAPBuyButton.setPackOption(localPackOptionWithPrice, paramLong);
        }
      }
    });
  }
  
  private void restorePackItem(StoreListFragment.MyCursorAdapter.ViewHolder paramViewHolder)
  {
    restorePackItem(packid, identifier, packType.toCdsString(), getTrackerName(), buttonContainer);
  }
  
  private void runDownloaderAsyncTask(long paramLong, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    logger.info("runDownloaderAsyncTask(%d, %s)", new Object[] { Long.valueOf(paramLong), paramString1 });
    if ((paramLong > -1L) && (!TextUtils.isEmpty(paramString1)) && (!TextUtils.isEmpty(paramString2))) {
      new RequestPackDownloadAsyncTask(paramLong, paramString1, paramString2, paramString3, paramString4).execute(new Void[0]);
    }
  }
  
  protected CursorAdapter createAdapter()
  {
    return new MyCursorAdapter(getActivity(), null);
  }
  
  protected Cursor createCursorForAvailablePacks(Cds.PackType paramPackType)
    throws SQLiteException
  {
    logger.info("createCursorForAvailablePacks(%s)", new Object[] { paramPackType });
    if (getActivity() == null) {
      return null;
    }
    paramPackType = "pack/type/" + paramPackType.toCdsString() + "/content/available/list";
    return getActivity().getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getActivity(), paramPackType), new String[] { "pack_id as _id", "pack_id", "pack_type", "pack_identifier", "content_id", "content_contentPath", "content_contentURL", "content_displayName", "content_iconPath", "content_iconUrl", "content_isFree", "content_purchased", "content_packId", "content_numItems", "content_isFreeWithLogin" }, null, null, "content_purchased ASC, pack_displayOrder ASC");
  }
  
  public AdobeImageBillingService getContentService()
  {
    return ((AdobeImageAccountDelegate)getActivity()).getContentService();
  }
  
  protected String getTrackerName()
  {
    return "shop_list";
  }
  
  public boolean isContentServiceConnected()
  {
    return ((AdobeImageAccountDelegate)getActivity()).isContentServiceConnected();
  }
  
  public boolean isFragmentVisible()
  {
    return ((StoreContainerFragment)getParentFragment()).isFragmentVisible(this);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    maxRetry = 3;
    picasso = Picasso.with(paramActivity);
  }
  
  public void onClick(View paramView)
  {
    logger.info("onClick: %s", new Object[] { paramView });
    if (paramView.getId() == R.id.restore_all) {
      onRestoreAll();
    }
    label33:
    Object localObject;
    do
    {
      do
      {
        do
        {
          do
          {
            break label33;
            break label33;
            do
            {
              return;
            } while (!(paramView instanceof IAPBuyButton));
            localObject = ((IAPBuyButton)paramView).getPackOption();
            logger.log("packOption: %s", new Object[] { localObject });
          } while (localObject == null);
          paramView = (ViewGroup)paramView.getParent();
          logger.log("parent: %s", new Object[] { paramView });
        } while (paramView == null);
        paramView = paramView.getTag();
        logger.log("tag: %s", new Object[] { paramView });
      } while (!(paramView instanceof StoreListFragment.MyCursorAdapter.ViewHolder));
      paramView = (StoreListFragment.MyCursorAdapter.ViewHolder)paramView;
    } while ((packid < 0L) || (identifier == null));
    switch (8.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption[option.ordinal()])
    {
    default: 
      return;
    case 1: 
      purchasePackItem(packid, identifier, price);
      return;
    case 2: 
      if ((isContentServiceConnected()) && (getContentService().isAuthenticated()))
      {
        restorePackItem(paramView);
        return;
      }
      localObject = new Bundle();
      ((Bundle)localObject).putLong("packId", packid);
      ((Bundle)localObject).putString("identifier", identifier);
      ((Bundle)localObject).putString("packType", packType.toCdsString());
      ((Bundle)localObject).putString("uuid", getUUID());
      ((Bundle)localObject).putString("from", getTrackerName());
      PromoDialogFragment.showInActivity(getActivity(), false, (Bundle)localObject);
      return;
    case 3: 
    case 4: 
    case 5: 
      restorePackItem(paramView);
      return;
    }
    startSetup();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_store_listview, paramViewGroup, false);
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    if (adapter != null) {
      adapter.changeCursor(null);
    }
  }
  
  public void onDownloadStatusChanged(long paramLong, String paramString, int paramInt)
  {
    super.onDownloadStatusChanged(paramLong, paramString, paramInt);
    if ((adapter != null) && (getActivity() != null) && (paramString != null) && (paramString.equals(getPackType().toCdsString())))
    {
      packOptionMap.put(Long.valueOf(paramLong), CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.fromDownloadManagerStatus(paramInt)));
      new NotifyDataSetChangedAsyncTask().execute(new Void[0]);
    }
  }
  
  public void onPackInstalled(long paramLong, String paramString, int paramInt)
  {
    super.onPackInstalled(paramLong, paramString, paramInt);
    FragmentActivity localFragmentActivity = getActivity();
    if ((adapter != null) && (localFragmentActivity != null) && (paramString != null) && (paramString.equals(getPackType().toCdsString())))
    {
      if (paramInt == 1)
      {
        packOptionMap.put(Long.valueOf(paramLong), CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.OWNED));
        new NotifyDataSetChangedAsyncTask().execute(new Void[0]);
      }
    }
    else {
      return;
    }
    packOptionMap.put(Long.valueOf(paramLong), CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.PACK_OPTION_BEING_DETERMINED));
    runInventoryAsyncTask(0, true);
  }
  
  public void onPurchaseSuccess(long paramLong, String paramString, Purchase paramPurchase)
  {
    super.onPurchaseSuccess(paramLong, paramString, paramPurchase);
    if ((adapter != null) && (getActivity() != null) && (paramString != null) && (paramString.equals(getPackType().toCdsString())))
    {
      packOptionMap.put(Long.valueOf(paramLong), CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.RESTORE));
      new NotifyDataSetChangedAsyncTask().execute(new Void[0]);
    }
  }
  
  public void onServiceFinished()
  {
    super.onServiceFinished();
    if (getActivity() != null) {
      runInventoryAsyncTask(0, true);
    }
  }
  
  public void onSetupDone(Pair<AccountResult, IabResult> paramPair)
  {
    super.onSetupDone(paramPair);
    paramPair = (IabResult)second;
    if ((paramPair != null) && (paramPair.isFailure()) && (isFragmentVisible())) {
      Toast.makeText(getActivity(), paramPair.getMessage(), 0).show();
    }
    runInventoryAsyncTask(0, true);
  }
  
  protected void onUserAuthenticated(AdobeAccountUserStatus paramAdobeAccountUserStatus)
  {
    super.onUserAuthenticated(paramAdobeAccountUserStatus);
    Bundle localBundle = paramAdobeAccountUserStatus.getOptions();
    String str = localBundle.getString("uuid");
    packOptionMap.clear();
    runInventoryAsyncTask(0, true);
    if ((paramAdobeAccountUserStatus.getType() != AdobeAccountUserStatus.Type.LOGOUT) && (paramAdobeAccountUserStatus.isSuccess()) && (paramAdobeAccountUserStatus.getUserProfile() != null) && (getUUID().equals(str)))
    {
      if (paramAdobeAccountUserStatus.getOptions().containsKey("restore-all")) {
        onRestoreAllInternal();
      }
    }
    else {
      return;
    }
    runDownloaderAsyncTask(localBundle.getLong("packId", -1L), localBundle.getString("identifier", null), localBundle.getString("packType", null), getTrackerName(), paramAdobeAccountUserStatus.getUserProfile().getAdobeID());
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    progressBar = ((ProgressBar)paramView.findViewById(R.id.progress));
    adapter = createAdapter();
    setListAdapter(adapter);
    paramView = paramView.findViewById(R.id.restore_all);
    if (paramView != null) {
      paramView.setOnClickListener(this);
    }
    setListShown(false);
  }
  
  protected void runInventoryAsyncTask(int paramInt, boolean paramBoolean)
  {
    new RunInventoryAsyncTask().execute(new Cds.PackType[] { getPackType() });
  }
  
  public void selectPack(long paramLong)
  {
    selectPack(paramLong, false);
  }
  
  void selectPack(long paramLong, boolean paramBoolean)
  {
    logger.info("selectPack: %d, setSelection: %b", new Object[] { Long.valueOf(paramLong), Boolean.valueOf(paramBoolean) });
    super.selectPack(paramLong);
    if (adapter.getCount() > 0)
    {
      long l = paramLong;
      if (paramLong == -1L) {
        l = adapter.getItemId(0);
      }
      int i;
      if (getListView().getChoiceMode() == 1) {
        i = 0;
      }
      for (;;)
      {
        if (i < adapter.getCount())
        {
          if (adapter.getItemId(i) != l) {
            break label143;
          }
          getListView().setItemChecked(i, true);
          if (paramBoolean) {
            getListView().setSelection(i);
          }
        }
        fireOnItemClick(l, getPackType().toCdsString());
        return;
        label143:
        i += 1;
      }
    }
    autoSelectedPackId = paramLong;
  }
  
  private class MyCursorAdapter
    extends CursorAdapter
  {
    int displayNameColumnIndex;
    int iconPackColumnIndex;
    int idColumnIndex;
    int identifierColumnIndex;
    int isFreeWithLoginIndex;
    int itemsCountColumnIndex;
    int mMaxImageSize;
    
    public MyCursorAdapter(Context paramContext, Cursor paramCursor)
    {
      super(paramCursor, false);
      mMaxImageSize = paramContext.getResources().getDimensionPixelSize(R.dimen.com_adobe_image_store_list_icon_size);
      initCursor(paramCursor);
    }
    
    public void bindView(View paramView, final Context paramContext, Cursor paramCursor)
    {
      int i = getItemViewType(paramCursor.getPosition());
      final ViewHolder localViewHolder = (ViewHolder)paramView.getTag();
      if (localViewHolder == null) {}
      do
      {
        return;
        if (i == 0)
        {
          long l = paramCursor.getLong(idColumnIndex);
          paramView = paramCursor.getString(displayNameColumnIndex);
          paramContext = paramCursor.getString(iconPackColumnIndex);
          String str = paramCursor.getString(identifierColumnIndex);
          int k = paramCursor.getInt(itemsCountColumnIndex);
          int m = paramCursor.getInt(isFreeWithLoginIndex);
          i = 1;
          int j = 1;
          if (paramContext != null)
          {
            paramCursor = icon.getTag();
            int n = paramContext.hashCode();
            i = j;
            if ((paramCursor instanceof Integer))
            {
              i = j;
              if (((Integer)paramCursor).intValue() == n) {
                i = 0;
              }
            }
            j = i;
            if (i != 0)
            {
              paramCursor = picasso.load(paramContext).fade(200L).resize(mMaxImageSize, mMaxImageSize).onlyScaleDown();
              if (m == 1) {
                paramCursor.transform(new PackIconTransformer.Builder().withOverlay(R.drawable.com_adobe_image_pack_icon_badge, 53, 0).withPath(paramContext).withPackType(packType.toCdsString()).withPalette(false).withResources(getResources()).build());
              }
              paramCursor.into(icon, new Callback()
              {
                public void onError() {}
                
                public void onSuccess()
                {
                  localViewHoldericon.setTag(Integer.valueOf(paramContext.hashCode()));
                }
              });
            }
          }
          for (j = i;; j = i)
          {
            packid = l;
            identifier = str;
            isFreeWithLogin = m;
            if (j != 0)
            {
              title.setText(paramView);
              localViewHolder.setItemCount(k, getPackType());
            }
            paramContext = (CdsUtils.PackOptionWithPrice)packOptionMap.get(Long.valueOf(packid));
            paramView = paramContext;
            if (paramContext == null)
            {
              StoreListFragmentAbstract.logger.error("%d, option is null", new Object[] { Long.valueOf(packid) });
              paramView = new CdsUtils.PackOptionWithPrice(CdsUtils.PackOption.ERROR);
            }
            buttonContainer.setPackOption(paramView, packid);
            return;
            icon.setImageBitmap(null);
            icon.setTag(null);
          }
        }
      } while (i != 1);
      title.setText(getString(R.string.feather_store_checking_additional_packs));
    }
    
    public int getItemViewType(int paramInt)
    {
      long l = getItemId(paramInt);
      if (l == -2L) {
        return 2;
      }
      if (l == -1L) {
        return 1;
      }
      return 0;
    }
    
    public int getViewTypeCount()
    {
      return 3;
    }
    
    protected void initCursor(Cursor paramCursor)
    {
      if (paramCursor != null)
      {
        idColumnIndex = paramCursor.getColumnIndex("pack_id");
        displayNameColumnIndex = paramCursor.getColumnIndex("content_displayName");
        iconPackColumnIndex = paramCursor.getColumnIndex("content_iconPath");
        identifierColumnIndex = paramCursor.getColumnIndex("pack_identifier");
        itemsCountColumnIndex = paramCursor.getColumnIndex("content_numItems");
        isFreeWithLoginIndex = paramCursor.getColumnIndex("content_isFreeWithLogin");
      }
    }
    
    public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
    {
      int i = getItemViewType(paramCursor.getPosition());
      paramCursor = new ViewHolder();
      if (i == 0)
      {
        paramContext = LayoutInflater.from(paramContext).inflate(R.layout.com_adobe_image_store_list_item, paramViewGroup, false);
        paramViewGroup = (IAPBuyButton)paramContext.findViewById(R.id.com_adobe_image_buy_button);
        TextView localTextView = (TextView)paramContext.findViewById(R.id.title);
        ImageView localImageView = (ImageView)paramContext.findViewById(R.id.image);
        title = localTextView;
        icon = localImageView;
        buttonContainer = paramViewGroup;
        buttonContainer.setOnClickListener(StoreListFragment.this);
      }
      for (;;)
      {
        paramContext.setTag(paramCursor);
        return paramContext;
        if (i != 1) {
          break;
        }
        paramContext = LayoutInflater.from(paramContext).inflate(17367043, paramViewGroup, false);
        title = ((TextView)paramContext.findViewById(16908308));
      }
      throw new IllegalStateException("invalid type");
    }
    
    public Cursor swapCursor(Cursor paramCursor)
    {
      initCursor(paramCursor);
      return super.swapCursor(paramCursor);
    }
    
    class ViewHolder
    {
      IAPBuyButton buttonContainer;
      ImageView icon;
      String identifier;
      int isFreeWithLogin;
      int itemsCount = 0;
      Cds.PackType packType;
      long packid;
      TextView title;
      
      ViewHolder() {}
      
      public void setItemCount(int paramInt, Cds.PackType paramPackType)
      {
        packType = paramPackType;
        itemsCount = paramInt;
      }
    }
  }
  
  class NotifyDataSetChangedAsyncTask
    extends AdobeImageAsyncTask<Void, Void, Void>
  {
    NotifyDataSetChangedAsyncTask() {}
    
    protected void doPostExecute(Void paramVoid)
    {
      StoreListFragmentAbstract.logger.verbose("NotifyDataSetChangedAsyncTask.doPostExecute", new Object[0]);
      adapter.notifyDataSetChanged();
    }
  }
  
  class Refresher
    extends Subscriber<Map<Long, CdsUtils.PackOptionWithPrice>>
  {
    private Cursor mCursor;
    final Cds.PackType packType;
    private Map<Long, CdsUtils.PackOptionWithPrice> priceMap;
    private long t1;
    
    Refresher(Cds.PackType paramPackType)
    {
      packType = paramPackType;
    }
    
    private Observable<Map<Long, CdsUtils.PackOptionWithPrice>> generatePurchaseMap(final Cursor paramCursor)
    {
      Observable.create(new Observable.OnSubscribe()
      {
        public void call(Subscriber<? super Map<Long, String>> paramAnonymousSubscriber)
        {
          HashMap localHashMap = new HashMap();
          StoreListFragmentAbstract.logger.log("generatePurchaseMap::call: %s", new Object[] { Thread.currentThread() });
          if (paramCursor != null)
          {
            paramCursor.moveToPosition(-1);
            while (paramCursor.moveToNext())
            {
              PacksColumns.PackCursorWrapper localPackCursorWrapper = PacksColumns.PackCursorWrapper.create(paramCursor);
              if ((localPackCursorWrapper != null) && (localPackCursorWrapper.getId() > -1L)) {
                localHashMap.put(Long.valueOf(localPackCursorWrapper.getId()), localPackCursorWrapper.getIdentifier());
              }
            }
            paramCursor.moveToPosition(-1);
          }
          paramAnonymousSubscriber.onNext(localHashMap);
          paramAnonymousSubscriber.onCompleted();
        }
      }).concatMap(new Func1()
      {
        public Observable<Map<Long, CdsUtils.PackOptionWithPrice>> call(Map<Long, String> paramAnonymousMap)
        {
          SystemUtils.throwIfUiThread();
          StoreListFragmentAbstract.logger.log("generatePurchaseMap::concatMap::call: %s", new Object[] { Thread.currentThread() });
          StoreListFragmentAbstract.logger.log("array size: %d", new Object[] { Integer.valueOf(paramAnonymousMap.size()) });
          return getContentService().queryPurchases(paramAnonymousMap);
        }
      });
    }
    
    private Observable<Cursor> loadCursor()
    {
      Observable.create(new Observable.OnSubscribe()
      {
        public void call(Subscriber<? super Cursor> paramAnonymousSubscriber)
        {
          StoreListFragmentAbstract.logger.log("loadCursor: %s", new Object[] { Thread.currentThread() });
          SystemUtils.throwIfUiThread();
          if (!paramAnonymousSubscriber.isUnsubscribed())
          {
            Cursor localCursor = createCursorForAvailablePacks(packType);
            StoreListFragment.Refresher.access$302(StoreListFragment.Refresher.this, localCursor);
            paramAnonymousSubscriber.onNext(localCursor);
            paramAnonymousSubscriber.onCompleted();
          }
        }
      });
    }
    
    public Subscriber execute()
    {
      StoreListFragmentAbstract.logger.info("Refresher::execute");
      t1 = System.currentTimeMillis();
      AppObservable.bindSupportFragment(StoreListFragment.this, loadCursor().concatMap(new Func1()
      {
        public Observable<?> call(Cursor paramAnonymousCursor)
        {
          return StoreListFragment.Refresher.this.generatePurchaseMap(paramAnonymousCursor);
        }
      })).subscribeOn(Schedulers.computation()).subscribe(this);
      return this;
    }
    
    public void onCompleted()
    {
      StoreListFragmentAbstract.logger.info("Refresher.onCompleted(%s) in: %d", new Object[] { getPackType(), Long.valueOf(System.currentTimeMillis() - t1) });
      if ((getActivity() == null) || (getView() == null)) {
        return;
      }
      packOptionMap.clear();
      packOptionMap.putAll(priceMap);
      if ((adapter.getCursor() != null) && (adapter.getCursor().equals(mCursor))) {
        adapter.notifyDataSetInvalidated();
      }
      for (;;)
      {
        setListShown(true);
        mCursor = null;
        if ((!firstTime) || (!getArguments().getBoolean("autoSelectFirst", false))) {
          break;
        }
        firstTime = false;
        autoSelectedPackId = getArguments().getLong("selectedPackId", autoSelectedPackId);
        StoreListFragmentAbstract.logger.warn("autoSelectedPackId: %d", new Object[] { Long.valueOf(autoSelectedPackId) });
        selectPack(autoSelectedPackId, true);
        return;
        adapter.changeCursor(mCursor);
      }
    }
    
    public void onError(Throwable paramThrowable)
    {
      StoreListFragmentAbstract.logger.error("Refresher.onError");
      paramThrowable.printStackTrace();
      if ((getActivity() != null) && (isFragmentVisible())) {
        Toast.makeText(getActivity(), paramThrowable.getMessage(), 0).show();
      }
    }
    
    public void onNext(Map<Long, CdsUtils.PackOptionWithPrice> paramMap)
    {
      StoreListFragmentAbstract.logger.info("Refresher.onNext: map size=%d", new Object[] { Integer.valueOf(paramMap.size()) });
      priceMap = paramMap;
    }
  }
  
  class RequestPackDownloadAsyncTask
    extends AdobeImageAsyncTask<Void, Void, Void>
  {
    private final String identifier;
    private final long packId;
    private final String packType;
    private final String trackerName;
    private String userId;
    
    RequestPackDownloadAsyncTask(long paramLong, String paramString1, String paramString2, String paramString3, String paramString4)
    {
      packId = paramLong;
      identifier = paramString1;
      packType = paramString2;
      trackerName = paramString3;
      userId = paramString4;
    }
    
    protected void doPostExecute(Void paramVoid)
    {
      StoreListFragmentAbstract.logger.verbose("RequestPackDownloadAsyncTask.doPostExecute", new Object[0]);
      StoreListFragment.this.restorePackItem(packId, identifier, packType, trackerName, null);
    }
  }
  
  class RunInventoryAsyncTask
    extends AdobeImageAsyncTask<Cds.PackType, Void, Void>
  {
    Cds.PackType packType;
    
    RunInventoryAsyncTask() {}
    
    protected Void doInBackground(Cds.PackType... paramVarArgs)
    {
      StoreListFragmentAbstract.logger.verbose("RunInventoryAsyncTask::execute", new Object[0]);
      packType = paramVarArgs[0];
      return null;
    }
    
    protected void doPostExecute(Void paramVoid)
    {
      StoreListFragmentAbstract.logger.verbose("RunInventoryAsyncTask::doPostExecute", new Object[0]);
      super.doPostExecute(paramVoid);
      if ((getActivity() != null) && (getView() != null) && (!compositeSubscription.isUnsubscribed())) {
        compositeSubscription.add(new StoreListFragment.Refresher(StoreListFragment.this, packType).execute());
      }
    }
  }
}
