模块功能：

使用Decompile模块生成的java源文件进行分析
编写一定的代码匹配规则，匹配出java代码中调用的API（40个），敏感代码（24）个，以及代码中存在的URL，Email等
将数据保存在全局变量中：
+ extern NORMALs	ul;
+ extern NORMALs	em;
+ extern APITracing	api_t;
+ extern ReviewTracing	rev_t;

+ extern bool		native;
+ extern bool		dynamic;
+ extern bool		reflect;
+ extern bool		crypto;
+ extern bool		obfus;

**********************

文件结构：

codeanalysis.h        C++头文件
codeanalysis.cpp      C++源文件
----------------------
test.cpp              C++源文件/*程序入口*/
test                  可执行文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp ../utils/tinyxml/tinyxml.cpp ../utils/tinyxml/tinystr.cpp ../utils/tinyxml/tinyxmlparser.cpp ../utils/tinyxml/tinyxmlerror.cpp ../utils/tinyxml/xmlanalysis.cpp ../ManifestData/dvm_permissions.cpp ../ManifestData/manifestdata.cpp ../utils/utils.cpp codeanalysis.cpp -o test

**********************

运行：

终端下输入：./test
部分输出：

native = true
/*简单地讲，一个Native Method就是一个java调用非java代码的接口。一个Native Method是这样一个java的方法：该方法的实现由非java语言实现，比如C。这个特征并非java所特有，很多其它的编程语言都有这一机制，比如在C＋＋中，你可以用extern "C"告知C＋＋编译器去调用一个C的函数。
   "A native method is a Java method whose implementation is provided by non-java code."*/

