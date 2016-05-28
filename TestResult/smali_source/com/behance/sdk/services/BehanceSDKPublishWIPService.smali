.class public Lcom/behance/sdk/services/BehanceSDKPublishWIPService;
.super Landroid/app/IntentService;
.source "BehanceSDKPublishWIPService.java"


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private activePublishRequestId:Ljava/lang/String;

.field private sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

.field private wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 87
    const-class v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 96
    const-string v0, "Behance Publish Work in Progress Service"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;I)I
    .registers 4
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishWIPService;
    .param p1, "x1"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    .param p2, "x2"    # I

    .prologue
    .line 83
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->convertImageUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishWIPService;
    .param p1, "x1"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;)Z
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v0

    return v0
.end method

.method private broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V
    .registers 5
    .param p1, "statusDto"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    .prologue
    .line 608
    invoke-direct {p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v1

    if-nez v1, :cond_2d

    .line 609
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-result-object v1

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    if-ne v1, v2, :cond_2e

    .line 610
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishSuccess:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceWIP:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    :cond_15
    :goto_15
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 617
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 618
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string v1, "com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 619
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 621
    .end local v0    # "broadcastIntent":Landroid/content/Intent;
    :cond_2d
    return-void

    .line 612
    :cond_2e
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-result-object v1

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    if-ne v1, v2, :cond_15

    .line 613
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishFailure:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceWIP:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15
.end method

.method private broadcastUploadCancelledStatusUpdate()V
    .registers 6

    .prologue
    .line 597
    sget-object v2, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v3, "Publish WIP cancelled. Broadcasting message"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 598
    new-instance v1, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 599
    .local v1, "statusDto":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 600
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 601
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 602
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 603
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string v2, "com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 604
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 605
    return-void
.end method

.method private cleanupCreativeCloudAsset(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 4
    .param p1, "wipImageModule"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 461
    invoke-interface {p1}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v0

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v0, v1, :cond_b

    .line 462
    invoke-interface {p1}, Lcom/behance/sdk/project/modules/ProjectModule;->deleteFromFileSystem()V

    .line 464
    :cond_b
    return-void
.end method

.method private convertImageUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;I)I
    .registers 8
    .param p1, "paramsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    .param p2, "progressPercentage"    # I

    .prologue
    .line 624
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-direct {p0, v4, p1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v3

    .line 625
    .local v3, "startPercentage":I
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-direct {p0, v4, p1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v1

    .line 626
    .local v1, "endPercentage":I
    sub-int v0, v1, v3

    .line 627
    .local v0, "availablePercentage":I
    mul-int v4, p2, v0

    div-int/lit8 v4, v4, 0x64

    add-int v2, v3, v4

    .line 628
    .local v2, "response":I
    return v2
.end method

.method private createNotifyIntent(Ljava/lang/Class;)Landroid/content/Intent;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 289
    .local p1, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 290
    .local v0, "notifyIntent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 291
    return-object v0
.end method

.method private createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;
    .registers 4
    .param p1, "notifyIntent"    # Landroid/content/Intent;

    .prologue
    .line 285
    const/4 v0, 0x0

    const/high16 v1, 0x8000000

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method private getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I
    .registers 6
    .param p1, "progressState"    # Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;
    .param p2, "paramsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    .prologue
    .line 632
    const/4 v0, 0x0

    .line 633
    .local v0, "response":I
    sget-object v1, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$2;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishWIPProgressState:[I

    invoke-virtual {p1}, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_44

    .line 670
    :goto_c
    return v0

    .line 635
    :pswitch_d
    const/16 v0, 0xa

    .line 636
    goto :goto_c

    .line 639
    :pswitch_10
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnFacebook()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 640
    const/16 v0, 0x32

    goto :goto_c

    .line 641
    :cond_1f
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnFacebook()Z

    move-result v1

    if-nez v1, :cond_2b

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 642
    :cond_2b
    const/16 v0, 0x46

    goto :goto_c

    .line 644
    :cond_2e
    const/16 v0, 0x5a

    .line 646
    goto :goto_c

    .line 650
    :pswitch_31
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 651
    const/16 v0, 0x46

    goto :goto_c

    .line 653
    :cond_3a
    const/16 v0, 0x5a

    .line 655
    goto :goto_c

    .line 659
    :pswitch_3d
    const/16 v0, 0x5a

    .line 660
    goto :goto_c

    .line 666
    :pswitch_40
    const/16 v0, 0x64

    goto :goto_c

    .line 633
    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_d
        :pswitch_10
        :pswitch_31
        :pswitch_31
        :pswitch_3d
        :pswitch_3d
        :pswitch_40
        :pswitch_40
        :pswitch_40
        :pswitch_40
    .end packed-switch
.end method

.method private handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)V
    .registers 20
    .param p1, "publishedWIP"    # Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    .param p2, "serviceParamsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    .prologue
    .line 556
    new-instance v7, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v7}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 557
    .local v7, "statusDto":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v7, v12}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 558
    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v12

    invoke-virtual {v7, v12}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 560
    :try_start_18
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 561
    .local v10, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v12, "clientId"

    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getAppClientId()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    const-string v12, "wip_id"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipId()I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    const-string v12, "wip_revision_id"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionId()I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    const-string v12, "{server_root_url}/v2/wips/{wip_id}/{wip_revision_id}?{key_client_id_param}={clientId}"

    invoke-static {v12, v10}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v9

    .line 567
    .local v9, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    invoke-virtual {v12}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v11

    .line 568
    .local v11, "userAccessToken":Ljava/lang/String;
    if-eqz v11, :cond_56

    .line 569
    const-string v12, "access_token"

    invoke-static {v9, v12, v11}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 572
    :cond_56
    new-instance v4, Lorg/apache/http/client/methods/HttpDelete;

    invoke-direct {v4, v9}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    .line 573
    .local v4, "httpDelete":Lorg/apache/http/client/methods/HttpDelete;
    sget-object v12, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v13, "Publish WIP cancelled after successful upload. Deleting WIP [URL - %s]"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v9, v14, v15

    invoke-interface {v12, v13, v14}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 575
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v3

    .line 576
    .local v3, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v3, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 577
    .local v5, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    .line 578
    .local v8, "statusLine":Lorg/apache/http/StatusLine;
    sget-object v12, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v13, "Delete WIP Revision HTTP response code - %s"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-interface {v12, v13, v14}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 579
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v6

    .line 580
    .local v6, "jsonResponseString":Ljava/lang/String;
    sget-object v12, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v13, "Delete WIP Revision server response - %s"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v6, v14, v15

    invoke-interface {v12, v13, v14}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 581
    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_bf

    .line 582
    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v7, v12}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V
    :try_end_ab
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_ab} :catch_c5

    .line 591
    .end local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v4    # "httpDelete":Lorg/apache/http/client/methods/HttpDelete;
    .end local v5    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v6    # "jsonResponseString":Ljava/lang/String;
    .end local v8    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v9    # "url":Ljava/lang/String;
    .end local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "userAccessToken":Ljava/lang/String;
    :goto_ab
    new-instance v1, Landroid/content/Intent;

    const-string v12, "com.behance.sdk.INTENT_ACTION_WIP_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v1, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 592
    .local v1, "broadcastIntent":Landroid/content/Intent;
    const-string v12, "com.behance.sdk.INTENT_EXTRA_KEY_WIP_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v1, v12, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 593
    invoke-static/range {p0 .. p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v12

    invoke-virtual {v12, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 594
    return-void

    .line 584
    .end local v1    # "broadcastIntent":Landroid/content/Intent;
    .restart local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpDelete":Lorg/apache/http/client/methods/HttpDelete;
    .restart local v5    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v6    # "jsonResponseString":Ljava/lang/String;
    .restart local v8    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v9    # "url":Ljava/lang/String;
    .restart local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "userAccessToken":Ljava/lang/String;
    :cond_bf
    :try_start_bf
    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v7, v12}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V
    :try_end_c4
    .catch Ljava/lang/Throwable; {:try_start_bf .. :try_end_c4} :catch_c5

    goto :goto_ab

    .line 586
    .end local v3    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v4    # "httpDelete":Lorg/apache/http/client/methods/HttpDelete;
    .end local v5    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v6    # "jsonResponseString":Ljava/lang/String;
    .end local v8    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v9    # "url":Ljava/lang/String;
    .end local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "userAccessToken":Ljava/lang/String;
    :catch_c5
    move-exception v2

    .line 587
    .local v2, "e":Ljava/lang/Throwable;
    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v7, v12}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 588
    invoke-virtual {v7, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setException(Ljava/lang/Throwable;)V

    .line 589
    sget-object v12, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v13, "Problem deleting WIP Revision"

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-interface {v12, v2, v13, v14}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_ab
.end method

.method private isActiveUploadCancelled()Z
    .registers 3

    .prologue
    .line 113
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    if-eqz v0, :cond_d

    .line 114
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;->isUploadCancelled(Ljava/lang/String;)Z

    move-result v0

    .line 116
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private publishOnFacebook(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    .registers 18
    .param p1, "wipTitle"    # Ljava/lang/String;
    .param p2, "wipRevisionDescription"    # Ljava/lang/String;
    .param p3, "wipRevisionUrl"    # Ljava/lang/String;
    .param p4, "wipImageURL"    # Ljava/lang/String;

    .prologue
    .line 467
    new-instance v10, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 469
    .local v10, "statusDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :try_start_5
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    .line 470
    .local v2, "session":Lcom/facebook/Session;
    if-eqz v2, :cond_73

    .line 471
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 472
    .local v4, "postParams":Landroid/os/Bundle;
    const-string v3, "name"

    invoke-virtual {v4, v3, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    const-string v3, "link"

    move-object/from16 v0, p3

    invoke-virtual {v4, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    if-eqz p4, :cond_2b

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2b

    .line 475
    const-string v3, "picture"

    move-object/from16 v0, p4

    invoke-virtual {v4, v3, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    :cond_2b
    invoke-direct {p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v3

    if-nez v3, :cond_73

    .line 478
    new-instance v1, Lcom/facebook/Request;

    const-string v3, "me/feed"

    sget-object v5, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .line 479
    .local v1, "request":Lcom/facebook/Request;
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAndWait()Lcom/facebook/Response;

    move-result-object v9

    .line 480
    .local v9, "response":Lcom/facebook/Response;
    invoke-virtual {v9}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v8

    .line 481
    .local v8, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v8, :cond_74

    .line 484
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing WIP on Facebook [Message - %s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v8}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v6, v11

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 485
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing WIP on Facebook [Message - %s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v8}, Lcom/facebook/FacebookRequestError;->getErrorUserMessage()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v6, v11

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 486
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v10, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 487
    invoke-virtual {v8}, Lcom/facebook/FacebookRequestError;->getErrorUserMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V

    .line 500
    .end local v1    # "request":Lcom/facebook/Request;
    .end local v2    # "session":Lcom/facebook/Session;
    .end local v4    # "postParams":Landroid/os/Bundle;
    .end local v8    # "error":Lcom/facebook/FacebookRequestError;
    .end local v9    # "response":Lcom/facebook/Response;
    :cond_73
    :goto_73
    return-object v10

    .line 489
    .restart local v1    # "request":Lcom/facebook/Request;
    .restart local v2    # "session":Lcom/facebook/Session;
    .restart local v4    # "postParams":Landroid/os/Bundle;
    .restart local v8    # "error":Lcom/facebook/FacebookRequestError;
    .restart local v9    # "response":Lcom/facebook/Response;
    :cond_74
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Successfully shared WIP on Facebook"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 490
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v10, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V
    :try_end_83
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_83} :catch_84

    goto :goto_73

    .line 494
    .end local v1    # "request":Lcom/facebook/Request;
    .end local v2    # "session":Lcom/facebook/Session;
    .end local v4    # "postParams":Landroid/os/Bundle;
    .end local v8    # "error":Lcom/facebook/FacebookRequestError;
    .end local v9    # "response":Lcom/facebook/Response;
    :catch_84
    move-exception v7

    .line 495
    .local v7, "e":Ljava/lang/Throwable;
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing WIP on Facebook"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v3, v7, v5, v6}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 496
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v10, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 497
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V

    .line 498
    invoke-virtual {v10, v7}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto :goto_73
.end method

.method private publishOnTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    .registers 24
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "accessTokenSecret"    # Ljava/lang/String;
    .param p3, "consumerKey"    # Ljava/lang/String;
    .param p4, "consumerSecret"    # Ljava/lang/String;
    .param p5, "WIPRevisionURL"    # Ljava/lang/String;

    .prologue
    .line 504
    new-instance v11, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v11}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 507
    .local v11, "statusDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :try_start_5
    new-instance v3, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {v3, v0, v1}, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    .local v3, "consumer":Loauth/signpost/OAuthConsumer;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v3, v0, v1}, Loauth/signpost/OAuthConsumer;->setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    sget v13, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_publish_on_twitter_msg:I

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object p5, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 510
    .local v7, "queryString":Ljava/lang/String;
    const-string v13, "UTF-8"

    invoke-static {v7, v13}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 511
    .local v5, "encodedQueryString":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "https://api.twitter.com/1.1/statuses/update.json?status="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 513
    .local v6, "finalURL":Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v13

    if-nez v13, :cond_85

    .line 514
    new-instance v12, Ljava/net/URI;

    invoke-direct {v12, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 515
    .local v12, "updateURI":Ljava/net/URI;
    new-instance v8, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v8, v12}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    .line 516
    .local v8, "request":Lorg/apache/http/client/methods/HttpPost;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Share on Twitter URL is [URL - %s]"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v12}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 517
    invoke-interface {v3, v8}, Loauth/signpost/OAuthConsumer;->sign(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;

    .line 519
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 520
    .local v2, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v2, v8}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    .line 522
    .local v9, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v10

    .line 523
    .local v10, "statusCode":I
    const/16 v13, 0xc8

    if-ne v10, v13, :cond_86

    .line 524
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Successfully shared WIP on Twitter"

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 525
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 544
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .end local v5    # "encodedQueryString":Ljava/lang/String;
    .end local v6    # "finalURL":Ljava/lang/String;
    .end local v7    # "queryString":Ljava/lang/String;
    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    .end local v10    # "statusCode":I
    .end local v12    # "updateURI":Ljava/net/URI;
    :cond_85
    :goto_85
    return-object v11

    .line 526
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .restart local v5    # "encodedQueryString":Ljava/lang/String;
    .restart local v6    # "finalURL":Ljava/lang/String;
    .restart local v7    # "queryString":Ljava/lang/String;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v9    # "response":Lorg/apache/http/HttpResponse;
    .restart local v10    # "statusCode":I
    .restart local v12    # "updateURI":Ljava/net/URI;
    :cond_86
    const/16 v13, 0x191

    if-ne v10, v13, :cond_d7

    .line 527
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Twitter User token has been revoked. [Error code - %s - message - %s]"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v17

    .line 528
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    .line 527
    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 529
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->unlinkTwitterAccount()V

    .line 530
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 531
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V
    :try_end_bb
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_bb} :catch_bc

    goto :goto_85

    .line 538
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .end local v5    # "encodedQueryString":Ljava/lang/String;
    .end local v6    # "finalURL":Ljava/lang/String;
    .end local v7    # "queryString":Ljava/lang/String;
    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    .end local v10    # "statusCode":I
    .end local v12    # "updateURI":Ljava/net/URI;
    :catch_bc
    move-exception v4

    .line 539
    .local v4, "e":Ljava/lang/Throwable;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Error sharing WIP on Twitter"

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-interface {v13, v4, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 540
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 541
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V

    .line 542
    invoke-virtual {v11, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto :goto_85

    .line 533
    .end local v4    # "e":Ljava/lang/Throwable;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .restart local v5    # "encodedQueryString":Ljava/lang/String;
    .restart local v6    # "finalURL":Ljava/lang/String;
    .restart local v7    # "queryString":Ljava/lang/String;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v9    # "response":Lorg/apache/http/HttpResponse;
    .restart local v10    # "statusCode":I
    .restart local v12    # "updateURI":Ljava/net/URI;
    :cond_d7
    :try_start_d7
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Error sharing WIP on Twitter. [Error code - %s - message - %s]"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 534
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 535
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V
    :try_end_105
    .catch Ljava/lang/Throwable; {:try_start_d7 .. :try_end_105} :catch_bc

    goto :goto_85
.end method

.method private publishWIPOnServer(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
    .registers 39
    .param p1, "serviceParamsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    .prologue
    .line 295
    new-instance v20, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;

    invoke-direct/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;-><init>()V

    .line 296
    .local v20, "result":Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipImageFile()Lcom/behance/sdk/project/modules/ProjectModule;

    move-result-object v30

    .line 298
    .local v30, "wipImageModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :try_start_9
    new-instance v28, Ljava/util/HashMap;

    invoke-direct/range {v28 .. v28}, Ljava/util/HashMap;-><init>()V

    .line 299
    .local v28, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v32, "clientId"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getAppClientId()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipId()I

    move-result v32

    if-lez v32, :cond_201

    .line 303
    const-string v32, "wip_id"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipId()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    const-string v32, "{server_root_url}/v2/wips/{wip_id}?{key_client_id_param}={clientId}"

    move-object/from16 v0, v32

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v27

    .line 309
    .local v27, "url":Ljava/lang/String;
    :goto_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v29

    .line 310
    .local v29, "userAccessToken":Ljava/lang/String;
    if-eqz v29, :cond_58

    .line 311
    const-string v32, "access_token"

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    .line 314
    :cond_58
    new-instance v10, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v27

    invoke-direct {v10, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 316
    .local v10, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v17

    .line 317
    .local v17, "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    const-string v32, "text/plain"

    const-string v33, "UTF-8"

    invoke-static/range {v32 .. v33}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v26

    .line 318
    .local v26, "textContentType":Lorg/apache/http/entity/ContentType;
    sget-object v32, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 319
    const-string v32, "image"

    new-instance v33, Lorg/apache/http/entity/mime/content/FileBody;

    invoke-interface/range {v30 .. v30}, Lcom/behance/sdk/project/modules/ProjectModule;->getFile()Ljava/io/File;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 320
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v32

    if-eqz v32, :cond_a3

    .line 321
    const-string v32, "title"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 323
    :cond_a3
    const-string v32, "description"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 324
    const-string v32, "tags"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTags()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 325
    const-string v33, "mature"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isContainsAdultContent()Z

    move-result v32

    if-eqz v32, :cond_20d

    const-string v32, "1"

    :goto_cf
    move-object/from16 v0, v17

    move-object/from16 v1, v33

    move-object/from16 v2, v32

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 326
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 327
    .local v8, "entity":Lorg/apache/http/HttpEntity;
    new-instance v6, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v6, v0, v1, v10}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService$1;-><init>(Lcom/behance/sdk/services/BehanceSDKPublishWIPService;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;Lorg/apache/http/client/methods/HttpPost;)V

    .line 351
    .local v6, "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    new-instance v32, Lcom/behance/sdk/util/CustomHttpEntityWrapper;

    move-object/from16 v0, v32

    invoke-direct {v0, v8, v6}, Lcom/behance/sdk/util/CustomHttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;)V

    move-object/from16 v0, v32

    invoke-virtual {v10, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 353
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v9

    .line 354
    .local v9, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v32

    if-nez v32, :cond_1f9

    .line 355
    invoke-interface {v9, v10}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 357
    .local v11, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v25

    .line 358
    .local v25, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v13

    .line 359
    .local v13, "jsonResponseString":Ljava/lang/String;
    sget-object v32, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v33, "Publish WIP json response [%s]"

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object v13, v34, v35

    invoke-interface/range {v32 .. v34}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 361
    invoke-interface/range {v25 .. v25}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v32

    const/16 v33, 0xc9

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_2cd

    .line 362
    sget-object v32, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setStatus(Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;)V

    .line 365
    new-instance v18, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

    invoke-direct/range {v18 .. v18}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;-><init>()V

    .line 367
    .local v18, "publishedWIPDTO":Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    new-instance v24, Lorg/json/JSONObject;

    move-object/from16 v0, v24

    invoke-direct {v0, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 369
    .local v24, "rootJsonObject":Lorg/json/JSONObject;
    const-string v32, "wip"

    move-object/from16 v0, v24

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v31

    .line 370
    .local v31, "wipJSONObject":Lorg/json/JSONObject;
    if-eqz v31, :cond_215

    .line 372
    const-string v32, "title"

    invoke-virtual/range {v31 .. v32}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipTitle(Ljava/lang/String;)V

    .line 375
    const-string v32, "revisions"

    invoke-virtual/range {v31 .. v32}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v23

    .line 376
    .local v23, "revisionsJsonObject":Lorg/json/JSONObject;
    if-eqz v23, :cond_1f2

    .line 377
    invoke-virtual/range {v23 .. v23}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v21

    .line 378
    .local v21, "revisionIDsJsonArray":Lorg/json/JSONArray;
    if-eqz v21, :cond_1f2

    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_1f2

    .line 379
    const/4 v5, 0x0

    .local v5, "counter2":I
    :goto_16f
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONArray;->length()I

    move-result v32

    move/from16 v0, v32

    if-ge v5, v0, :cond_1f2

    .line 380
    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v23

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v22

    .line 381
    .local v22, "revisionJsonObject":Lorg/json/JSONObject;
    if-eqz v22, :cond_211

    .line 382
    const-string v32, "id"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v32

    move-object/from16 v0, v18

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionId(I)V

    .line 383
    const-string v32, "url"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionURL(Ljava/lang/String;)V

    .line 384
    const-string v32, "description"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionDescription(Ljava/lang/String;)V

    .line 387
    const-string v32, "wip_id"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v32

    move-object/from16 v0, v18

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipId(I)V

    .line 388
    const-string v32, "images"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 389
    .local v12, "imagesJsonObject":Lorg/json/JSONObject;
    if-eqz v12, :cond_1f2

    .line 390
    const-string v32, "normal_resolution"

    move-object/from16 v0, v32

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v19

    .line 391
    .local v19, "resolutionJsonObject":Lorg/json/JSONObject;
    if-eqz v19, :cond_1f2

    .line 392
    const-string v32, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipImageURL(Ljava/lang/String;)V

    .line 403
    .end local v5    # "counter2":I
    .end local v12    # "imagesJsonObject":Lorg/json/JSONObject;
    .end local v19    # "resolutionJsonObject":Lorg/json/JSONObject;
    .end local v21    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .end local v22    # "revisionJsonObject":Lorg/json/JSONObject;
    :cond_1f2
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setPublishedWIP(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;)V

    .line 444
    .end local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v18    # "publishedWIPDTO":Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    .end local v23    # "revisionsJsonObject":Lorg/json/JSONObject;
    .end local v24    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v31    # "wipJSONObject":Lorg/json/JSONObject;
    :cond_1f9
    :goto_1f9
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->cleanupCreativeCloudAsset(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 457
    .end local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .end local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v27    # "url":Ljava/lang/String;
    .end local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v29    # "userAccessToken":Ljava/lang/String;
    :goto_200
    return-object v20

    .line 306
    .restart local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_201
    const-string v32, "{server_root_url}/v2/wips/?{key_client_id_param}={clientId}"

    move-object/from16 v0, v32

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "url":Ljava/lang/String;
    goto/16 :goto_40

    .line 325
    .restart local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v29    # "userAccessToken":Ljava/lang/String;
    :cond_20d
    const-string v32, "0"

    goto/16 :goto_cf

    .line 379
    .restart local v5    # "counter2":I
    .restart local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v18    # "publishedWIPDTO":Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    .restart local v21    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .restart local v22    # "revisionJsonObject":Lorg/json/JSONObject;
    .restart local v23    # "revisionsJsonObject":Lorg/json/JSONObject;
    .restart local v24    # "rootJsonObject":Lorg/json/JSONObject;
    .restart local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v31    # "wipJSONObject":Lorg/json/JSONObject;
    :cond_211
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_16f

    .line 407
    .end local v5    # "counter2":I
    .end local v21    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .end local v22    # "revisionJsonObject":Lorg/json/JSONObject;
    .end local v23    # "revisionsJsonObject":Lorg/json/JSONObject;
    :cond_215
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipTitle(Ljava/lang/String;)V

    .line 408
    const-string v32, "revision"

    move-object/from16 v0, v24

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v22

    .line 409
    .restart local v22    # "revisionJsonObject":Lorg/json/JSONObject;
    if-eqz v22, :cond_1f9

    .line 410
    const-string v32, "id"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v32

    move-object/from16 v0, v18

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionId(I)V

    .line 411
    const-string v32, "url"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionURL(Ljava/lang/String;)V

    .line 412
    const-string v32, "description"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setRevisionDescription(Ljava/lang/String;)V

    .line 415
    const-string v32, "wip_id"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v32

    move-object/from16 v0, v18

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipId(I)V

    .line 416
    const-string v32, "images"

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 417
    .restart local v12    # "imagesJsonObject":Lorg/json/JSONObject;
    if-eqz v12, :cond_297

    .line 418
    const-string v32, "normal_resolution"

    move-object/from16 v0, v32

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v19

    .line 419
    .restart local v19    # "resolutionJsonObject":Lorg/json/JSONObject;
    if-eqz v19, :cond_297

    .line 420
    const-string v32, "url"

    move-object/from16 v0, v19

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v18

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->setWipImageURL(Ljava/lang/String;)V

    .line 424
    .end local v19    # "resolutionJsonObject":Lorg/json/JSONObject;
    :cond_297
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setPublishedWIP(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;)V
    :try_end_29e
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_29e} :catch_2a0
    .catch Ljava/lang/Error; {:try_start_9 .. :try_end_29e} :catch_334

    goto/16 :goto_1f9

    .line 446
    .end local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .end local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v12    # "imagesJsonObject":Lorg/json/JSONObject;
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v18    # "publishedWIPDTO":Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    .end local v22    # "revisionJsonObject":Lorg/json/JSONObject;
    .end local v24    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v27    # "url":Ljava/lang/String;
    .end local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v29    # "userAccessToken":Ljava/lang/String;
    .end local v31    # "wipJSONObject":Lorg/json/JSONObject;
    :catch_2a0
    move-exception v7

    .line 447
    .local v7, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->cleanupCreativeCloudAsset(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 448
    sget-object v32, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setStatus(Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;)V

    .line 449
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setException(Ljava/lang/Exception;)V

    .line 450
    sget-object v32, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v33, "Problem publishing WIP"

    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-interface {v0, v7, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_200

    .line 428
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v27    # "url":Ljava/lang/String;
    .restart local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v29    # "userAccessToken":Ljava/lang/String;
    :cond_2cd
    :try_start_2cd
    sget-object v32, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setStatus(Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;)V

    .line 429
    new-instance v24, Lorg/json/JSONObject;

    move-object/from16 v0, v24

    invoke-direct {v0, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 430
    .restart local v24    # "rootJsonObject":Lorg/json/JSONObject;
    const-string v32, "messages"

    move-object/from16 v0, v24

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v16

    .line 431
    .local v16, "messagesJSONArray":Lorg/json/JSONArray;
    if-eqz v16, :cond_1f9

    .line 432
    const/4 v4, 0x0

    .local v4, "counter":I
    :goto_2ea
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONArray;->length()I

    move-result v32

    move/from16 v0, v32

    if-ge v4, v0, :cond_1f9

    .line 433
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 434
    .local v14, "messageJsonObject":Lorg/json/JSONObject;
    const-string v32, "type"

    move-object/from16 v0, v32

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 435
    .local v15, "messageType":Ljava/lang/String;
    if-eqz v15, :cond_36a

    const-string v32, "error"

    move-object/from16 v0, v32

    invoke-virtual {v15, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_36a

    .line 436
    const-string v32, "message"

    move-object/from16 v0, v32

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setReasonPhrase(Ljava/lang/String;)V

    .line 437
    sget-object v32, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v33, "Problem publishing WIP. Response from server [%s]"

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getReasonPhrase()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    invoke-interface/range {v32 .. v34}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_332
    .catch Ljava/lang/Exception; {:try_start_2cd .. :try_end_332} :catch_2a0
    .catch Ljava/lang/Error; {:try_start_2cd .. :try_end_332} :catch_334

    goto/16 :goto_1f9

    .line 451
    .end local v4    # "counter":I
    .end local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .end local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v14    # "messageJsonObject":Lorg/json/JSONObject;
    .end local v15    # "messageType":Ljava/lang/String;
    .end local v16    # "messagesJSONArray":Lorg/json/JSONArray;
    .end local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v24    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v27    # "url":Ljava/lang/String;
    .end local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v29    # "userAccessToken":Ljava/lang/String;
    :catch_334
    move-exception v7

    .line 452
    .local v7, "e":Ljava/lang/Error;
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->cleanupCreativeCloudAsset(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 453
    sget-object v32, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setStatus(Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;)V

    .line 454
    new-instance v32, Ljava/lang/Exception;

    move-object/from16 v0, v32

    invoke-direct {v0, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->setException(Ljava/lang/Exception;)V

    .line 455
    sget-object v32, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v33, "Problem publishing WIP"

    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v34

    invoke-interface {v0, v7, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_200

    .line 432
    .end local v7    # "e":Ljava/lang/Error;
    .restart local v4    # "counter":I
    .restart local v6    # "customHttpEntityWrapperCallback":Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v9    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v10    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v14    # "messageJsonObject":Lorg/json/JSONObject;
    .restart local v15    # "messageType":Ljava/lang/String;
    .restart local v16    # "messagesJSONArray":Lorg/json/JSONArray;
    .restart local v17    # "multipartEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v24    # "rootJsonObject":Lorg/json/JSONObject;
    .restart local v25    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v26    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v27    # "url":Ljava/lang/String;
    .restart local v28    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v29    # "userAccessToken":Ljava/lang/String;
    :cond_36a
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2ea
.end method

.method private unlinkTwitterAccount()V
    .registers 4

    .prologue
    .line 548
    invoke-static {p0}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v0

    .line 549
    .local v0, "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v1

    .line 550
    .local v1, "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v1, :cond_11

    .line 551
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    .line 553
    :cond_11
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    if-nez v0, :cond_b

    .line 102
    new-instance v0, Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    invoke-direct {v0}, Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    .line 104
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    return-object v0
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 280
    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    .line 281
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->wipBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;

    .line 282
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 29
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->activePublishRequestId:Ljava/lang/String;

    .line 125
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    .line 127
    new-instance v12, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 128
    .local v12, "mBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget v4, Lcom/behance/sdk/R$drawable;->bsdk_anim_list_publish_in_progress_indicator:I

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 129
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_in_progress_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 130
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_in_progress_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 131
    new-instance v4, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    sget v5, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_in_progress_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 132
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v12, v4, v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 133
    invoke-virtual {v12}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v15

    .line 134
    .local v15, "notification":Landroid/app/Notification;
    const/16 v4, 0x3e9

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v15}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->startForeground(ILandroid/app/Notification;)V

    .line 136
    const-string v4, "INTENT_EXTRA_PARAMS"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v18

    .line 137
    .local v18, "params":Ljava/io/Serializable;
    move-object/from16 v0, v18

    instance-of v4, v0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    if-eqz v4, :cond_7f

    move-object/from16 v24, v18

    .line 138
    check-cast v24, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    .line 140
    .local v24, "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-eqz v4, :cond_80

    .line 141
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipImageFile()Lcom/behance/sdk/project/modules/ProjectModule;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->cleanupCreativeCloudAsset(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 142
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastUploadCancelledStatusUpdate()V

    .line 276
    .end local v24    # "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    :cond_7f
    :goto_7f
    return-void

    .line 146
    .restart local v24    # "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    :cond_80
    new-instance v19, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct/range {v19 .. v19}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 147
    .local v19, "publishStartBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 148
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 149
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    .line 150
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->publishWIPOnServer(Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;

    move-result-object v20

    .line 153
    .local v20, "publishWIPResult":Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getPublishedWIP()Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

    move-result-object v21

    .line 154
    .local v21, "publishedWIP":Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getNotificationHandlerActivity()Ljava/lang/Class;

    move-result-object v16

    .line 156
    .local v16, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    new-instance v26, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct/range {v26 .. v26}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 158
    .local v26, "wipPublishBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    if-eqz v21, :cond_2b6

    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getStatus()Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-result-object v4

    sget-object v5, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    if-ne v4, v5, :cond_2b6

    .line 160
    new-instance v11, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    invoke-direct {v11}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;-><init>()V

    .line 161
    .local v11, "imageUploadBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    invoke-virtual {v11, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 162
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->IMAGE_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    invoke-virtual {v11, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 163
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    .line 165
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-nez v4, :cond_134

    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnFacebook()Z

    move-result v4

    if-eqz v4, :cond_134

    .line 166
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v6

    .line 167
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipImageURL()Ljava/lang/String;

    move-result-object v7

    .line 166
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v6, v7}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->publishOnFacebook(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    move-result-object v10

    .line 168
    .local v10, "facebookBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionUrl(Ljava/lang/String;)V

    .line 169
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipId()I

    move-result v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipId(I)V

    .line 170
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionDescription(Ljava/lang/String;)V

    .line 171
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionId()I

    move-result v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionId(I)V

    .line 172
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipTitle(Ljava/lang/String;)V

    .line 173
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    invoke-virtual {v10, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 174
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    .line 177
    .end local v10    # "facebookBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :cond_134
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-nez v4, :cond_19d

    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->isShareOnTwitter()Z

    move-result v4

    if-eqz v4, :cond_19d

    .line 178
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getTwitterUserAccessToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getTwitterUserAccessTokenSecret()Ljava/lang/String;

    move-result-object v6

    .line 179
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getTwitterConsumerSecret()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v4, p0

    .line 178
    invoke-direct/range {v4 .. v9}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->publishOnTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;

    move-result-object v25

    .line 180
    .local v25, "twitterBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionUrl(Ljava/lang/String;)V

    .line 181
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipId()I

    move-result v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipId(I)V

    .line 182
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionDescription(Ljava/lang/String;)V

    .line 183
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionId()I

    move-result v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionId(I)V

    .line 184
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipTitle(Ljava/lang/String;)V

    .line 185
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 186
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    .line 189
    .end local v25    # "twitterBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :cond_19d
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-eqz v4, :cond_1ae

    .line 190
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)V

    goto/16 :goto_7f

    .line 193
    :cond_1ae
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_success_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 194
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_success_notification_ticker:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 195
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_success_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 196
    new-instance v4, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    sget v5, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_success_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 198
    if-eqz v16, :cond_239

    .line 199
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->createNotifyIntent(Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v17

    .line 200
    .local v17, "notifyIntent":Landroid/content/Intent;
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_BOOL_EXTRA_PUBLISHED_WIP_SUCCESSFULLY"

    const/4 v5, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 201
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_INT_EXTRA_PUBLISHED_WIP_ID"

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipId()I

    move-result v5

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 202
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_TITLE"

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_INT_EXTRA_PUBLISHED_WIP_REVISION_ID"

    .line 204
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionId()I

    move-result v5

    .line 203
    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 205
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_DESC"

    .line 206
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionDescription()Ljava/lang/String;

    move-result-object v5

    .line 205
    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 207
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_URL"

    .line 208
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v5

    .line 207
    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 209
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v23

    .line 211
    .local v23, "resultPendingIntent":Landroid/app/PendingIntent;
    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 214
    .end local v17    # "notifyIntent":Landroid/content/Intent;
    .end local v23    # "resultPendingIntent":Landroid/app/PendingIntent;
    :cond_239
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 215
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 216
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionURL()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionUrl(Ljava/lang/String;)V

    .line 217
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipId()I

    move-result v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipId(I)V

    .line 218
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionDescription(Ljava/lang/String;)V

    .line 219
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getRevisionId()I

    move-result v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionId(I)V

    .line 220
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipTitle(Ljava/lang/String;)V

    .line 221
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;->getWipImageURL()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionImageUrl(Ljava/lang/String;)V

    .line 260
    .end local v11    # "imageUploadBroadcastDTO":Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
    :goto_285
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-nez v4, :cond_37c

    .line 261
    sget v4, Lcom/behance/sdk/R$drawable;->bsdk_icon_notification_publish_progress:I

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 262
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v12, v4, v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 263
    const/4 v4, 0x1

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 264
    invoke-virtual {v12}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v15

    .line 265
    const-string v4, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/NotificationManager;

    .line 266
    .local v13, "mNotificationManager":Landroid/app/NotificationManager;
    const/16 v4, 0x3ea

    invoke-virtual {v13, v4, v15}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 267
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastStatusUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;)V

    goto/16 :goto_7f

    .line 223
    .end local v13    # "mNotificationManager":Landroid/app/NotificationManager;
    :cond_2b6
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->isActiveUploadCancelled()Z

    move-result v4

    if-eqz v4, :cond_2c1

    .line 224
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastUploadCancelledStatusUpdate()V

    goto/16 :goto_7f

    .line 227
    :cond_2c1
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_failure_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 228
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_failure_notification_ticker:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 229
    const-string v14, ""

    .line 230
    .local v14, "msgToDisplay":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getReasonPhrase()Ljava/lang/String;

    move-result-object v22

    .line 231
    .local v22, "reasonPhrase":Ljava/lang/String;
    if-eqz v22, :cond_372

    .line 232
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_failure_notification_msg:I

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v22, v5, v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 236
    :goto_2ed
    invoke-virtual {v12, v14}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 237
    new-instance v4, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v4, v14}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v4

    invoke-virtual {v12, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 239
    if-eqz v16, :cond_338

    .line 240
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->createNotifyIntent(Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v17

    .line 241
    .restart local v17    # "notifyIntent":Landroid/content/Intent;
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_BOOL_EXTRA_PUBLISHED_WIP_SUCCESSFULLY"

    const/4 v5, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 242
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_TITLE"

    .line 243
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v5

    .line 242
    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISHED_WIP_REVISION_DESC"

    .line 245
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v5

    .line 244
    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    const-string v4, "BEHANCE_SDK_PUBLISH_WIP_INTENT_STR_EXTRA_PUBLISH_WIP_FAILURE_MSG"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v23

    .line 249
    .restart local v23    # "resultPendingIntent":Landroid/app/PendingIntent;
    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 252
    .end local v17    # "notifyIntent":Landroid/content/Intent;
    .end local v23    # "resultPendingIntent":Landroid/app/PendingIntent;
    :cond_338
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V

    .line 253
    sget-object v4, Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)I

    move-result v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setProgressPercentage(I)V

    .line 254
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipDescription()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipRevisionDescription(Ljava/lang/String;)V

    .line 255
    invoke-virtual/range {v24 .. v24}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setWipTitle(Ljava/lang/String;)V

    .line 256
    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setErrorMessage(Ljava/lang/String;)V

    .line 257
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getException()Ljava/lang/Exception;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto/16 :goto_285

    .line 234
    :cond_372
    sget v4, Lcom/behance/sdk/R$string;->bsdk_publish_wip_service_unknown_failure_notification_msg:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->getString(I)Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_2ed

    .line 269
    .end local v14    # "msgToDisplay":Ljava/lang/String;
    .end local v22    # "reasonPhrase":Ljava/lang/String;
    :cond_37c
    if-eqz v21, :cond_391

    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->getStatus()Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    move-result-object v4

    sget-object v5, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    if-ne v4, v5, :cond_391

    .line 270
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;)V

    goto/16 :goto_7f

    .line 272
    :cond_391
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;->broadcastUploadCancelledStatusUpdate()V

    goto/16 :goto_7f
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 109
    invoke-super {p0, p1}, Landroid/app/IntentService;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
