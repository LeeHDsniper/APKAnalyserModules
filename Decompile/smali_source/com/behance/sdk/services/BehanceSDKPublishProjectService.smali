.class public Lcom/behance/sdk/services/BehanceSDKPublishProjectService;
.super Landroid/app/IntentService;
.source "BehanceSDKPublishProjectService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private activePublishRequestId:Ljava/lang/String;

.field private projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

.field private sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 88
    const-class v0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 112
    const-string v0, "Behance Publish Project Service"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;II)I
    .registers 5
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishProjectService;
    .param p1, "x1"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->convertModuleUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;II)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishProjectService;
    .param p1, "x1"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    return-void
.end method

.method static synthetic access$300(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;)Z
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v0

    return v0
.end method

.method private broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V
    .registers 5
    .param p1, "statusDto"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .prologue
    .line 592
    invoke-direct {p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v1

    if-nez v1, :cond_2d

    .line 594
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-result-object v1

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    if-ne v1, v2, :cond_2e

    .line 595
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishSuccess:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceProject:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 601
    :cond_15
    :goto_15
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 602
    .local v0, "localIntent":Landroid/content/Intent;
    const-string v1, "com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 603
    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 606
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 608
    .end local v0    # "localIntent":Landroid/content/Intent;
    :cond_2d
    return-void

    .line 597
    :cond_2e
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-result-object v1

    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    if-ne v1, v2, :cond_15

    .line 598
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishFailure:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceProject:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15
.end method

.method private broadcastUploadCancelledStatusUpdate()V
    .registers 6

    .prologue
    .line 581
    sget-object v2, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v3, "Publish Project cancelled. Broadcasting message"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 582
    new-instance v1, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;-><init>()V

    .line 583
    .local v1, "statusDto":Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    iget-object v2, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 584
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 585
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 586
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 587
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string v2, "com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 588
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 589
    return-void
.end method

.method private cleanupCreativeCloudResources(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 484
    .local p1, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 485
    .local v0, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-interface {v0}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v2

    sget-object v3, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v2, v3, :cond_4

    .line 486
    invoke-interface {v0}, Lcom/behance/sdk/project/modules/ProjectModule;->deleteFromFileSystem()V

    goto :goto_4

    .line 489
    .end local v0    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_1c
    return-void
.end method

.method private convertModuleUploadProgressPercentage(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;II)I
    .registers 11
    .param p1, "paramsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p2, "uploadedModuleCount"    # I
    .param p3, "moduleProgressPercentage"    # I

    .prologue
    .line 659
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PROJECT_DRAFT_CREATION_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-direct {p0, v5, p1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v4

    .line 660
    .local v4, "startPercentage":I
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->MODULES_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-direct {p0, v5, p1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v2

    .line 661
    .local v2, "endPercentage":I
    sub-int v1, v2, v4

    .line 662
    .local v1, "availablePercentage":I
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectModules()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    div-int v0, v1, v5

    .line 663
    .local v0, "availablePercentPerModule":I
    add-int/lit8 v5, p2, -0x1

    mul-int/2addr v5, v0

    add-int/2addr v5, v4

    mul-int v6, p3, v0

    div-int/lit8 v6, v6, 0x64

    add-int v3, v5, v6

    .line 665
    .local v3, "response":I
    return v3
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
    .line 255
    .local p1, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 256
    .local v0, "notifyIntent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 257
    return-object v0
.end method

.method private createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;
    .registers 4
    .param p1, "notifyIntent"    # Landroid/content/Intent;

    .prologue
    .line 251
    const/4 v0, 0x0

    const/high16 v1, 0x8000000

    invoke-static {p0, v0, p1, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method private deleteProject(Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Ljava/util/Map;)V
    .registers 11
    .param p1, "projectId"    # Ljava/lang/String;
    .param p2, "projectPublishAsyncTaskParams"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 612
    .local p3, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v4, "{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}"

    invoke-static {v4, p3}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 613
    .local v2, "url":Ljava/lang/String;
    const-string v4, "{PROJECTID}"

    invoke-virtual {v2, v4, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 614
    iget-object v4, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    invoke-virtual {v4}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v3

    .line 615
    .local v3, "userAccessToken":Ljava/lang/String;
    if-eqz v3, :cond_1a

    .line 616
    const-string v4, "access_token"

    invoke-static {v2, v4, v3}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 619
    :cond_1a
    new-instance v0, Lorg/apache/http/client/methods/HttpDelete;

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    .line 620
    .local v0, "deleteRequest":Lorg/apache/http/client/methods/HttpDelete;
    invoke-static {v0}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPDelete(Lorg/apache/http/client/methods/HttpDelete;)Lcom/behance/sdk/util/HTTPResponse;
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_22} :catch_23

    .line 624
    .end local v0    # "deleteRequest":Lorg/apache/http/client/methods/HttpDelete;
    .end local v2    # "url":Ljava/lang/String;
    .end local v3    # "userAccessToken":Ljava/lang/String;
    :goto_22
    return-void

    .line 621
    :catch_23
    move-exception v1

    .line 622
    .local v1, "e":Ljava/lang/Throwable;
    sget-object v4, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem deleting project"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v4, v1, v5, v6}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_22
.end method

.method private getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I
    .registers 6
    .param p1, "progressState"    # Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;
    .param p2, "paramsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    .prologue
    .line 670
    const/4 v0, 0x0

    .line 671
    .local v0, "response":I
    sget-object v1, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$1;->$SwitchMap$com$behance$sdk$enums$BehanceSDKPublishProjectProgressState:[I

    invoke-virtual {p1}, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_46

    .line 712
    :goto_c
    return v0

    .line 673
    :pswitch_d
    const/16 v0, 0xa

    .line 674
    goto :goto_c

    .line 677
    :pswitch_10
    const/16 v0, 0x14

    .line 678
    goto :goto_c

    .line 681
    :pswitch_13
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnFacebook()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 682
    const/16 v0, 0x46

    goto :goto_c

    .line 683
    :cond_22
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnFacebook()Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 684
    :cond_2e
    const/16 v0, 0x50

    goto :goto_c

    .line 686
    :cond_31
    const/16 v0, 0x5a

    .line 688
    goto :goto_c

    .line 692
    :pswitch_34
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnTwitter()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 693
    const/16 v0, 0x50

    goto :goto_c

    .line 695
    :cond_3d
    const/16 v0, 0x5a

    .line 697
    goto :goto_c

    .line 701
    :pswitch_40
    const/16 v0, 0x5a

    .line 702
    goto :goto_c

    .line 708
    :pswitch_43
    const/16 v0, 0x64

    goto :goto_c

    .line 671
    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_34
        :pswitch_34
        :pswitch_40
        :pswitch_40
        :pswitch_43
        :pswitch_43
        :pswitch_43
        :pswitch_43
    .end packed-switch
.end method

.method private handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V
    .registers 14
    .param p1, "publishedProject"    # Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;
    .param p2, "serviceParams"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    .prologue
    .line 627
    new-instance v4, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    invoke-direct {v4}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;-><init>()V

    .line 628
    .local v4, "statusDto":Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    iget-object v8, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setPublishRequestId(Ljava/lang/String;)V

    .line 629
    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-virtual {v4, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 630
    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->CANCEL_PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-direct {p0, v8, p2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v8

    invoke-virtual {v4, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 633
    :try_start_18
    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectModules()Ljava/util/List;

    move-result-object v3

    .line 634
    .local v3, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-direct {p0, v3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->cleanupCreativeCloudResources(Ljava/util/List;)V

    .line 636
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 637
    .local v6, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "clientId"

    invoke-virtual {p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getAppClientId()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    const-string v8, "{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}"

    invoke-static {v8, v6}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 639
    .local v5, "url":Ljava/lang/String;
    const-string v8, "{PROJECTID}"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 641
    iget-object v8, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    invoke-virtual {v8}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v7

    .line 642
    .local v7, "userAccessToken":Ljava/lang/String;
    if-eqz v7, :cond_4b

    .line 643
    const-string v8, "access_token"

    invoke-static {v5, v8, v7}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 645
    :cond_4b
    new-instance v1, Lorg/apache/http/client/methods/HttpDelete;

    invoke-direct {v1, v5}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    .line 646
    .local v1, "deleteRequest":Lorg/apache/http/client/methods/HttpDelete;
    invoke-static {v1}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPDelete(Lorg/apache/http/client/methods/HttpDelete;)Lcom/behance/sdk/util/HTTPResponse;
    :try_end_53
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_53} :catch_67

    .line 652
    .end local v1    # "deleteRequest":Lorg/apache/http/client/methods/HttpDelete;
    .end local v3    # "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    .end local v5    # "url":Ljava/lang/String;
    .end local v6    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "userAccessToken":Ljava/lang/String;
    :goto_53
    new-instance v0, Landroid/content/Intent;

    const-string v8, "com.behance.sdk.INTENT_ACTION_PROJECT_PUBLISH_STATUS_BROADCAST"

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 653
    .local v0, "broadcastIntent":Landroid/content/Intent;
    const-string v8, "com.behance.sdk.INTENT_EXTRA_OBJ_KEY_PROJECT_PUBLISH_STATUS_BROADCAST_DATA"

    invoke-virtual {v0, v8, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 654
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 655
    return-void

    .line 647
    .end local v0    # "broadcastIntent":Landroid/content/Intent;
    :catch_67
    move-exception v2

    .line 648
    .local v2, "e":Ljava/lang/Throwable;
    sget-object v8, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v9, "Problem deleting project after cancel request"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-interface {v8, v2, v9, v10}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 649
    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->CANCEL_PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-virtual {v4, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 650
    invoke-virtual {v4, v2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto :goto_53
.end method

.method private isActiveUploadCancelled()Z
    .registers 3

    .prologue
    .line 129
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    if-eqz v0, :cond_d

    .line 130
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    iget-object v1, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->activePublishRequestId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;->isUploadCancelled(Ljava/lang/String;)Z

    move-result v0

    .line 132
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private publishOnFacebook(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V
    .registers 18
    .param p1, "publishedProject"    # Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;
    .param p2, "serviceParamsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p3, "statusDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .prologue
    .line 494
    :try_start_0
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    .line 495
    .local v2, "session":Lcom/facebook/Session;
    if-eqz v2, :cond_70

    .line 496
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 497
    .local v4, "postParams":Landroid/os/Bundle;
    const-string v3, "name"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    const-string v3, "link"

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectImageUrl()Ljava/lang/String;

    move-result-object v10

    .line 501
    .local v10, "projectImageUrl":Ljava/lang/String;
    if-eqz v10, :cond_2e

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2e

    .line 502
    const-string v3, "picture"

    invoke-virtual {v4, v3, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    :cond_2e
    new-instance v1, Lcom/facebook/Request;

    const-string v3, "me/feed"

    sget-object v5, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .line 505
    .local v1, "request":Lcom/facebook/Request;
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAndWait()Lcom/facebook/Response;

    move-result-object v11

    .line 506
    .local v11, "response":Lcom/facebook/Response;
    invoke-virtual {v11}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v8

    .line 507
    .local v8, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v8, :cond_85

    .line 510
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing Project on Facebook [Message - %s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v8}, Lcom/facebook/FacebookRequestError;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v6, v12

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 511
    invoke-virtual {v8}, Lcom/facebook/FacebookRequestError;->getErrorUserMessage()Ljava/lang/String;

    move-result-object v9

    .line 512
    .local v9, "errorUserMessage":Ljava/lang/String;
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing Project on Facebook [Message - %s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v9, v6, v12

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 513
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 514
    move-object/from16 v0, p3

    invoke-virtual {v0, v9}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V
    :try_end_70
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_70} :catch_97

    .line 525
    .end local v1    # "request":Lcom/facebook/Request;
    .end local v2    # "session":Lcom/facebook/Session;
    .end local v4    # "postParams":Landroid/os/Bundle;
    .end local v8    # "error":Lcom/facebook/FacebookRequestError;
    .end local v9    # "errorUserMessage":Ljava/lang/String;
    .end local v10    # "projectImageUrl":Ljava/lang/String;
    .end local v11    # "response":Lcom/facebook/Response;
    :cond_70
    :goto_70
    invoke-virtual/range {p3 .. p3}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-direct {p0, v3, v0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 526
    move-object/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 527
    return-void

    .line 516
    .restart local v1    # "request":Lcom/facebook/Request;
    .restart local v2    # "session":Lcom/facebook/Session;
    .restart local v4    # "postParams":Landroid/os/Bundle;
    .restart local v8    # "error":Lcom/facebook/FacebookRequestError;
    .restart local v10    # "projectImageUrl":Ljava/lang/String;
    .restart local v11    # "response":Lcom/facebook/Response;
    :cond_85
    :try_start_85
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Successfully shared Project on Facebook"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v3, v5, v6}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 517
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_FACEBOOK_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V
    :try_end_96
    .catch Ljava/lang/Throwable; {:try_start_85 .. :try_end_96} :catch_97

    goto :goto_70

    .line 520
    .end local v1    # "request":Lcom/facebook/Request;
    .end local v2    # "session":Lcom/facebook/Session;
    .end local v4    # "postParams":Landroid/os/Bundle;
    .end local v8    # "error":Lcom/facebook/FacebookRequestError;
    .end local v10    # "projectImageUrl":Ljava/lang/String;
    .end local v11    # "response":Lcom/facebook/Response;
    :catch_97
    move-exception v7

    .line 521
    .local v7, "e":Ljava/lang/Throwable;
    sget-object v3, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem sharing Project on Facebook"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v3, v7, v5, v6}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 522
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_FACEBOOK_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 523
    move-object/from16 v0, p3

    invoke-virtual {v0, v7}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto :goto_70
.end method

.method private publishOnTwitter(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V
    .registers 21
    .param p1, "serviceParamsDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p2, "statusDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .prologue
    .line 533
    :try_start_0
    new-instance v3, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getTwitterConsumerSecret()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v3, v13, v14}, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    .local v3, "consumer":Loauth/signpost/OAuthConsumer;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getTwitterUserAccessToken()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getTwitterUserAccessTokenSecret()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v3, v13, v14}, Loauth/signpost/OAuthConsumer;->setTokenWithSecret(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    sget v13, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_publish_on_twitter_msg:I

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->getProjectUrl()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 536
    .local v7, "queryString":Ljava/lang/String;
    const-string v13, "UTF-8"

    invoke-static {v7, v13}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 537
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

    .line 538
    .local v6, "finalURL":Ljava/lang/String;
    new-instance v12, Ljava/net/URI;

    invoke-direct {v12, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 539
    .local v12, "updateURI":Ljava/net/URI;
    new-instance v9, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v9, v12}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    .line 540
    .local v9, "request":Lorg/apache/http/client/methods/HttpPost;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Share on Twitter URL is [URL - %s]"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v12}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 541
    invoke-interface {v3, v9}, Loauth/signpost/OAuthConsumer;->sign(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;

    .line 543
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 544
    .local v2, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v2, v9}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 546
    .local v10, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    .line 547
    .local v11, "statusCode":I
    const/16 v13, 0xc8

    if-ne v11, v13, :cond_a1

    .line 548
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Successfully shared Project on Twitter"

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 549
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_TWITTER_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V
    :try_end_88
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_88} :catch_d3

    .line 568
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .end local v5    # "encodedQueryString":Ljava/lang/String;
    .end local v6    # "finalURL":Ljava/lang/String;
    .end local v7    # "queryString":Ljava/lang/String;
    .end local v9    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    .end local v11    # "statusCode":I
    .end local v12    # "updateURI":Ljava/net/URI;
    :goto_88
    invoke-virtual/range {p2 .. p2}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-result-object v13

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v13, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v13

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 569
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 570
    return-void

    .line 550
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .restart local v5    # "encodedQueryString":Ljava/lang/String;
    .restart local v6    # "finalURL":Ljava/lang/String;
    .restart local v7    # "queryString":Ljava/lang/String;
    .restart local v9    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v10    # "response":Lorg/apache/http/HttpResponse;
    .restart local v11    # "statusCode":I
    .restart local v12    # "updateURI":Ljava/net/URI;
    :cond_a1
    const/16 v13, 0x191

    if-ne v11, v13, :cond_eb

    .line 551
    :try_start_a5
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v8

    .line 552
    .local v8, "reasonPhrase":Ljava/lang/String;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Twitter User token has been revoked. [Error code - %s - message - %s]"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v8, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 553
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->unlinkTwitterAccount()V

    .line 554
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 555
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V
    :try_end_d2
    .catch Ljava/lang/Throwable; {:try_start_a5 .. :try_end_d2} :catch_d3

    goto :goto_88

    .line 563
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .end local v5    # "encodedQueryString":Ljava/lang/String;
    .end local v6    # "finalURL":Ljava/lang/String;
    .end local v7    # "queryString":Ljava/lang/String;
    .end local v8    # "reasonPhrase":Ljava/lang/String;
    .end local v9    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    .end local v11    # "statusCode":I
    .end local v12    # "updateURI":Ljava/net/URI;
    :catch_d3
    move-exception v4

    .line 564
    .local v4, "e":Ljava/lang/Throwable;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Error sharing Project on Twitter"

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-interface {v13, v4, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 565
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 566
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setException(Ljava/lang/Throwable;)V

    goto :goto_88

    .line 557
    .end local v4    # "e":Ljava/lang/Throwable;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "consumer":Loauth/signpost/OAuthConsumer;
    .restart local v5    # "encodedQueryString":Ljava/lang/String;
    .restart local v6    # "finalURL":Ljava/lang/String;
    .restart local v7    # "queryString":Ljava/lang/String;
    .restart local v9    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v10    # "response":Lorg/apache/http/HttpResponse;
    .restart local v11    # "statusCode":I
    .restart local v12    # "updateURI":Ljava/net/URI;
    :cond_eb
    :try_start_eb
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v8

    .line 558
    .restart local v8    # "reasonPhrase":Ljava/lang/String;
    sget-object v13, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v14, "Error sharing Project on Twitter. [Error code - %s - message - %s]"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v8, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 559
    sget-object v13, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->SHARE_ON_TWITTER_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 560
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V
    :try_end_115
    .catch Ljava/lang/Throwable; {:try_start_eb .. :try_end_115} :catch_d3

    goto/16 :goto_88
.end method

.method private publishProjectOnServer(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;
    .registers 56
    .param p1, "serviceParams"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .param p2, "statusDTO"    # Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    .prologue
    .line 263
    new-instance v43, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;

    invoke-direct/range {v43 .. v43}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;-><init>()V

    .line 264
    .local v43, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;
    new-instance v42, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

    invoke-direct/range {v42 .. v42}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;-><init>()V

    .line 265
    .local v42, "publishedProjectDTO":Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectTitle()Ljava/lang/String;

    move-result-object v36

    .line 266
    .local v36, "projectTitle":Ljava/lang/String;
    move-object/from16 v0, v42

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->setProjectTitle(Ljava/lang/String;)V

    .line 267
    move-object/from16 v0, v43

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setPublishedProject(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;)V

    .line 269
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectModules()Ljava/util/List;

    move-result-object v34

    .line 272
    .local v34, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    move-object/from16 v0, p2

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProjectTitle(Ljava/lang/String;)V

    .line 273
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 274
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_STARTED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v5, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 275
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 277
    const/16 v32, 0x0

    .line 278
    .local v32, "projectId":Ljava/lang/String;
    new-instance v50, Ljava/util/HashMap;

    invoke-direct/range {v50 .. v50}, Ljava/util/HashMap;-><init>()V

    .line 279
    .local v50, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "clientId"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getAppClientId()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v50

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    :try_start_56
    const-string v5, "text/plain"

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v46

    .line 283
    .local v46, "textContentType":Lorg/apache/http/entity/ContentType;
    const-string v5, "{server_root_url}/v2/project/editor?{key_client_id_param}={clientId}"

    move-object/from16 v0, v50

    invoke-static {v5, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v21

    .line 285
    .local v21, "createProjectDraftUrl":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v44

    .line 286
    .local v44, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v44 .. v44}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v51

    .line 287
    .local v51, "userAccessToken":Ljava/lang/String;
    if-eqz v51, :cond_7a

    .line 288
    const-string v5, "access_token"

    move-object/from16 v0, v21

    move-object/from16 v1, v51

    invoke-static {v0, v5, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    .line 293
    :cond_7a
    new-instance v19, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 294
    .local v19, "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectCoverImageByteArray()[B

    move-result-object v13

    .line 295
    .local v13, "coverImage":[B
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v17

    .line 296
    .local v17, "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    new-instance v14, Ljava/io/ByteArrayInputStream;

    invoke-direct {v14, v13}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 297
    .local v14, "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    new-instance v16, Lorg/apache/http/entity/mime/content/InputStreamBody;

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectCoverImageFileName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-direct {v0, v14, v5}, Lorg/apache/http/entity/mime/content/InputStreamBody;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 298
    .local v16, "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    const-string v5, "image"

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v5, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 299
    const-string v5, "title"

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    move-object/from16 v2, v46

    invoke-virtual {v0, v5, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 300
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v18

    .line 301
    .local v18, "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 303
    invoke-static/range {v19 .. v19}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPost(Lorg/apache/http/client/methods/HttpPost;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v20

    .line 304
    .local v20, "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual {v14}, Ljava/io/ByteArrayInputStream;->close()V

    .line 305
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v5

    const/16 v6, 0xc9

    if-eq v5, v6, :cond_f8

    .line 307
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 308
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V

    .line 309
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 311
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->cleanupCreativeCloudResources(Ljava/util/List;)V

    .line 312
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CREATION_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    .line 313
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setReasonPhrase(Ljava/lang/String;)V

    .line 480
    .end local v13    # "coverImage":[B
    .end local v14    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .end local v16    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .end local v17    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v18    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v19    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v20    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v21    # "createProjectDraftUrl":Ljava/lang/String;
    .end local v44    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v46    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v51    # "userAccessToken":Ljava/lang/String;
    :goto_f7
    return-object v43

    .line 318
    .restart local v13    # "coverImage":[B
    .restart local v14    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .restart local v16    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .restart local v17    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v18    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .restart local v19    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v20    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .restart local v21    # "createProjectDraftUrl":Ljava/lang/String;
    .restart local v44    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v46    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v51    # "userAccessToken":Ljava/lang/String;
    :cond_f8
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/util/HTTPResponse;->getResponseString()Ljava/lang/String;

    move-result-object v23

    .line 319
    .local v23, "draftProjectResponseJsonString":Ljava/lang/String;
    new-instance v24, Lorg/json/JSONObject;

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 320
    .local v24, "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    const-string v5, "project"

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/json/JSONObject;

    .line 321
    .local v22, "draftProjectJsonObject":Lorg/json/JSONObject;
    const-string v5, "id"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 322
    move-object/from16 v0, v42

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->setProjectId(Ljava/lang/String;)V

    .line 323
    const-string v5, "url"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 324
    .local v37, "projectUrl":Ljava/lang/String;
    move-object/from16 v0, v42

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->setProjectUrl(Ljava/lang/String;)V

    .line 326
    move-object/from16 v0, p2

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProjectId(Ljava/lang/String;)V

    .line 327
    move-object/from16 v0, p2

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProjectUrl(Ljava/lang/String;)V

    .line 329
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v5

    if-eqz v5, :cond_17e

    .line 330
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V

    .line 331
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V
    :try_end_151
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_151} :catch_152

    goto :goto_f7

    .line 461
    .end local v13    # "coverImage":[B
    .end local v14    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .end local v16    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .end local v17    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v18    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v19    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v20    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v21    # "createProjectDraftUrl":Ljava/lang/String;
    .end local v22    # "draftProjectJsonObject":Lorg/json/JSONObject;
    .end local v23    # "draftProjectResponseJsonString":Ljava/lang/String;
    .end local v24    # "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    .end local v37    # "projectUrl":Ljava/lang/String;
    .end local v44    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v46    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v51    # "userAccessToken":Ljava/lang/String;
    :catch_152
    move-exception v25

    .line 462
    .local v25, "e":Ljava/lang/Throwable;
    sget-object v5, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v6, "Problem publishing project"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    move-object/from16 v0, v25

    invoke-interface {v5, v0, v6, v7}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 463
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->cleanupCreativeCloudResources(Ljava/util/List;)V

    .line 464
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v5

    if-eqz v5, :cond_433

    .line 465
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V

    .line 466
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    goto/16 :goto_f7

    .line 335
    .end local v25    # "e":Ljava/lang/Throwable;
    .restart local v13    # "coverImage":[B
    .restart local v14    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .restart local v16    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .restart local v17    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v18    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .restart local v19    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v20    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .restart local v21    # "createProjectDraftUrl":Ljava/lang/String;
    .restart local v22    # "draftProjectJsonObject":Lorg/json/JSONObject;
    .restart local v23    # "draftProjectResponseJsonString":Ljava/lang/String;
    .restart local v24    # "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    .restart local v37    # "projectUrl":Ljava/lang/String;
    .restart local v44    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v46    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v51    # "userAccessToken":Ljava/lang/String;
    :cond_17e
    :try_start_17e
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PROJECT_DRAFT_CREATION_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 336
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PROJECT_DRAFT_CREATION_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v5, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 337
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 339
    const-string v5, "covers"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 340
    .local v15, "coverImageJsonObject":Lorg/json/JSONObject;
    if-eqz v15, :cond_1c5

    .line 341
    const-string v5, "202"

    invoke-virtual {v15, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    .line 342
    .local v45, "smallCoverImageUrl":Ljava/lang/String;
    const-string v5, "404"

    invoke-virtual {v15, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 343
    .local v11, "bigCoverImageUrl":Ljava/lang/String;
    move-object/from16 v0, v42

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->setProjectImageUrl(Ljava/lang/String;)V

    .line 344
    if-eqz v11, :cond_20c

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_20c

    .line 345
    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProjectCoverImageUrl(Ljava/lang/String;)V

    .line 351
    .end local v11    # "bigCoverImageUrl":Ljava/lang/String;
    .end local v45    # "smallCoverImageUrl":Ljava/lang/String;
    :cond_1c5
    :goto_1c5
    const-string v5, "{server_root_url}/v2/project/editor/{PROJECTID}/modules?{key_client_id_param}={clientId}"

    move-object/from16 v0, v50

    invoke-static {v5, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v27

    .line 352
    .local v27, "finalAddModuleUrl":Ljava/lang/String;
    const-string v5, "{PROJECTID}"

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v27

    .line 353
    if-eqz v51, :cond_1e3

    .line 354
    const-string v5, "access_token"

    move-object/from16 v0, v27

    move-object/from16 v1, v51

    invoke-static {v0, v5, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    .line 359
    :cond_1e3
    const/4 v9, 0x0

    .line 360
    .local v9, "currentUploadingModuleCount":I
    invoke-interface/range {v34 .. v34}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v52

    :cond_1e8
    invoke-interface/range {v52 .. v52}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_320

    invoke-interface/range {v52 .. v52}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 361
    .local v33, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v5

    if-eqz v5, :cond_214

    .line 363
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V

    .line 364
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    goto/16 :goto_f7

    .line 347
    .end local v9    # "currentUploadingModuleCount":I
    .end local v27    # "finalAddModuleUrl":Ljava/lang/String;
    .end local v33    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    .restart local v11    # "bigCoverImageUrl":Ljava/lang/String;
    .restart local v45    # "smallCoverImageUrl":Ljava/lang/String;
    :cond_20c
    move-object/from16 v0, p2

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProjectCoverImageUrl(Ljava/lang/String;)V

    goto :goto_1c5

    .line 367
    .end local v11    # "bigCoverImageUrl":Ljava/lang/String;
    .end local v45    # "smallCoverImageUrl":Ljava/lang/String;
    .restart local v9    # "currentUploadingModuleCount":I
    .restart local v27    # "finalAddModuleUrl":Ljava/lang/String;
    .restart local v33    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_214
    add-int/lit8 v9, v9, 0x1

    .line 368
    invoke-interface/range {v33 .. v33}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v30

    .line 369
    .local v30, "moduleType":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v47

    .line 370
    .local v47, "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    const/16 v29, 0x0

    .line 371
    .local v29, "imageFile":Ljava/io/File;
    sget-object v5, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-object/from16 v0, v30

    if-eq v0, v5, :cond_22c

    sget-object v5, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-object/from16 v0, v30

    if-ne v0, v5, :cond_2a3

    .line 372
    :cond_22c
    const-string v5, "type"

    const-string v6, "image"

    move-object/from16 v0, v47

    invoke-virtual {v0, v5, v6}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 373
    move-object/from16 v0, v33

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/ImageModule;->getFileForUpload()Ljava/io/File;

    move-result-object v29

    .line 374
    const-string v5, "image"

    new-instance v6, Lorg/apache/http/entity/mime/content/FileBody;

    move-object/from16 v0, v29

    invoke-direct {v6, v0}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v5, v6}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 380
    :cond_24c
    :goto_24c
    invoke-virtual/range {v47 .. v47}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v48

    .line 381
    .local v48, "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    new-instance v8, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v27

    invoke-direct {v8, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 382
    .local v8, "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    new-instance v4, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;

    const/4 v10, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    invoke-direct/range {v4 .. v10}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;-><init>(Lcom/behance/sdk/services/BehanceSDKPublishProjectService;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;Lorg/apache/http/client/methods/HttpPost;ILcom/behance/sdk/services/BehanceSDKPublishProjectService$1;)V

    .line 384
    .local v4, "wrapper":Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
    new-instance v5, Lcom/behance/sdk/util/CustomHttpEntityWrapper;

    move-object/from16 v0, v48

    invoke-direct {v5, v0, v4}, Lcom/behance/sdk/util/CustomHttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;)V

    invoke-virtual {v8, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 385
    invoke-static {v8}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPost(Lorg/apache/http/client/methods/HttpPost;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v49

    .line 386
    .local v49, "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    sget-object v5, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-object/from16 v0, v30

    if-ne v0, v5, :cond_2cc

    move-object/from16 v0, v33

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/ImageModule;->getFile()Ljava/io/File;

    move-result-object v5

    move-object/from16 v0, v29

    invoke-virtual {v0, v5}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2cc

    .line 387
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->delete()Z

    .line 391
    :cond_28b
    :goto_28b
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v5

    if-eqz v5, :cond_2d6

    .line 392
    move-object/from16 v0, p0

    move-object/from16 v1, v42

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V

    .line 393
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->CANCELLED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    goto/16 :goto_f7

    .line 375
    .end local v4    # "wrapper":Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
    .end local v8    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v48    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v49    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    :cond_2a3
    sget-object v5, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-object/from16 v0, v30

    if-ne v0, v5, :cond_24c

    .line 376
    const-string v5, "type"

    const-string v6, "embed"

    move-object/from16 v0, v47

    invoke-virtual {v0, v5, v6}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 377
    move-object/from16 v0, v33

    check-cast v0, Lcom/behance/sdk/project/modules/EmbedModule;

    move-object v5, v0

    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/EmbedModule;->getEmbedContent()Ljava/lang/String;

    move-result-object v26

    .line 378
    .local v26, "embedContent":Ljava/lang/String;
    const-string v5, "html"

    new-instance v6, Lorg/apache/http/entity/mime/content/StringBody;

    sget-object v7, Lorg/apache/http/entity/ContentType;->APPLICATION_XHTML_XML:Lorg/apache/http/entity/ContentType;

    move-object/from16 v0, v26

    invoke-direct {v6, v0, v7}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v5, v6}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    goto :goto_24c

    .line 388
    .end local v26    # "embedContent":Ljava/lang/String;
    .restart local v4    # "wrapper":Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
    .restart local v8    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v48    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .restart local v49    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    :cond_2cc
    sget-object v5, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-object/from16 v0, v30

    if-ne v0, v5, :cond_28b

    .line 389
    invoke-interface/range {v33 .. v33}, Lcom/behance/sdk/project/modules/ProjectModule;->deleteFromFileSystem()V

    goto :goto_28b

    .line 396
    :cond_2d6
    invoke-virtual/range {v49 .. v49}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v5

    const/16 v6, 0xc9

    if-eq v5, v6, :cond_1e8

    .line 397
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, p1

    move-object/from16 v3, v50

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->deleteProject(Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Ljava/util/Map;)V

    .line 398
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->cleanupCreativeCloudResources(Ljava/util/List;)V

    .line 400
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 401
    invoke-virtual/range {v49 .. v49}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V

    .line 402
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 404
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->MODULE_ADD_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    .line 405
    move-object/from16 v0, v43

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setFailedMoudle(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 406
    invoke-virtual/range {v49 .. v49}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setReasonPhrase(Ljava/lang/String;)V

    goto/16 :goto_f7

    .line 412
    .end local v4    # "wrapper":Lcom/behance/sdk/services/BehanceSDKPublishProjectService$ProjectModuleUploadEntityWrapperCallback;
    .end local v8    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v29    # "imageFile":Ljava/io/File;
    .end local v30    # "moduleType":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .end local v33    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    .end local v47    # "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v48    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v49    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    :cond_320
    const-string v5, "{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}"

    move-object/from16 v0, v50

    invoke-static {v5, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v28

    .line 413
    .local v28, "finalPublishUrl":Ljava/lang/String;
    const-string v5, "{PROJECTID}"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v28

    .line 414
    if-eqz v51, :cond_33e

    .line 415
    const-string v5, "access_token"

    .line 416
    move-object/from16 v0, v28

    move-object/from16 v1, v51

    invoke-static {v0, v5, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    .line 419
    :cond_33e
    new-instance v41, Lorg/apache/http/client/methods/HttpPut;

    move-object/from16 v0, v41

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 420
    .local v41, "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v39

    .line 421
    .local v39, "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    sget-object v5, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    move-object/from16 v0, v39

    invoke-virtual {v0, v5}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 422
    const-string v5, "title"

    move-object/from16 v0, v39

    move-object/from16 v1, v36

    move-object/from16 v2, v46

    invoke-virtual {v0, v5, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 423
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectCreativeFields()Ljava/lang/String;

    move-result-object v31

    .line 424
    .local v31, "projectFields":Ljava/lang/String;
    invoke-static/range {v31 .. v31}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_372

    .line 425
    const-string v5, "fields"

    move-object/from16 v0, v39

    move-object/from16 v1, v31

    move-object/from16 v2, v46

    invoke-virtual {v0, v5, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 427
    :cond_372
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectTags()Ljava/lang/String;

    move-result-object v35

    .line 428
    .local v35, "projectTags":Ljava/lang/String;
    invoke-static/range {v35 .. v35}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_387

    .line 429
    const-string v5, "tags"

    move-object/from16 v0, v39

    move-object/from16 v1, v35

    move-object/from16 v2, v46

    invoke-virtual {v0, v5, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 431
    :cond_387
    const-string v5, "description"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectDescription()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v39

    move-object/from16 v1, v46

    invoke-virtual {v0, v5, v6, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 432
    const-string v5, "license"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getProjectCopyright()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v39

    move-object/from16 v1, v46

    invoke-virtual {v0, v5, v6, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 433
    const-string v12, ""

    .line 434
    .local v12, "containsAdultContentStr":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isProjectContainsAdultContent()Z

    move-result v5

    if-eqz v5, :cond_3fc

    .line 435
    const-string v12, "1"

    .line 439
    :goto_3ab
    const-string v5, "mature_content"

    move-object/from16 v0, v39

    move-object/from16 v1, v46

    invoke-virtual {v0, v5, v12, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 440
    const-string v5, "published"

    const-string v6, "1"

    move-object/from16 v0, v39

    move-object/from16 v1, v46

    invoke-virtual {v0, v5, v6, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 441
    invoke-virtual/range {v39 .. v39}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v40

    .line 442
    .local v40, "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, v41

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 443
    invoke-static/range {v41 .. v41}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPut(Lorg/apache/http/client/methods/HttpPut;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v38

    .line 444
    .local v38, "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual/range {v38 .. v38}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v5

    const/16 v6, 0xc8

    if-ne v5, v6, :cond_3ff

    .line 445
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    .line 447
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->MODULES_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 448
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->MODULES_UPLOAD_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    .line 449
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v5, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v5

    .line 448
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 450
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    goto/16 :goto_f7

    .line 437
    .end local v38    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v40    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    :cond_3fc
    const-string v12, "0"

    goto :goto_3ab

    .line 452
    .restart local v38    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .restart local v40    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    :cond_3ff
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, p1

    move-object/from16 v3, v50

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->deleteProject(Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Ljava/util/Map;)V

    .line 454
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 455
    invoke-virtual/range {v38 .. v38}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setReasonPhrase(Ljava/lang/String;)V

    .line 456
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 458
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->PUBLISH_FAILED:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    .line 459
    invoke-virtual/range {v38 .. v38}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setReasonPhrase(Ljava/lang/String;)V
    :try_end_431
    .catch Ljava/lang/Throwable; {:try_start_17e .. :try_end_431} :catch_152

    goto/16 :goto_f7

    .line 469
    .end local v9    # "currentUploadingModuleCount":I
    .end local v12    # "containsAdultContentStr":Ljava/lang/String;
    .end local v13    # "coverImage":[B
    .end local v14    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .end local v15    # "coverImageJsonObject":Lorg/json/JSONObject;
    .end local v16    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .end local v17    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v18    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v19    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v20    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v21    # "createProjectDraftUrl":Ljava/lang/String;
    .end local v22    # "draftProjectJsonObject":Lorg/json/JSONObject;
    .end local v23    # "draftProjectResponseJsonString":Ljava/lang/String;
    .end local v24    # "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    .end local v27    # "finalAddModuleUrl":Ljava/lang/String;
    .end local v28    # "finalPublishUrl":Ljava/lang/String;
    .end local v31    # "projectFields":Ljava/lang/String;
    .end local v35    # "projectTags":Ljava/lang/String;
    .end local v37    # "projectUrl":Ljava/lang/String;
    .end local v38    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v39    # "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v40    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v41    # "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    .end local v44    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v46    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v51    # "userAccessToken":Ljava/lang/String;
    .restart local v25    # "e":Ljava/lang/Throwable;
    :cond_433
    invoke-static/range {v32 .. v32}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_444

    .line 470
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, p1

    move-object/from16 v3, v50

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->deleteProject(Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Ljava/util/Map;)V

    .line 472
    :cond_444
    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_FAILED:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 473
    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setException(Ljava/lang/Throwable;)V

    .line 474
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 476
    sget-object v5, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->EXCEPTION:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v43

    invoke-virtual {v0, v5}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V

    .line 477
    move-object/from16 v0, v43

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->setException(Ljava/lang/Throwable;)V

    goto/16 :goto_f7
.end method

.method private unlinkTwitterAccount()V
    .registers 4

    .prologue
    .line 573
    invoke-static {p0}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v0

    .line 574
    .local v0, "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v1

    .line 575
    .local v1, "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v1, :cond_11

    .line 576
    sget-object v2, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    .line 578
    :cond_11
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    if-nez v0, :cond_b

    .line 118
    new-instance v0, Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    invoke-direct {v0}, Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    .line 120
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    return-object v0
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 246
    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    .line 247
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->projectBinder:Lcom/behance/sdk/services/binders/BehanceSDKPublishProjectBinder;

    .line 248
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 20
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->activePublishRequestId:Ljava/lang/String;

    .line 141
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->sdkUserManager:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    .line 143
    new-instance v2, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 144
    .local v2, "mBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget v15, Lcom/behance/sdk/R$drawable;->bsdk_anim_list_publish_in_progress_indicator:I

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 145
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_in_progress_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 146
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_in_progress_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 147
    new-instance v15, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v15}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    sget v16, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_in_progress_notification_text:I

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 148
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v2, v15, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 149
    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    .line 150
    .local v5, "notification":Landroid/app/Notification;
    const/16 v15, 0x7d1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v5}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->startForeground(ILandroid/app/Notification;)V

    .line 152
    const-string v15, "INTENT_EXTRA_PARAMS"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    .line 153
    .local v8, "params":Ljava/io/Serializable;
    instance-of v15, v8, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    if-eqz v15, :cond_80

    move-object v13, v8

    .line 154
    check-cast v13, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    .line 155
    .local v13, "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    new-instance v14, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;

    invoke-direct {v14}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;-><init>()V

    .line 157
    .local v14, "statusDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-eqz v15, :cond_81

    .line 158
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastUploadCancelledStatusUpdate()V

    .line 242
    .end local v13    # "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .end local v14    # "statusDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    :cond_80
    :goto_80
    return-void

    .line 162
    .restart local v13    # "serviceParamsDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .restart local v14    # "statusDTO":Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
    :cond_81
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->publishProjectOnServer(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;

    move-result-object v9

    .line 165
    .local v9, "publishProjectResult":Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;
    invoke-virtual {v9}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->getPublishedProject()Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

    move-result-object v10

    .line 166
    .local v10, "publishedProject":Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;
    invoke-virtual {v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->getNotificationHandlerActivity()Ljava/lang/Class;

    move-result-object v6

    .line 168
    .local v6, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    if-eqz v10, :cond_175

    invoke-virtual {v9}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->getStatus()Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-result-object v15

    sget-object v16, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;->SUCCESS:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_175

    .line 170
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-nez v15, :cond_ac

    invoke-virtual {v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnFacebook()Z

    move-result v15

    if-eqz v15, :cond_ac

    .line 171
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v13, v14}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->publishOnFacebook(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 174
    :cond_ac
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-nez v15, :cond_bd

    invoke-virtual {v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->isShareOnTwitter()Z

    move-result v15

    if-eqz v15, :cond_bd

    .line 175
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->publishOnTwitter(Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 179
    :cond_bd
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-eqz v15, :cond_c9

    .line 180
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v13}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->handleCancelAfterSuccessfulUpload(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)V

    goto :goto_80

    .line 184
    :cond_c9
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_success_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 185
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_success_notification_ticker:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 186
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_success_notification_text:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 187
    new-instance v15, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v15}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    sget v16, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_success_notification_text:I

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 189
    if-eqz v6, :cond_130

    .line 190
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->createNotifyIntent(Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v7

    .line 191
    .local v7, "notifyIntent":Landroid/content/Intent;
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_BOOL_EXTRA_PUBLISHED_PROJECT_SUCCESSFULLY"

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 192
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_ID"

    .line 193
    invoke-virtual {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectId()Ljava/lang/String;

    move-result-object v16

    .line 192
    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 194
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_TITLE"

    .line 195
    invoke-virtual {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectTitle()Ljava/lang/String;

    move-result-object v16

    .line 194
    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 196
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v12

    .line 198
    .local v12, "resultPendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v2, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 200
    .end local v7    # "notifyIntent":Landroid/content/Intent;
    .end local v12    # "resultPendingIntent":Landroid/app/PendingIntent;
    :cond_130
    sget-object v15, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    invoke-virtual {v14, v15}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V

    .line 201
    sget-object v15, Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;->PUBLISH_SUCCESSFUL:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v13}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getProgressPercentage(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;)I

    move-result v15

    invoke-virtual {v14, v15}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->setProgressPercentage(I)V

    .line 202
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->broadcastProgressUpdate(Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;)V

    .line 233
    :cond_145
    :goto_145
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-nez v15, :cond_80

    .line 234
    sget v15, Lcom/behance/sdk/R$drawable;->bsdk_icon_notification_publish_progress:I

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 235
    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v2, v15, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 236
    const/4 v15, 0x1

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 237
    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    .line 238
    const-string v15, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 239
    .local v3, "mNotificationManager":Landroid/app/NotificationManager;
    const/16 v15, 0x7d2

    invoke-virtual {v3, v15, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_80

    .line 205
    .end local v3    # "mNotificationManager":Landroid/app/NotificationManager;
    :cond_175
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->isActiveUploadCancelled()Z

    move-result v15

    if-nez v15, :cond_80

    .line 208
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_failure_notification_title:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 209
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_failure_notification_ticker:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 210
    const-string v4, ""

    .line 211
    .local v4, "msgToDisplay":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->getReasonPhrase()Ljava/lang/String;

    move-result-object v11

    .line 212
    .local v11, "reasonPhrase":Ljava/lang/String;
    if-eqz v11, :cond_1f5

    .line 213
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_failure_notification_msg:I

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v11, v16, v17

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 217
    :goto_1af
    invoke-virtual {v2, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 218
    new-instance v15, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v15}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v15, v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v15

    invoke-virtual {v2, v15}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 220
    if-eqz v6, :cond_145

    .line 221
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->createNotifyIntent(Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v7

    .line 222
    .restart local v7    # "notifyIntent":Landroid/content/Intent;
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_BOOL_EXTRA_PUBLISHED_PROJECT_SUCCESSFULLY"

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 223
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_ID"

    .line 224
    invoke-virtual {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectId()Ljava/lang/String;

    move-result-object v16

    .line 223
    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 225
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISHED_PROJECT_TITLE"

    .line 226
    invoke-virtual {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;->getProjectTitle()Ljava/lang/String;

    move-result-object v16

    .line 225
    move-object/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    const-string v15, "BEHANCE_SDK_PUBLISH_PROJECT_INTENT_STR_EXTRA_PUBLISH_PROJECT_FAILURE_MSG"

    invoke-virtual {v7, v15, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 228
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->createPendingIntent(Landroid/content/Intent;)Landroid/app/PendingIntent;

    move-result-object v12

    .line 230
    .restart local v12    # "resultPendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v2, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_145

    .line 215
    .end local v7    # "notifyIntent":Landroid/content/Intent;
    .end local v12    # "resultPendingIntent":Landroid/app/PendingIntent;
    :cond_1f5
    sget v15, Lcom/behance/sdk/R$string;->bsdk_publish_project_service_unknown_failure_notification_msg:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1af
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 125
    invoke-super {p0, p1}, Landroid/app/IntentService;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