dynamic = false
/*dynamic表示调用了类装载器，来实现对android插件的动态加载*/
reflect = true
/*JAVA反射机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意一个方法和属性；这种动态获取的信息以及动态调用对象的方法的功能称为java语言的反射机制*/
crypto = true
/*调用了cryptographic（加密）类和接口*/
obfus = false
/*调用了混淆器*/
*****************************URL Analysis******************************
com/facebook/internal/Utility.java:
- https://facebook.com
-------------------------------------------------------------------
com/facebook/internal/ServerProtocol.java:
- https://graph.
-------------------------------------------------------------------
com/facebook/ads/internal/server/a.java:
- https://ad6.liverail.com/
-------------------------------------------------------------------
com/facebook/ads/internal/util/h.java:
- https://www.facebook.com/
-------------------------------------------------------------------
com/behance/sdk/util/BehanceSDKUrlUtil.java:
- https://cc-api-behance.adobe.io
-------------------------------------------------------------------
com/behance/sdk/services/BehanceSDKPublishWIPService.java:
- https://api.twitter.com/1.1/statuses/update.json?status=
-------------------------------------------------------------------
com/behance/sdk/services/BehanceSDKPublishProjectService.java:
- https://api.twitter.com/1.1/statuses/update.json?status=
-------------------------------------------------------------------
com/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask.java:
- https://api.twitter.com/1.1/account/settings.json
-------------------------------------------------------------------
com/behance/sdk/OAuth/TwitterClient.java:
- https://api.twitter.com/oauth/request
-------------------------------------------------------------------
com/behance/sdk/ui/fragments/BehanceSDKImageCropperDialogFragment.java:
- file:///
-------------------------------------------------------------------
com/behance/sdk/ui/customviews/BehanceSDKEditText.java:
- http://schemas.android.com/apk/com.behance.sdk
-------------------------------------------------------------------
com/behance/sdk/ui/customviews/BehanceSDKTextView.java:
- http://schemas.android.com/apk/com.behance.sdk
-------------------------------------------------------------------
com/behance/sdk/ui/customviews/BehanceSDKButton.java:
- http://schemas.android.com/apk/com.behance.sdk
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract.java:
- http://cds-gateway.aviary.com/v1/gateway
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader.java:
- file:///android
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/internal/utils/IOUtils.java:
- file:///android
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils.java:
- http://receipts.aviary.com/v2/content
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/internal/receipt/ReceiptManager.java:
- http://receipts-gateway.aviary.com/v2/receipt/android/free
-------------------------------------------------------------------
com/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment.java:
- http://support.aviary.com/
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic.java:
- https://www.behance.net/v2/users/
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession.java:
- https://cc-collab-stage.adobe.io
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession.java:
- https://cc-api-storage.adobe.io
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment.java:
- https://accounts.adobe.com
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsContainerFragment.java:
- https://play.google.com/store/apps/details?id=com.adobe.photoshopmix
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession.java:
- https://photo-api.adobe.io
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession.java:
- https://ans.adobe.io/ans/v1/notifications
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession.java:
- https://stg-ans.oobesaas.adobe.com
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils.java:
- https://api.oznext.com
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession.java:
- https://cc-api-image.adobe.io
-------------------------------------------------------------------
com/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession.java:
- https://entitlements.adobe.io
-------------------------------------------------------------------
com/dumplingsandwich/pencilsketch/utils/BitmapUtils.java:
- https://play.google.com/store/apps/details?id=com.dumplingsandwich.pencilsketch
-------------------------------------------------------------------
com/dumplingsandwich/pencilsketch/activities/InfoActivity.java:
- https://www.facebook.com/pencilsketchds/
-------------------------------------------------------------------
com/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity.java:
- http://bit.ly/1FUJSD4
-------------------------------------------------------------------
it/sephiroth/android/library/picasso/AssetRequestHandler.java:
- file:///android
-------------------------------------------------------------------
****************************Email Analysis*****************************
*****************************API Analysis******************************
-------------------------------------------------------------------
* API:ipc
* Description:Inter Process Communication 
- com/facebook/BoltsMeasurementEventListener.java
- com/facebook/internal/NativeProtocol.java
- com/facebook/internal/PlatformServiceClient.java
- com/facebook/internal/SessionTracker.java
- com/facebook/ads/internal/action/d.java
- com/facebook/ads/internal/action/c.java
- com/facebook/ads/internal/view/h.java
- com/facebook/ads/internal/view/m.java
- com/facebook/ads/internal/view/f.java
- com/facebook/ads/internal/h.java
- com/facebook/ads/internal/adapters/l.java
- com/facebook/ads/internal/adapters/d.java
- com/facebook/ads/internal/adapters/j.java
- com/facebook/ads/internal/f.java
- com/facebook/ads/InterstitialAdActivity.java
- com/facebook/ads/NativeAd.java
- com/facebook/FacebookBroadcastReceiver.java
- com/facebook/widget/WebDialog.java
- com/facebook/LoginActivity.java
- com/facebook/Session.java
- com/android/vending/billing/IInAppBillingService.java
- com/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment.java
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/behance/sdk/BehanceSDK.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment.java
- com/behance/sdk/ui/activities/BehanceSDKBasePublishActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity.java
- com/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity.java
- com/behance/sdk/ui/activities/BehanceSDKEditProfileActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity.java
- com/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity.java
- com/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity.java
- com/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService.java
- com/adobe/creativesdk/aviary/internal/cds/util/IabHelper.java
- com/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper.java
- com/adobe/creativesdk/aviary/internal/cds/CdsService.java
- com/adobe/creativesdk/aviary/internal/cds/CdsReceiver.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract.java
- com/adobe/creativesdk/aviary/internal/utils/BatteryUtils.java
- com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager.java
- com/adobe/creativesdk/aviary/internal/AdobeImageEditorController.java
- com/adobe/creativesdk/aviary/internal/services/LocalDataService.java
- com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager.java
- com/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection.java
- com/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager.java
- com/adobe/creativesdk/aviary/internal/MonitoredActivity.java
- com/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService.java
- com/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragment.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract.java
- com/adobe/creativesdk/aviary/utils/AdobeImageEditorIntentConfigurationValidator.java
- com/adobe/creativesdk/aviary/AdobeImageBillingService.java
- com/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment.java
- com/adobe/creativesdk/aviary/AdobeImageEditorActivity.java
- com/adobe/creativesdk/aviary/widget/PackDetailLayout.java
- com/adobe/creativesdk/aviary/panels/AbstractOptionPanel.java
- com/adobe/creativesdk/aviary/panels/StickersPanel.java
- com/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity.java
- com/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticatorService.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity.java
- com/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser.java
- com/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher.java
- com/localytics/android/LocalyticsSession.java
- com/localytics/android/ReferralReceiver.java
- com/localytics/android/SessionHandler.java
- com/localytics/android/AmpDialogFragment.java
- com/localytics/android/PushReceiver.java
- com/dumplingsandwich/pencilsketch/utils/BitmapUtils.java
- com/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity.java
- com/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity.java
- com/dumplingsandwich/pencilsketch/activities/InfoActivity.java
- com/dumplingsandwich/pencilsketch/activities/CanvasActivity.java
- com/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity.java
- com/dumplingsandwich/pencilsketch/activities/SplashScreenActivity.java
- com/dumplingsandwich/pencilsketch/activities/MainActivity.java
- com/dumplingsandwich/pencilsketch/activities/ImageEditingActivity.java
- rx/android/content/OnSubscribeBroadcastRegister.java
- rx/android/content/OnSubscribeLocalBroadcastRegister.java
- rx/android/content/ContentObservable.java
- it/sephiroth/android/library/picasso/Dispatcher.java
-------------------------------------------------------------------
* API:gs
* Description:Get System Service 
- com/facebook/ads/internal/server/a.java
- com/facebook/ads/internal/util/g.java
- com/facebook/ads/internal/dto/f.java
- com/facebook/ads/internal/adapters/j.java
- com/facebook/ads/InterstitialAdActivity.java
- com/facebook/widget/WebDialog.java
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment.java
- com/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter.java
- com/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter.java
- com/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity.java
- com/behance/sdk/ui/activities/BehanceSDKEditProfileActivity.java
- com/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity.java
- com/adobe/android/ui/widget/VibrationHelper.java
- com/adobe/android/ui/widget/AdobeCustomToast.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory.java
- com/adobe/creativesdk/aviary/internal/cds/CdsService.java
- com/adobe/creativesdk/aviary/internal/cds/CdsReceiver.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract.java
- com/adobe/creativesdk/aviary/internal/utils/ConnectionUtils.java
- com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager.java
- com/adobe/creativesdk/aviary/internal/headless/gl/GLUtils.java
- com/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment.java
- com/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListFolderCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController.java
- com/localytics/android/AmpUploadHandler.java
- com/localytics/android/TestModeButton.java
- com/localytics/android/SessionHandler.java
- com/localytics/android/DatapointHelper.java
- com/localytics/android/AmpDialogFragment.java
- com/localytics/android/TestModeListView.java
- com/localytics/android/AmpSessionHandler.java
- it/sephiroth/android/library/picasso/Utils.java
-------------------------------------------------------------------
* API:nurl
* Description:URL Connection supports file,http,https,ftp and jar 
- com/facebook/Request.java
- com/adobe/creativesdk/aviary/internal/utils/DecodeUtils.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask.java
- com/squareup/okhttp/OkUrlFactory.java
- com/localytics/android/AmpDownloader.java
- com/nostra13/universalimageloader/core/download/BaseImageDownloader.java
- it/sephiroth/android/library/picasso/UrlConnectionDownloader.java
-------------------------------------------------------------------
* API:httpsurl
* Description:HTTPS Connection 
- com/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:bencode
* Description:Base64 Encode 
- com/facebook/ads/internal/adapters/o.java
- com/adobe/creativesdk/aviary/internal/utils/CryptoUtils.java
- com/adobe/creativesdk/foundation/internal/utils/Util.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher.java
- com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager.java
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:webview_addjs
* Description:WebView JavaScript Interface 
- com/facebook/ads/internal/view/a.java
- com/localytics/android/AmpDialogFragment.java
-------------------------------------------------------------------
* API:inf_ser
* Description:Starting Service
- com/facebook/internal/PlatformServiceClient.java
- com/facebook/ads/internal/f.java
- com/facebook/Session.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment.java
- com/adobe/creativesdk/aviary/internal/cds/util/IabHelper.java
- com/adobe/creativesdk/aviary/internal/cds/CdsReceiver.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract.java
- com/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection.java
- com/adobe/creativesdk/aviary/internal/MonitoredActivity.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragment.java
- com/localytics/android/SessionHandler.java
- com/dumplingsandwich/pencilsketch/activities/ImageEditingActivity.java
-------------------------------------------------------------------
* API:inf_bro
* Description:Sending Broadcast
- com/facebook/ads/InterstitialAdActivity.java
- com/facebook/Session.java
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract.java
- com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:notify
* Description:Android Notifications 
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager.java
- com/localytics/android/SessionHandler.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:contentq
* Description:Query Database of SMS, Contacts etc. 
- com/facebook/internal/NativeProtocol.java
- com/facebook/internal/AttributionIdentifiers.java
- com/facebook/ads/internal/util/g.java
- com/behance/sdk/files/LocalImageLoader.java
- com/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory.java
- com/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper.java
- com/adobe/creativesdk/aviary/internal/cds/CdsPreviewValidator.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsReceiver.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer.java
- com/adobe/creativesdk/aviary/internal/utils/IOUtils.java
- com/adobe/creativesdk/aviary/internal/services/MessageService.java
- com/adobe/creativesdk/aviary/internal/receipt/ReceiptManager.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragment.java
- com/adobe/creativesdk/aviary/utils/CdsUIUtils.java
- com/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment.java
- com/adobe/creativesdk/aviary/panels/BordersPanel.java
- com/adobe/creativesdk/aviary/panels/StickersPanel.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment.java
- com/localytics/android/DatapointHelper.java
- com/dumplingsandwich/pencilsketch/activities/MainActivity.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:httpclient
* Description:HTTP Requests, Connections and Sessions 
- org/apache/http/impl/client/AutoRetryHttpClient.java
- org/apache/http/impl/client/FutureRequestExecutionService.java
- org/apache/http/impl/client/CloseableHttpClient.java
- org/apache/http/impl/client/HttpRequestTaskCallable.java
- org/apache/http/impl/client/DecompressingHttpClient.java
- org/apache/http/impl/client/AbstractHttpClient.java
- org/apache/http/client/utils/HttpClientUtils.java
- com/facebook/ads/internal/util/o.java
- com/facebook/ads/internal/util/g.java
- com/facebook/ads/internal/util/k.java
- com/facebook/ads/internal/http/b.java
- com/behance/sdk/util/BehanceSDKHTTPUtils.java
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask.java
- com/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils.java
- com/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils.java
- com/localytics/android/LocalyticsAmpSession.java
- oauth/signpost/commonshttp/CommonsHttpOAuthProvider.java
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:socket
* Description:TCP Socket 
- org/apache/http/impl/pool/BasicConnFactory.java
- org/apache/http/impl/DefaultBHttpClientConnection.java
- org/apache/http/impl/SocketHttpClientConnection.java
- org/apache/http/impl/DefaultBHttpServerConnection.java
- org/apache/http/impl/DefaultBHttpServerConnectionFactory.java
- org/apache/http/impl/DefaultHttpServerConnection.java
- org/apache/http/impl/client/ProxyClient.java
- org/apache/http/impl/client/DefaultBackoffStrategy.java
- org/apache/http/impl/BHttpConnectionBase.java
- org/apache/http/impl/io/SocketOutputBuffer.java
- org/apache/http/impl/io/SocketInputBuffer.java
- org/apache/http/impl/SocketHttpServerConnection.java
- org/apache/http/impl/conn/DefaultClientConnectionOperator.java
- org/apache/http/impl/conn/DefaultManagedHttpClientConnection.java
- org/apache/http/impl/conn/HttpClientConnectionOperator.java
- org/apache/http/impl/conn/LoggingManagedHttpClientConnection.java
- org/apache/http/impl/conn/AbstractClientConnAdapter.java
- org/apache/http/impl/conn/DefaultClientConnection.java
- org/apache/http/impl/conn/ManagedClientConnectionImpl.java
- org/apache/http/impl/DefaultBHttpClientConnectionFactory.java
- org/apache/http/impl/DefaultHttpClientConnection.java
- org/apache/http/impl/AbstractHttpClientConnection.java
- org/apache/http/util/NetUtils.java
- org/apache/http/conn/MultihomePlainSocketFactory.java
- org/apache/http/conn/ManagedHttpClientConnection.java
- org/apache/http/conn/socket/ConnectionSocketFactory.java
- org/apache/http/conn/socket/PlainConnectionSocketFactory.java
- org/apache/http/conn/socket/LayeredConnectionSocketFactory.java
- org/apache/http/conn/ssl/SSLSocketFactory.java
- org/apache/http/conn/ssl/SSLConnectionSocketFactory.java
- org/apache/http/conn/ssl/SSLContextBuilder.java
- org/apache/http/conn/ssl/PrivateKeyStrategy.java
- org/apache/http/conn/BasicManagedEntity.java
- org/apache/http/conn/scheme/SchemeLayeredSocketFactory.java
- org/apache/http/conn/scheme/LayeredSchemeSocketFactory.java
- org/apache/http/conn/scheme/LayeredSocketFactory.java
- org/apache/http/conn/scheme/SchemeSocketFactory.java
- org/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor.java
- org/apache/http/conn/scheme/SocketFactory.java
- org/apache/http/conn/scheme/SchemeSocketFactoryAdaptor.java
- org/apache/http/conn/scheme/SocketFactoryAdaptor.java
- org/apache/http/conn/scheme/PlainSocketFactory.java
- org/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor2.java
- org/apache/http/conn/scheme/LayeredSocketFactoryAdaptor.java
- org/apache/http/conn/OperatedClientConnection.java
- org/apache/http/HttpConnectionFactory.java
- com/facebook/ads/internal/util/q.java
- com/facebook/ads/internal/http/b.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService.java
- com/squareup/okhttp/internal/spdy/SpdyConnection.java
- com/squareup/okhttp/internal/Util.java
- com/squareup/okhttp/internal/http/RouteSelector.java
- com/squareup/okhttp/internal/http/HttpConnection.java
- com/squareup/okhttp/internal/huc/HttpURLConnectionImpl.java
- com/squareup/okhttp/internal/Platform.java
- com/squareup/okhttp/OkHttpClient.java
- com/squareup/okhttp/ConnectionPool.java
- com/squareup/okhttp/Connection.java
- com/squareup/okhttp/Address.java
- okio/Okio.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:mdigest
* Description:Message Digest 
- org/apache/http/impl/auth/DigestScheme.java
- org/apache/http/impl/auth/HttpEntityDigester.java
- org/apache/http/impl/auth/NTLMEngineImpl.java
- com/facebook/internal/Utility.java
- com/facebook/ads/internal/util/s.java
- com/adobe/creativesdk/aviary/internal/utils/CryptoUtils.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance.java
- com/squareup/okhttp/internal/Util.java
- com/localytics/android/DatapointHelper.java
- okio/Buffer.java
- okio/ByteString.java
-------------------------------------------------------------------
* API:devid
* Description:Get Device ID, IMEI,MEID/ESN etc. 
- com/localytics/android/DatapointHelper.java
-------------------------------------------------------------------
* API:crypto
* Description:Crypto 
- org/apache/http/impl/auth/NTLMEngineImpl.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher.java
- com/adobe/creativesdk/foundation/AdobeCSDKFoundation.java
- oauth/signpost/signature/HmacSha1MessageSigner.java
-------------------------------------------------------------------
* API:bdecode
* Description:Base64 Decode 
- com/adobe/creativesdk/foundation/internal/utils/Util.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask.java
- com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager.java
-------------------------------------------------------------------
* API:inf_act
* Description:Starting Activity
- com/facebook/ads/internal/action/d.java
- com/facebook/ads/internal/action/c.java
- com/facebook/ads/internal/h.java
- com/facebook/ads/internal/adapters/j.java
- com/facebook/widget/WebDialog.java
- com/facebook/Session.java
- com/behance/sdk/BehanceSDK.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment.java
- com/behance/sdk/ui/activities/BehanceSDKBasePublishActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity.java
- com/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity.java
- com/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment.java
- com/adobe/creativesdk/aviary/widget/PackDetailLayout.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager.java
- com/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser.java
- com/localytics/android/AmpDialogFragment.java
- com/dumplingsandwich/pencilsketch/utils/BitmapUtils.java
- com/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity.java
- com/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity.java
- com/dumplingsandwich/pencilsketch/activities/InfoActivity.java
- com/dumplingsandwich/pencilsketch/activities/CanvasActivity.java
- com/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity.java
- com/dumplingsandwich/pencilsketch/activities/SplashScreenActivity.java
- com/dumplingsandwich/pencilsketch/activities/MainActivity.java
- com/dumplingsandwich/pencilsketch/activities/ImageEditingActivity.java
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:refmethod
* Description:Java Reflection Method Invocation 
- org/apache/http/impl/execchain/RequestEntityExecHandler.java
- org/apache/http/impl/execchain/ResponseProxyHandler.java
- org/apache/http/impl/client/CloseableHttpResponseProxy.java
- org/apache/http/impl/conn/CPoolProxy.java
- org/apache/http/util/ExceptionUtils.java
- org/apache/http/client/utils/JdkIdn.java
- org/apache/http/client/utils/CloneUtils.java
- com/nineoldandroids/animation/PropertyValuesHolder.java
- com/facebook/internal/Utility.java
- com/facebook/internal/AttributionIdentifiers.java
- com/facebook/model/GraphObject.java
- com/facebook/ads/internal/util/g.java
- com/facebook/ads/internal/util/h.java
- com/facebook/ads/internal/f.java
- com/facebook/RequestAsyncTask.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment.java
- com/squareup/okhttp/internal/Platform.java
- com/localytics/android/ReflectionUtils.java
- rx/internal/schedulers/NewThreadWorker.java
- de/greenrobot/event/EventBus.java
-------------------------------------------------------------------
* API:urlcon
* Description:URL Connection to file/http/https/ftp/jar 
- com/facebook/internal/Utility.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask.java
- com/squareup/okhttp/OkUrlFactory.java
- com/localytics/android/AmpDownloader.java
-------------------------------------------------------------------
* API:fileio
* Description:Local File I/O Operations
- com/facebook/Settings.java
- com/facebook/internal/FileLruCache.java
- com/facebook/ads/AdSettings.java
- com/facebook/ads/internal/util/m.java
- com/facebook/ads/internal/dto/f.java
- com/facebook/SharedPreferencesTokenCachingStrategy.java
- com/behance/sdk/BehanceSDKSocialAccountManager.java
- com/behance/sdk/ui/activities/BehanceSDKBasePublishActivity.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory.java
- com/adobe/creativesdk/aviary/utils/SharedPreferencesUtils.java
- com/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings.java
- com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel.java
- com/nostra13/universalimageloader/utils/StorageUtils.java
- com/nostra13/universalimageloader/core/DefaultConfigurationFactory.java
- it/sephiroth/android/library/disklrumulticache/DiskLruMultiCache.java
- it/sephiroth/android/library/disklrumulticache/DiskUtils.java
- it/sephiroth/android/library/picasso/Utils.java
- it/sephiroth/android/library/ab/ABSharedPreference.java
-------------------------------------------------------------------
* API:webviewget
* Description:WebView GET Request 
- com/facebook/ads/internal/adapters/j.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:httpcon
* Description:HTTP Connection 
- org/apache/http/HttpRequest.java
- org/apache/http/pool/AbstractConnPool.java
- org/apache/http/impl/pool/BasicConnFactory.java
- org/apache/http/impl/DefaultBHttpClientConnection.java
- org/apache/http/impl/DefaultHttpRequestFactory.java
- org/apache/http/impl/DefaultBHttpServerConnection.java
- org/apache/http/impl/execchain/ServiceUnavailableRetryExec.java
- org/apache/http/impl/execchain/ClientExecChain.java
- org/apache/http/impl/execchain/RedirectExec.java
- org/apache/http/impl/execchain/BackoffStrategyExec.java
- org/apache/http/impl/execchain/Proxies.java
- org/apache/http/impl/execchain/RetryExec.java
- org/apache/http/impl/execchain/MainClientExec.java
- org/apache/http/impl/execchain/ProtocolExec.java
- org/apache/http/impl/execchain/MinimalClientExec.java
- org/apache/http/impl/DefaultBHttpServerConnectionFactory.java
- org/apache/http/impl/AbstractHttpServerConnection.java
- org/apache/http/impl/client/RequestWrapper.java
- org/apache/http/impl/client/DefaultRedirectStrategy.java
- org/apache/http/impl/client/AutoRetryHttpClient.java
- org/apache/http/impl/client/HttpRequestFutureTask.java
- org/apache/http/impl/client/FutureRequestExecutionService.java
- org/apache/http/impl/client/StandardHttpRequestRetryHandler.java
- org/apache/http/impl/client/CloseableHttpClient.java
- org/apache/http/impl/client/DefaultHttpRequestRetryHandler.java
- org/apache/http/impl/client/DefaultRedirectHandler.java
- org/apache/http/impl/client/ProxyClient.java
- org/apache/http/impl/client/HttpRequestTaskCallable.java
- org/apache/http/impl/client/InternalHttpClient.java
- org/apache/http/impl/client/DecompressingHttpClient.java
- org/apache/http/impl/client/HttpClientBuilder.java
- org/apache/http/impl/client/DefaultRedirectStrategyAdaptor.java
- org/apache/http/impl/client/AbstractHttpClient.java
- org/apache/http/impl/client/AIMDBackoffManager.java
- org/apache/http/impl/client/DefaultRequestDirector.java
- org/apache/http/impl/client/MinimalHttpClient.java
- org/apache/http/impl/io/AbstractSessionOutputBuffer.java
- org/apache/http/impl/io/HttpRequestParser.java
- org/apache/http/impl/io/AbstractSessionInputBuffer.java
- org/apache/http/impl/io/DefaultHttpRequestParserFactory.java
- org/apache/http/impl/io/HttpRequestWriter.java
- org/apache/http/impl/io/DefaultHttpRequestParser.java
- org/apache/http/impl/io/DefaultHttpRequestWriter.java
- org/apache/http/impl/io/DefaultHttpRequestWriterFactory.java
- org/apache/http/impl/conn/DefaultHttpRoutePlanner.java
- org/apache/http/impl/conn/PoolingClientConnectionManager.java
- org/apache/http/impl/conn/SystemDefaultRoutePlanner.java
- org/apache/http/impl/conn/DefaultClientConnectionOperator.java
- org/apache/http/impl/conn/DefaultManagedHttpClientConnection.java
- org/apache/http/impl/conn/SingleClientConnManager.java
- org/apache/http/impl/conn/DefaultProxyRoutePlanner.java
- org/apache/http/impl/conn/AbstractPooledConnAdapter.java
- org/apache/http/impl/conn/tsccm/BasicPoolEntry.java
- org/apache/http/impl/conn/tsccm/RouteSpecificPool.java
- org/apache/http/impl/conn/tsccm/AbstractConnPool.java
- org/apache/http/impl/conn/tsccm/ConnPoolByRoute.java
- org/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager.java
- org/apache/http/impl/conn/HttpClientConnectionOperator.java
- org/apache/http/impl/conn/DefaultRoutePlanner.java
- org/apache/http/impl/conn/DefaultResponseParser.java
- org/apache/http/impl/conn/CPoolEntry.java
- org/apache/http/impl/conn/LoggingManagedHttpClientConnection.java
- org/apache/http/impl/conn/BasicHttpClientConnectionManager.java
- org/apache/http/impl/conn/AbstractClientConnAdapter.java
- org/apache/http/impl/conn/IdleConnectionHandler.java
- org/apache/http/impl/conn/AbstractPoolEntry.java
- org/apache/http/impl/conn/PoolingHttpClientConnectionManager.java
- org/apache/http/impl/conn/BasicClientConnectionManager.java
- org/apache/http/impl/conn/ProxySelectorRoutePlanner.java
- org/apache/http/impl/conn/HttpPoolEntry.java
- org/apache/http/impl/conn/DefaultClientConnection.java
- org/apache/http/impl/conn/ManagedHttpClientConnectionFactory.java
- org/apache/http/impl/conn/ManagedClientConnectionImpl.java
- org/apache/http/impl/auth/RFC2617Scheme.java
- org/apache/http/impl/auth/BasicScheme.java
- org/apache/http/impl/auth/AuthSchemeBase.java
- org/apache/http/impl/auth/NegotiateScheme.java
- org/apache/http/impl/auth/SPNegoScheme.java
- org/apache/http/impl/auth/HttpAuthenticator.java
- org/apache/http/impl/auth/DigestScheme.java
- org/apache/http/impl/auth/KerberosScheme.java
- org/apache/http/impl/DefaultBHttpClientConnectionFactory.java
- org/apache/http/impl/AbstractHttpClientConnection.java
- org/apache/http/params/CoreConnectionPNames.java
- org/apache/http/params/HttpParamConfig.java
- org/apache/http/params/HttpConnectionParams.java
- org/apache/http/protocol/HttpExpectationVerifier.java
- org/apache/http/protocol/ExecutionContext.java
- org/apache/http/protocol/HttpRequestHandlerMapper.java
- org/apache/http/protocol/UriHttpRequestHandlerMapper.java
- org/apache/http/protocol/HttpRequestHandlerRegistry.java
- org/apache/http/protocol/ResponseConnControl.java
- org/apache/http/protocol/ImmutableHttpProcessor.java
- org/apache/http/protocol/HttpCoreContext.java
- org/apache/http/protocol/RequestContent.java
- org/apache/http/protocol/HttpProcessor.java
- org/apache/http/protocol/BasicHttpProcessor.java
- org/apache/http/protocol/HttpRequestHandlerResolver.java
- org/apache/http/protocol/RequestDate.java
- org/apache/http/protocol/HttpRequestExecutor.java
- org/apache/http/protocol/RequestTargetHost.java
- org/apache/http/protocol/HttpRequestHandler.java
- org/apache/http/protocol/RequestUserAgent.java
- org/apache/http/protocol/HttpProcessorBuilder.java
- org/apache/http/protocol/HttpRequestInterceptorList.java
- org/apache/http/protocol/RequestConnControl.java
- org/apache/http/protocol/RequestExpectContinue.java
- org/apache/http/HttpRequestFactory.java
- org/apache/http/client/RequestDirector.java
- org/apache/http/client/params/HttpClientParamConfig.java
- org/apache/http/client/params/ClientParamBean.java
- org/apache/http/client/params/ClientPNames.java
- org/apache/http/client/protocol/RequestAuthenticationBase.java
- org/apache/http/client/protocol/RequestAcceptEncoding.java
- org/apache/http/client/protocol/RequestAuthCache.java
- org/apache/http/client/protocol/RequestTargetAuthentication.java
- org/apache/http/client/protocol/RequestDefaultHeaders.java
- org/apache/http/client/protocol/RequestClientConnControl.java
- org/apache/http/client/protocol/RequestAddCookies.java
- org/apache/http/client/protocol/RequestProxyAuthentication.java
- org/apache/http/client/protocol/RequestExpectContinue.java
- org/apache/http/client/config/RequestConfig.java
- org/apache/http/client/HttpRequestRetryHandler.java
- org/apache/http/client/RedirectStrategy.java
- org/apache/http/client/methods/HttpTrace.java
- org/apache/http/client/methods/HttpDelete.java
- org/apache/http/client/methods/HttpRequestWrapper.java
- org/apache/http/client/methods/AbortableHttpRequest.java
- org/apache/http/client/methods/HttpOptions.java
- org/apache/http/client/methods/HttpGet.java
- org/apache/http/client/methods/HttpRequestBase.java
- org/apache/http/client/methods/HttpUriRequest.java
- org/apache/http/client/methods/AbstractExecutionAwareRequest.java
- org/apache/http/client/methods/HttpEntityEnclosingRequestBase.java
- org/apache/http/client/methods/HttpHead.java
- org/apache/http/client/methods/RequestBuilder.java
- org/apache/http/client/HttpClient.java
- org/apache/http/cookie/CookieSpecRegistry.java
- org/apache/http/HttpEntityEnclosingRequest.java
- org/apache/http/conn/MultihomePlainSocketFactory.java
- org/apache/http/conn/params/ConnConnectionPNames.java
- org/apache/http/conn/params/ConnConnectionParamBean.java
- org/apache/http/conn/routing/HttpRoutePlanner.java
- org/apache/http/conn/routing/RouteTracker.java
- org/apache/http/conn/socket/ConnectionSocketFactory.java
- org/apache/http/conn/socket/PlainConnectionSocketFactory.java
- org/apache/http/conn/ClientConnectionOperator.java
- org/apache/http/conn/ssl/SSLSocketFactory.java
- org/apache/http/conn/ssl/SSLConnectionSocketFactory.java
- org/apache/http/conn/scheme/SchemeSocketFactory.java
- org/apache/http/conn/scheme/SocketFactory.java
- org/apache/http/conn/scheme/SchemeSocketFactoryAdaptor.java
- org/apache/http/conn/scheme/SocketFactoryAdaptor.java
- org/apache/http/conn/scheme/PlainSocketFactory.java
- org/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor2.java
- org/apache/http/conn/HttpClientConnectionManager.java
- org/apache/http/HttpRequestInterceptor.java
- org/apache/http/HttpServerConnection.java
- org/apache/http/HttpClientConnection.java
- org/apache/http/auth/AuthScheme.java
- org/apache/http/auth/ContextAwareAuthScheme.java
- org/apache/http/auth/AuthSchemeRegistry.java
- org/apache/http/message/BasicHttpEntityEnclosingRequest.java
- org/apache/http/message/BasicHttpRequest.java
- com/facebook/internal/Utility.java
- com/facebook/ads/internal/http/b.java
- com/facebook/ads/internal/http/a.java
- com/facebook/Response.java
- com/facebook/RequestAsyncTask.java
- com/facebook/Request.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader.java
- com/adobe/creativesdk/aviary/internal/utils/DecodeUtils.java
- com/adobe/creativesdk/aviary/internal/utils/IOUtils.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask.java
- com/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection.java
- com/squareup/okhttp/internal/huc/HttpURLConnectionImpl.java
- com/squareup/okhttp/OkUrlFactory.java
- com/nostra13/universalimageloader/core/download/BaseImageDownloader.java
- oauth/signpost/commonshttp/HttpRequestAdapter.java
- oauth/signpost/commonshttp/CommonsHttpOAuthConsumer.java
- oauth/signpost/commonshttp/CommonsHttpOAuthProvider.java
- it/sephiroth/android/library/picasso/UrlConnectionDownloader.java
-------------------------------------------------------------------
-------------------------------------------------------------------
* API:gps
* Description:GPS Location
- com/localytics/android/SessionHandler.java
-------------------------------------------------------------------
***********************Sensitive Code Analysis*************************
* Key:rand
* Security:high
* Description:The App uses an insecure Random Number Generator.
- org/apache/http/entity/mime/MultipartEntityBuilder.java
- org/apache/http/entity/mime/MultipartEntity.java
- com/facebook/ads/internal/http/e.java
- oauth/signpost/AbstractOAuthConsumer.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* Key:d_webviewdisablessl
* Security:high
* Description:Insecure WebView Implementation. WebView ignores SSL Certificate Errors.
- com/facebook/ads/internal/view/a.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* Key:log
* Security:info
* Description:The App logs information. Sensitive information should never be logged.
- uk/co/senab/photoview/gestures/CupcakeGestureDetector.java
- uk/co/senab/photoview/PhotoViewAttacher.java
- uk/co/senab/photoview/log/LoggerDefault.java
- uk/co/senab/photoview/log/LogManager.java
- uk/co/senab/photoview/log/Logger.java
- org/apache/http/impl/execchain/ServiceUnavailableRetryExec.java
- org/apache/http/impl/execchain/RedirectExec.java
- org/apache/http/impl/execchain/ConnectionHolder.java
- org/apache/http/impl/execchain/RetryExec.java
- org/apache/http/impl/execchain/MainClientExec.java
- org/apache/http/impl/execchain/ProtocolExec.java
- org/apache/http/impl/execchain/MinimalClientExec.java
- org/apache/http/impl/client/AuthenticationStrategyImpl.java
- org/apache/http/impl/client/AbstractAuthenticationHandler.java
- org/apache/http/impl/client/DefaultRedirectStrategy.java
- org/apache/http/impl/client/AutoRetryHttpClient.java
- org/apache/http/impl/client/CloseableHttpClient.java
- org/apache/http/impl/client/DefaultRedirectHandler.java
- org/apache/http/impl/client/InternalHttpClient.java
- org/apache/http/impl/client/AbstractHttpClient.java
- org/apache/http/impl/client/AuthenticationStrategyAdaptor.java
- org/apache/http/impl/client/HttpAuthenticator.java
- org/apache/http/impl/client/DefaultRequestDirector.java
- org/apache/http/impl/conn/PoolingClientConnectionManager.java
- org/apache/http/impl/conn/DefaultClientConnectionOperator.java
- org/apache/http/impl/conn/SingleClientConnManager.java
- org/apache/http/impl/conn/LoggingInputStream.java
- org/apache/http/impl/conn/tsccm/RouteSpecificPool.java
- org/apache/http/impl/conn/tsccm/AbstractConnPool.java
- org/apache/http/impl/conn/tsccm/ConnPoolByRoute.java
- org/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager.java
- org/apache/http/impl/conn/LoggingSessionOutputBuffer.java
- org/apache/http/impl/conn/HttpConnPool.java
- org/apache/http/impl/conn/HttpClientConnectionOperator.java
- org/apache/http/impl/conn/DefaultResponseParser.java
- org/apache/http/impl/conn/LoggingOutputStream.java
- org/apache/http/impl/conn/CPoolEntry.java
- org/apache/http/impl/conn/LoggingManagedHttpClientConnection.java
- org/apache/http/impl/conn/BasicHttpClientConnectionManager.java
- org/apache/http/impl/conn/Wire.java
- org/apache/http/impl/conn/IdleConnectionHandler.java
- org/apache/http/impl/conn/PoolingHttpClientConnectionManager.java
- org/apache/http/impl/conn/LoggingSessionInputBuffer.java
- org/apache/http/impl/conn/CPool.java
- org/apache/http/impl/conn/BasicClientConnectionManager.java
- org/apache/http/impl/conn/HttpPoolEntry.java
- org/apache/http/impl/conn/InMemoryDnsResolver.java
- org/apache/http/impl/conn/DefaultClientConnection.java
- org/apache/http/impl/conn/ManagedHttpClientConnectionFactory.java
- org/apache/http/impl/conn/DefaultHttpResponseParser.java
- org/apache/http/impl/auth/NegotiateScheme.java
- org/apache/http/impl/auth/HttpAuthenticator.java
- org/apache/http/client/protocol/RequestAuthenticationBase.java
- org/apache/http/client/protocol/ResponseProcessCookies.java
- org/apache/http/client/protocol/RequestAuthCache.java
- org/apache/http/client/protocol/RequestTargetAuthentication.java
- org/apache/http/client/protocol/ResponseAuthCache.java
- org/apache/http/client/protocol/RequestClientConnControl.java
- org/apache/http/client/protocol/RequestAddCookies.java
- org/apache/http/client/protocol/RequestProxyAuthentication.java
- org/apache/http/conn/ssl/AbstractVerifier.java
- com/nineoldandroids/animation/PropertyValuesHolder.java
- com/aviary/android/feather/sdk/R.java
- com/facebook/Settings.java
- com/facebook/BoltsMeasurementEventListener.java
- com/facebook/internal/FileLruCache.java
- com/facebook/internal/Utility.java
- com/facebook/internal/Logger.java
- com/facebook/internal/UrlRedirectCache.java
- com/facebook/internal/AttributionIdentifiers.java
- com/facebook/internal/ImageResponseCache.java
- com/facebook/ads/AdSettings.java
- com/facebook/ads/internal/action/d.java
- com/facebook/ads/internal/action/c.java
- com/facebook/ads/internal/util/o.java
- com/facebook/ads/internal/util/g.java
- com/facebook/ads/internal/util/k.java
- com/facebook/ads/internal/view/video/support/d.java
- com/facebook/ads/internal/view/f.java
- com/facebook/ads/internal/h.java
- com/facebook/ads/internal/adapters/BannerAdapterListener.java
- com/facebook/ads/internal/adapters/i.java
- com/facebook/ads/internal/adapters/d.java
- com/facebook/ads/internal/adapters/m.java
- com/facebook/ads/internal/adapters/InterstitialAdapterListener.java
- com/facebook/ads/internal/adapters/n.java
- com/facebook/ads/internal/f.java
- com/facebook/ads/ImpressionListener.java
- com/facebook/ads/InterstitialAd.java
- com/facebook/NativeAppCallContentProvider.java
- com/facebook/Response.java
- com/facebook/RequestAsyncTask.java
- com/facebook/Request.java
- com/facebook/SharedPreferencesTokenCachingStrategy.java
- com/facebook/LoginActivity.java
- com/facebook/Session.java
- com/facebook/AccessToken.java
- com/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment.java
- com/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment.java
- com/behance/sdk/util/BehanceSDKUrlUtil.java
- com/behance/sdk/mobeta/android/dslv/DragSortListView.java
- com/behance/sdk/services/BehanceSDKPublishWIPService.java
- com/behance/sdk/services/BehanceSDKPublishProjectService.java
- com/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask.java
- com/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask.java
- com/behance/sdk/dto/parser/BehanceUserDTOParser.java
- com/behance/sdk/managers/BehanceSDKUserManager.java
- com/behance/sdk/project/modules/CoverImage.java
- com/behance/sdk/project/modules/ImageModule.java
- com/behance/sdk/R.java
- com/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKELWFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectPreviewFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment.java
- com/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment.java
- com/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity.java
- com/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity.java
- com/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity.java
- com/behance/sdk/ui/activities/BehanceSDKLoginToTwitterActivity.java
- com/behance/sdk/ui/activities/BehanceSDKEditProfileActivity.java
- com/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity.java
- com/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity.java
- com/behance/sdk/senab/photoview/PhotoViewAttacher.java
- com/behance/sdk/logger/LoggerFactory.java
- com/behance/sdk/logger/Logger.java
- com/behance/sdk/logger/ILogger.java
- com/adobe/android/ui/view/AdobeTextView.java
- com/adobe/android/ui/view/AdobeTutorialOverlay.java
- com/adobe/android/ui/view/AdobeButton.java
- com/adobe/android/ui/widget/VibrationHelper.java
- com/adobe/android/ui/widget/RecyclerCursorAdapter.java
- com/adobe/creativesdk/aviary/internal/threading/ThreadPool.java
- com/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory.java
- com/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/util/IabHelper.java
- com/adobe/creativesdk/aviary/internal/cds/util/Security.java
- com/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper.java
- com/adobe/creativesdk/aviary/internal/cds/CdsContentValidator.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsService.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract.java
- com/adobe/creativesdk/aviary/internal/cds/CdsProvider.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper.java
- com/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDefaultContentLoader.java
- com/adobe/creativesdk/aviary/internal/cds/CdsReceiver.java
- com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns.java
- com/adobe/creativesdk/aviary/internal/cds/FeaturedColumns.java
- com/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract.java
- com/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer.java
- com/adobe/creativesdk/aviary/internal/utils/SystemUtils.java
- com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils.java
- com/adobe/creativesdk/aviary/internal/utils/DecodeUtils.java
- com/adobe/creativesdk/aviary/internal/utils/ExifUtils.java
- com/adobe/creativesdk/aviary/internal/utils/DateTimeUtils.java
- com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager.java
- com/adobe/creativesdk/aviary/internal/utils/IOUtils.java
- com/adobe/creativesdk/aviary/internal/AdobeImageEditorController.java
- com/adobe/creativesdk/aviary/internal/services/BaseContextService.java
- com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService.java
- com/adobe/creativesdk/aviary/internal/services/SessionService.java
- com/adobe/creativesdk/aviary/internal/services/ServiceLoader.java
- com/adobe/creativesdk/aviary/internal/services/MessageService.java
- com/adobe/creativesdk/aviary/internal/services/LocalDataService.java
- com/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper.java
- com/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils.java
- com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager.java
- com/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection.java
- com/adobe/creativesdk/aviary/internal/account/AdobeInventory.java
- com/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager.java
- com/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable.java
- com/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult.java
- com/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter.java
- com/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo.java
- com/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils.java
- com/adobe/creativesdk/aviary/internal/receipt/ReceiptManager.java
- com/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider.java
- com/adobe/creativesdk/aviary/internal/MonitoredActivity.java
- com/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem.java
- com/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragment.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract.java
- com/adobe/creativesdk/aviary/fragments/StoreContainerFragment.java
- com/adobe/creativesdk/aviary/utils/SharedPreferencesUtils.java
- com/adobe/creativesdk/aviary/utils/EventBusUtils.java
- com/adobe/creativesdk/aviary/utils/PackIconTransformer.java
- com/adobe/creativesdk/aviary/AdobeImageBillingService.java
- com/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment.java
- com/adobe/creativesdk/aviary/dialogs/PromoDialogFragment.java
- com/adobe/creativesdk/aviary/log/LoggerFactory.java
- com/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer.java
- com/adobe/creativesdk/aviary/graphics/CropDrawable.java
- com/adobe/creativesdk/aviary/graphics/PluginDividerDrawable.java
- com/adobe/creativesdk/aviary/AdobeImageEditorActivity.java
- com/adobe/creativesdk/aviary/overlays/StickersOverlay.java
- com/adobe/creativesdk/aviary/overlays/OverlayOverlay.java
- com/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay.java
- com/adobe/creativesdk/aviary/widget/StoreDetailLayout.java
- com/adobe/creativesdk/aviary/widget/CropImageView.java
- com/adobe/creativesdk/aviary/widget/IAPBuyButton.java
- com/adobe/creativesdk/aviary/widget/PackDetailBannerView.java
- com/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton.java
- com/adobe/creativesdk/aviary/widget/PackDetailPreviews.java
- com/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo.java
- com/adobe/creativesdk/aviary/widget/ImageViewWithIntensity.java
- com/adobe/creativesdk/aviary/widget/ImageViewOverlay.java
- com/adobe/creativesdk/aviary/widget/PackDetailLayout.java
- com/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay.java
- com/adobe/creativesdk/aviary/panels/FocusPanel.java
- com/adobe/creativesdk/aviary/panels/BordersPanel.java
- com/adobe/creativesdk/aviary/panels/AbstractPanel.java
- com/adobe/creativesdk/aviary/panels/CropPanel.java
- com/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel.java
- com/adobe/creativesdk/aviary/panels/EffectsPanel.java
- com/adobe/creativesdk/aviary/panels/StickersPanel.java
- com/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel.java
- com/adobe/creativesdk/aviary/panels/BlemishPanel.java
- com/adobe/creativesdk/aviary/panels/EnhanceEffectPanel.java
- com/adobe/creativesdk/aviary/panels/ColorSplashPanel.java
- com/adobe/creativesdk/aviary/panels/PacksListAdapter.java
- com/adobe/creativesdk/aviary/panels/OverlaysPanel.java
- com/adobe/creativesdk/aviary/panels/BackgroundDrawThread.java
- com/adobe/creativesdk/aviary/panels/NativeEffectRangePanel.java
- com/adobe/creativesdk/aviary/panels/DrawingPanel.java
- com/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService.java
- com/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask.java
- com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger.java
- com/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession.java
- com/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel.java
- com/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource.java
- com/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetVideoActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity.java
- com/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource.java
- com/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource.java
- com/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession.java
- com/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeMemCache.java
- com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance.java
- com/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession.java
- com/adobe/creativesdk/foundation/internal/auth/AuthWebViewClient.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService.java
- com/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator.java
- com/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver.java
- com/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask.java
- com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService.java
- com/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager.java
- com/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter.java
- com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession.java
- com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager.java
- com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud.java
- com/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession.java
- com/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder.java
- com/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted.java
- com/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession.java
- com/adobe/creativesdk/foundation/storage/AdobePhotoAsset.java
- com/adobe/creativesdk/foundation/storage/AdobeAssetPackage.java
- com/adobe/creativesdk/foundation/storage/AdobePhotoCatalog.java
- com/adobe/creativesdk/foundation/storage/AdobeAssetFile.java
- com/adobe/creativesdk/foundation/assets/R.java
- com/adobe/creativesdk/foundation/auth/R.java
- com/etsy/android/grid/StaggeredGridView.java
- com/etsy/android/grid/ExtendableListView.java
- com/squareup/okhttp/internal/spdy/Http20Draft14.java
- com/squareup/okhttp/internal/Internal.java
- com/squareup/okhttp/internal/Platform.java
- com/localytics/android/LocalyticsProvider.java
- com/localytics/android/LocalyticsSession.java
- com/localytics/android/AmpUploadHandler.java
- com/localytics/android/TestModeButton.java
- com/localytics/android/SessionHandler.java
- com/localytics/android/DatapointHelper.java
- com/localytics/android/AmpHelper.java
- com/localytics/android/AmpDialogFragment.java
- com/localytics/android/TestModeListView.java
- com/localytics/android/AmpSessionHandler.java
- com/localytics/android/AmpDownloader.java
- com/nostra13/universalimageloader/utils/L.java
- com/nostra13/universalimageloader/core/ImageLoaderConfiguration.java
- com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache.java
- com/dumplingsandwich/pencilsketch/activities/InfoActivity.java
- okio/Okio.java
- oauth/signpost/OAuth.java
- rx/android/app/OperatorConditionalBinding.java
- de/greenrobot/event/SubscriberMethodFinder.java
- de/greenrobot/event/BackgroundPoster.java
- de/greenrobot/event/EventBus.java
- it/sephiroth/android/library/exif2/ExifOutputStream.java
- it/sephiroth/android/library/exif2/ExifReader.java
- it/sephiroth/android/library/exif2/ExifInterface.java
- it/sephiroth/android/library/exif2/ExifParser.java
- it/sephiroth/android/library/disklrumulticache/DiskLruMultiCache.java
- it/sephiroth/android/library/picasso/BitmapHunter.java
- it/sephiroth/android/library/picasso/Utils.java
- it/sephiroth/android/library/picasso/Dispatcher.java
- it/sephiroth/android/library/picasso/PicassoExecutorService.java
- it/sephiroth/android/library/imagezoom/ImageViewTouch.java
-------------------------------------------------------------------
* Key:d_sensitive
* Security:high
* Description:Files may contain hardcoded sensitive informations like usernames, passwords, keys etc.
- org/apache/http/impl/auth/NTLMEngineImpl.java
- org/apache/http/auth/BasicUserPrincipal.java
- org/apache/http/auth/NTUserPrincipal.java
- org/apache/http/auth/NTCredentials.java
- org/apache/http/auth/UsernamePasswordCredentials.java
- com/aviary/android/feather/sdk/R.java
- com/facebook/model/JsonUtil.java
- com/facebook/SharedPreferencesTokenCachingStrategy.java
- com/facebook/Session.java
- com/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams.java
- com/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams.java
- com/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask.java
- com/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO.java
- com/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO.java
- com/behance/sdk/dto/search/BehanceSDKFeaturedDTO.java
- com/behance/sdk/dto/search/BehanceSDKUserDTO.java
- com/behance/sdk/dto/BehanceSDKSocialAccountDTO.java
- com/adobe/creativesdk/aviary/internal/tracking/TrackingUtils.java
- com/adobe/creativesdk/aviary/internal/tracking/AbstractTracker.java
- com/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser.java
- com/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser.java
- com/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser.java
- com/adobe/creativesdk/aviary/internal/cds/VersionColumns.java
- com/adobe/creativesdk/aviary/internal/cds/PacksColumns.java
- com/adobe/creativesdk/aviary/internal/cds/MessageColumns.java
- com/adobe/creativesdk/aviary/internal/utils/CredentialsUtils.java
- com/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter.java
- com/adobe/creativesdk/aviary/internal/receipt/Receipt.java
- com/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract.java
- com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic.java
- com/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditActivityConfiguration.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderMgr.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService.java
- com/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthSharedDeviceTokenAESKeyMgr.java
- com/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData.java
- com/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationDataModel.java
- com/adobe/creativesdk/foundation/storage/AdobePhotoPage.java
- com/adobe/creativesdk/foundation/AdobeCSDKFoundation.java
- com/adobe/creativesdk/foundation/assets/R.java
- com/squareup/okhttp/internal/DiskLruCache.java
- com/localytics/android/LocalyticsProvider.java
- com/localytics/android/ReferralReceiver.java
- com/localytics/android/SessionHandler.java
- com/localytics/android/AmpDialogFragment.java
- com/nostra13/universalimageloader/core/LoadAndDisplayImageTask.java
- com/nostra13/universalimageloader/core/ImageLoadingInfo.java
- com/nostra13/universalimageloader/core/DisplayBitmapTask.java
- com/nostra13/universalimageloader/core/decode/ImageDecodingInfo.java
- com/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache.java
- oauth/signpost/AbstractOAuthConsumer.java
- oauth/signpost/signature/OAuthMessageSigner.java
- it/sephiroth/android/library/picasso/BitmapHunter.java
- it/sephiroth/android/library/picasso/Request.java
- it/sephiroth/android/library/picasso/Action.java
-------------------------------------------------------------------
-------------------------------------------------------------------
* Key:d_extstorage
* Security:high
* Description:App can read/write to External Storage. Any App can read data written to External Storage.
- com/behance/sdk/fragments/headless/BehanceSDKCCBrowserHeadlessFragment.java
- com/behance/sdk/util/BehanceSDKUtils.java
- com/behance/sdk/mobeta/android/dslv/DragSortListView.java
- com/behance/sdk/project/modules/ImageModule.java
- com/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory.java
- com/adobe/creativesdk/aviary/AdobeImageEditorActivity.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment.java
- com/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity.java
- com/nostra13/universalimageloader/utils/StorageUtils.java
- com/dumplingsandwich/pencilsketch/utils/BitmapUtils.java
- com/dumplingsandwich/pencilsketch/activities/CanvasActivity.java
- com/dumplingsandwich/pencilsketch/activities/MainActivity.java
- com/dumplingsandwich/pencilsketch/activities/ImageEditingActivity.java
- it/sephiroth/android/library/disklrumulticache/DiskLruMultiCache.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
* Key:d_tmpfile
* Security:high
* Description:App creates temp file. Sensitive information should never be written into a temp file.
- com/behance/sdk/util/BehanceSDKUtils.java
- com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer.java
- com/adobe/creativesdk/aviary/AdobeImageEditorActivity.java
- com/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace.java
-------------------------------------------------------------------
* Key:d_ssl
* Security:high
* Description:Insecure Implementation of SSL. Trusting all the certificates or accepting self signed certificates is a critical Security Hole.
- org/apache/http/conn/ssl/SSLSocketFactory.java
- org/apache/http/conn/ssl/SSLConnectionSocketFactory.java
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------