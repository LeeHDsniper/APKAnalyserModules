.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
.super Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.source "AdobeStorageSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$60;,
        Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static requestMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected _cacheConfigured:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 88
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 5
    .param p1, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 166
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 167
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->setUpService()V

    .line 168
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V

    .line 169
    const-wide/16 v0, 0xf

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->setupOngoingConnectionTimer(JZ)V

    .line 170
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    .line 171
    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .registers 1

    .prologue
    .line 88
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    return-object v0
.end method

.method private checkEntitlements()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .registers 5

    .prologue
    .line 566
    const/4 v2, 0x0

    .line 569
    .local v2, "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    const/4 v0, 0x1

    .line 571
    .local v0, "hasAccessToService":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->isPrivateService()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 573
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPrivateStorageServices()Z

    move-result v3

    if-nez v3, :cond_13

    .line 575
    const/4 v0, 0x0

    .line 586
    :cond_13
    :goto_13
    if-nez v0, :cond_1e

    .line 588
    const-string v1, "You do not have permission to access these storage services. Contact your IT administrator to gain access."

    .line 591
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .end local v2    # "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 595
    .end local v1    # "msg":Ljava/lang/String;
    .restart local v2    # "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_1e
    return-object v2

    .line 580
    :cond_1f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPublicStorageServices()Z

    move-result v3

    if-nez v3, :cond_13

    .line 582
    const/4 v0, 0x1

    goto :goto_13
.end method

.method protected static getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 7

    .prologue
    .line 103
    const/4 v3, 0x0

    .line 104
    .local v3, "serviceEndpointURL":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v0

    .line 106
    .local v0, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$60;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_54

    .line 122
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "An undefined authentication endpoint has been specified."

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    :goto_21
    const/4 v1, 0x0

    .line 128
    .local v1, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_22
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    const-string v4, "files"

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-direct {v2, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_30
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_30} :catch_4f

    .line 131
    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .local v2, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_30
    const-string v4, "assets"

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->addServiceSchemaId(Ljava/lang/String;Ljava/net/URL;)V

    .line 132
    const-string v4, "libraries"

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->addServiceSchemaId(Ljava/lang/String;Ljava/net/URL;)V
    :try_end_44
    .catch Ljava/net/MalformedURLException; {:try_start_30 .. :try_end_44} :catch_51

    move-object v1, v2

    .line 137
    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :goto_45
    return-object v1

    .line 109
    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :pswitch_46
    const-string v3, "https://cc-api-storage.adobe.io"

    .line 110
    goto :goto_21

    .line 113
    :pswitch_49
    const-string v3, "https://cc-api-storage-stage.adobe.io"

    .line 114
    goto :goto_21

    .line 117
    :pswitch_4c
    const-string v3, "https://cc-api-storage-labs.adobe.io"

    .line 118
    goto :goto_21

    .line 134
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_4f
    move-exception v4

    goto :goto_45

    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_51
    move-exception v4

    move-object v1, v2

    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    goto :goto_45

    .line 106
    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_46
        :pswitch_49
        :pswitch_4c
    .end packed-switch
.end method

.method public static getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    .registers 3
    .param p0, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 151
    if-nez p0, :cond_12

    .line 154
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAdobeApplication()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 155
    const/4 v0, 0x0

    .line 162
    :goto_d
    return-object v0

    .line 157
    :cond_e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object p0

    .line 161
    :cond_12
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 162
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    goto :goto_d
.end method

.method private moveAssetUtil(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 18
    .param p1, "targetLocation"    # Ljava/lang/String;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p3, "editAssetCallback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    .prologue
    .line 918
    if-nez p2, :cond_10

    .line 919
    :try_start_2
    sget-object v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v2

    .line 920
    .local v2, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 921
    const/4 v6, 0x0

    .line 1007
    .end local v2    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :goto_f
    return-object v6

    .line 924
    :cond_10
    move-object v7, p0

    .line 926
    .local v7, "self":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    const-string v11, "files"

    invoke-virtual {p0, v11}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v8

    .line 927
    .local v8, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    const/4 v9, 0x0

    .line 928
    .local v9, "uri":Ljava/net/URI;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->isPrivateService()Z

    move-result v11

    if-eqz v11, :cond_a0

    .line 929
    new-instance v9, Ljava/net/URI;

    .end local v9    # "uri":Ljava/net/URI;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v12

    invoke-virtual {v12}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 933
    .restart local v9    # "uri":Ljava/net/URI;
    :goto_3c
    invoke-virtual {v9}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v10

    .line 934
    .local v10, "url":Ljava/net/URL;
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 935
    .local v6, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v6, v10}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 936
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->isPrivateService()Z

    move-result v11

    if-nez v11, :cond_55

    .line 937
    const-string v11, "invocation_mode"

    const-string v12, "async"

    invoke-virtual {v6, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->addQueryParameters(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    :cond_55
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getHref()Ljava/net/URI;

    move-result-object v11

    invoke-virtual {v11}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v5

    .line 942
    .local v5, "linkHeaderString":Ljava/lang/String;
    const-string v11, "<%s>;rel=self"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v5, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 943
    .local v4, "linkHeader":Ljava/lang/String;
    const-string v11, "Link"

    invoke-virtual {v6, v11, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 944
    move-object/from16 v0, p2

    instance-of v11, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v11, :cond_c6

    .line 945
    const-string v11, "Content-Type"

    const-string v12, "application/vnd.adobe.directory+json"

    invoke-virtual {v6, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 948
    :goto_7b
    sget-object v11, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPUT:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v6, v11}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 951
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    move-object/from16 v0, p3

    invoke-direct {v1, p0, v0, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;)V

    .line 992
    .local v1, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {p0, v6, v11, v12, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_8c
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_8c} :catch_8d
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_8c} :catch_ce

    goto :goto_f

    .line 995
    .end local v1    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v4    # "linkHeader":Ljava/lang/String;
    .end local v5    # "linkHeaderString":Ljava/lang/String;
    .end local v6    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v7    # "self":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .end local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v9    # "uri":Ljava/net/URI;
    .end local v10    # "url":Ljava/net/URL;
    :catch_8d
    move-exception v3

    .line 997
    .local v3, "exp":Ljava/net/URISyntaxException;
    sget-object v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v2

    .line 998
    .restart local v2    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {v3}, Ljava/net/URISyntaxException;->printStackTrace()V

    .line 999
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 1007
    .end local v3    # "exp":Ljava/net/URISyntaxException;
    :goto_9d
    const/4 v6, 0x0

    goto/16 :goto_f

    .line 931
    .end local v2    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .restart local v7    # "self":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .restart local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .restart local v9    # "uri":Ljava/net/URI;
    :cond_a0
    :try_start_a0
    new-instance v9, Ljava/net/URI;

    .end local v9    # "uri":Ljava/net/URI;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v12

    invoke-virtual {v12}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "?invocation_mode=async"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .restart local v9    # "uri":Ljava/net/URI;
    goto/16 :goto_3c

    .line 947
    .restart local v4    # "linkHeader":Ljava/lang/String;
    .restart local v5    # "linkHeaderString":Ljava/lang/String;
    .restart local v6    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .restart local v10    # "url":Ljava/net/URL;
    :cond_c6
    const-string v11, "Content-Type"

    const-string v12, "*/*"

    invoke-virtual {v6, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_cd
    .catch Ljava/net/URISyntaxException; {:try_start_a0 .. :try_end_cd} :catch_8d
    .catch Ljava/net/MalformedURLException; {:try_start_a0 .. :try_end_cd} :catch_ce

    goto :goto_7b

    .line 1001
    .end local v4    # "linkHeader":Ljava/lang/String;
    .end local v5    # "linkHeaderString":Ljava/lang/String;
    .end local v6    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v7    # "self":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .end local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v9    # "uri":Ljava/net/URI;
    .end local v10    # "url":Ljava/net/URL;
    :catch_ce
    move-exception v3

    .line 1003
    .local v3, "exp":Ljava/net/MalformedURLException;
    sget-object v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v2

    .line 1004
    .restart local v2    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {v3}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 1005
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    goto :goto_9d
.end method

.method private requestRenditionFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;IILjava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 18
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "pixels"    # I
    .param p4, "page"    # I
    .param p5, "eTagHeaderField"    # Ljava/lang/String;

    .prologue
    .line 729
    const/4 v7, 0x0

    .line 731
    .local v7, "url":Ljava/net/URL;
    :try_start_1
    const-string v8, "files"

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    .line 732
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-lez p3, :cond_76

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ";size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 733
    .local v5, "sizeArg":Ljava/lang/String;
    :goto_1c
    const-string v8, "%s/:rendition;page=%d%s"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->href:Ljava/net/URI;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    aput-object v5, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 734
    .local v2, "renditionStr":Ljava/lang/String;
    new-instance v6, Ljava/net/URI;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 735
    .local v6, "uri":Ljava/net/URI;
    invoke-virtual {v6}, Ljava/net/URI;->toURL()Ljava/net/URL;
    :try_end_55
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_55} :catch_79
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_55} :catch_87

    move-result-object v7

    .line 745
    .end local v2    # "renditionStr":Ljava/lang/String;
    .end local v4    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v5    # "sizeArg":Ljava/lang/String;
    .end local v6    # "uri":Ljava/net/URI;
    :goto_56
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 746
    .local v3, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 747
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v3, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 749
    if-eqz p5, :cond_70

    .line 750
    iget-object v8, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    if-nez v8, :cond_92

    const-string v8, "*"

    :goto_6b
    move-object/from16 v0, p5

    invoke-virtual {v3, v0, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    :cond_70
    const-string v8, "Accept"

    invoke-virtual {v3, v8, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 754
    return-object v3

    .line 732
    .end local v3    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .restart local v4    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_76
    :try_start_76
    const-string v5, ""
    :try_end_78
    .catch Ljava/net/URISyntaxException; {:try_start_76 .. :try_end_78} :catch_79
    .catch Ljava/net/MalformedURLException; {:try_start_76 .. :try_end_78} :catch_87

    goto :goto_1c

    .line 736
    .end local v4    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :catch_79
    move-exception v1

    .line 738
    .local v1, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v1}, Ljava/net/URISyntaxException;->printStackTrace()V

    .line 739
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v9, "AssetStorage.requestRendition"

    const-string v10, "URISyntaxException"

    invoke-static {v8, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_56

    .line 740
    .end local v1    # "e":Ljava/net/URISyntaxException;
    :catch_87
    move-exception v1

    .line 742
    .local v1, "e":Ljava/net/MalformedURLException;
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v9, "AssetStorage.requestRendition"

    const-string v10, "MalformedURLException"

    invoke-static {v8, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_56

    .line 750
    .end local v1    # "e":Ljava/net/MalformedURLException;
    .restart local v3    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :cond_92
    iget-object v8, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    goto :goto_6b
.end method

.method private requestVideoMetadataFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 13
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "eTagHeaderField"    # Ljava/lang/String;

    .prologue
    .line 672
    const/4 v5, 0x0

    .line 673
    .local v5, "url":Ljava/net/URL;
    const-string v6, "files"

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v3

    .line 675
    .local v3, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :try_start_7
    const-string v6, "%s/:rendition"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->href:Ljava/net/URI;

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 676
    .local v1, "path":Ljava/lang/String;
    new-instance v4, Ljava/net/URI;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 677
    .local v4, "uri":Ljava/net/URI;
    invoke-virtual {v4}, Ljava/net/URI;->toURL()Ljava/net/URL;
    :try_end_36
    .catch Ljava/net/URISyntaxException; {:try_start_7 .. :try_end_36} :catch_57
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_36} :catch_65

    move-result-object v5

    .line 687
    .end local v1    # "path":Ljava/lang/String;
    .end local v4    # "uri":Ljava/net/URI;
    :goto_37
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 688
    .local v2, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 689
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 691
    if-eqz p2, :cond_4f

    .line 692
    iget-object v6, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    if-nez v6, :cond_70

    const-string v6, "*"

    :goto_4c
    invoke-virtual {v2, p2, v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    :cond_4f
    const-string v6, "Accept"

    const-string v7, "application/vnd.adobe.ccv.videometadata"

    invoke-virtual {v2, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    return-object v2

    .line 678
    .end local v2    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :catch_57
    move-exception v0

    .line 680
    .local v0, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    .line 681
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v7, "AssetStorage.requestRendition"

    const-string v8, "URISyntaxException"

    invoke-static {v6, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_37

    .line 682
    .end local v0    # "e":Ljava/net/URISyntaxException;
    :catch_65
    move-exception v0

    .line 684
    .local v0, "e":Ljava/net/MalformedURLException;
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v7, "AssetStorage.requestRendition"

    const-string v8, "MalformedURLException"

    invoke-static {v6, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_37

    .line 692
    .end local v0    # "e":Ljava/net/MalformedURLException;
    .restart local v2    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :cond_70
    iget-object v6, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    goto :goto_4c
.end method


# virtual methods
.method public cancelRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V
    .registers 3
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .prologue
    .line 442
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 443
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->cancel()V

    .line 444
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    :cond_18
    return-void
.end method

.method public createDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 6
    .param p1, "dir"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    .prologue
    .line 1467
    const/4 v0, 0x0

    .line 1469
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_b

    .line 1474
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->createDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2

    .line 1470
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_b
    move-exception v1

    .line 1471
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public createDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 10
    .param p1, "dir"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    .param p3, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v2, 0x0

    .line 1419
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPUT:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const/4 v3, 0x1

    invoke-virtual {p0, p1, v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    .line 1420
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$11;

    invoke-direct {v4, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$11;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)V

    .local v4, "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    move-object v0, p0

    move-object v3, v2

    move-object v5, p3

    .line 1460
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1461
    return-object v1
.end method

.method public eraseAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 9
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "deleteCallback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    .prologue
    const/4 v5, 0x0

    .line 897
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getHref()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    .line 898
    .local v1, "assetHref":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 899
    .local v2, "lastIndex":I
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 900
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/archive/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 901
    .local v0, "archiveLocation":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 902
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 903
    :cond_44
    invoke-direct {p0, v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->moveAssetUtil(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    return-object v3
.end method

.method getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 3
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 600
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    return-object v0
.end method

.method getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 10
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 613
    const/4 v0, 0x0

    .line 614
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    if-nez p1, :cond_24

    .line 615
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorCancelled:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    const/4 v3, -0x1

    invoke-static {v2, v4, v4, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 639
    :cond_b
    :goto_b
    if-nez v0, :cond_23

    .line 640
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 641
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 640
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 643
    :cond_23
    return-object v0

    .line 617
    :cond_24
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0x19c

    if-ne v2, v3, :cond_43

    .line 618
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorConflictingChanges:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 619
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 618
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    goto :goto_b

    .line 620
    :cond_43
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0x1fb

    if-ne v2, v3, :cond_62

    .line 621
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorExceededQuota:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 622
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 621
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    goto :goto_b

    .line 623
    :cond_62
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0x19f

    if-ne v2, v3, :cond_81

    .line 624
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnsupportedMedia:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 625
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 624
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    goto :goto_b

    .line 626
    :cond_81
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0x194

    if-ne v2, v3, :cond_b

    .line 627
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 628
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->createAndGetNetworkReachability()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v1

    .line 629
    .local v1, "sharedNetworkReachability":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->startNotification(Landroid/content/Context;)Z

    .line 630
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v2

    if-nez v2, :cond_be

    .line 631
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorOffline:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 632
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 631
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 634
    :cond_be
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->stopNotification()V

    goto/16 :goto_b
.end method

.method public getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 7
    .param p1, "dir"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "mode"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;
    .param p3, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    .prologue
    .line 1396
    const/4 v0, 0x0

    .line 1398
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_b

    .line 1403
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2

    .line 1399
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_b
    move-exception v1

    .line 1400
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 15
    .param p1, "dir"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "mode"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;
    .param p3, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    .param p4, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 1327
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    if-ne p2, v0, :cond_31

    .line 1328
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->resetPageIndex()V

    .line 1339
    :goto_a
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    if-eqz v0, :cond_59

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getChildren()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_59

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    if-ne p2, v0, :cond_59

    move v9, v6

    .line 1340
    .local v9, "useEtag":Z
    :goto_19
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-eqz v9, :cond_5b

    const-string v3, "If-None-Match"

    :goto_1f
    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;ZLjava/util/ArrayList;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v4

    .line 1342
    .local v4, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;

    invoke-direct {v7, p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)V

    .local v7, "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    move-object v3, p0

    move-object v6, v5

    move-object v8, p4

    .line 1387
    invoke-virtual/range {v3 .. v8}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1388
    return-object v4

    .line 1330
    .end local v4    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v7    # "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v9    # "useEtag":Z
    :cond_31
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageAppend:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    if-eq p2, v0, :cond_39

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    if-ne p2, v0, :cond_42

    .line 1332
    :cond_39
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "StorageSession.getDirectory"

    const-string v2, "Unexpected Paging mode"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1333
    :cond_42
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->isComplete()Z

    move-result v0

    if-nez v0, :cond_51

    .line 1334
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "StorageSession.getDirectory"

    const-string v2, "Specified Paging mode should only be used with an incomplete collection that was populated by a previous request"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1336
    :cond_51
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getNextStartIndex()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setStartIndex(Ljava/lang/String;)V

    goto :goto_a

    :cond_59
    move v9, v4

    .line 1339
    goto :goto_19

    .restart local v9    # "useEtag":Z
    :cond_5b
    move-object v3, v5

    .line 1340
    goto :goto_1f
.end method

.method public getFile(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;Landroid/os/Handler;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 11
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;
    .param p3, "callBackRequiredForHandler"    # Landroid/os/Handler;
    .param p4, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 2115
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    if-nez v0, :cond_25

    move-object v0, v3

    :goto_8
    const/4 v5, 0x0

    invoke-virtual {p0, p1, v2, v0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    .line 2116
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    const-string v0, "Accept-Encoding"

    const-string v2, ""

    invoke-virtual {v1, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 2117
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;

    invoke-direct {v4, p0, p1, p4, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$20;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;)V

    .line 2163
    .local v4, "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    if-nez p4, :cond_28

    .line 2164
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 2168
    :goto_24
    return-object v1

    .line 2115
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v4    # "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    :cond_25
    const-string v0, "If-None-Match"

    goto :goto_8

    .restart local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .restart local v4    # "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    :cond_28
    move-object v0, p0

    move-object v2, p4

    move-object v5, p3

    .line 2166
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_24
.end method

.method public getFile(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 7
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;
    .param p3, "path"    # Ljava/lang/String;

    .prologue
    .line 2174
    const/4 v0, 0x0

    .line 2176
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_b

    .line 2181
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getFile(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageResourceRequestCompletionHandler;Landroid/os/Handler;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2

    .line 2177
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_b
    move-exception v1

    .line 2178
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public getQuotaInformationOnCompletion(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;Landroid/os/Handler;)V
    .registers 12
    .param p1, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v2, 0x0

    .line 763
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$5;

    invoke-direct {v3, p0, p2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Landroid/os/Handler;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;)V

    const-string v4, "Getting the quota requires an authenticated user."

    invoke-virtual {v0, v3, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->checkAndCallErrorIfInvalidAccessToken(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 857
    :goto_12
    return-void

    .line 784
    :cond_13
    const/4 v7, 0x0

    .line 786
    .local v7, "url":Ljava/net/URL;
    :try_start_14
    const-string v0, "/profile/quota"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForURI(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v6

    .line 787
    .local v6, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    new-instance v8, Ljava/net/URL;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/profile/quota"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3a
    .catch Ljava/net/MalformedURLException; {:try_start_14 .. :try_end_3a} :catch_54

    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    move-object v7, v8

    .line 791
    .end local v6    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_3b
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 792
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v1, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 793
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 795
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;

    invoke-direct {v4, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;Landroid/os/Handler;)V

    move-object v0, p0

    move-object v3, v2

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_12

    .line 788
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :catch_54
    move-exception v0

    goto :goto_3b
.end method

.method public getRendition(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;ILjava/lang/String;ILcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 14
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "pixels"    # I
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "page"    # I
    .param p5, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    .prologue
    .line 2080
    const/4 v6, 0x0

    .line 2082
    .local v6, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v6, Landroid/os/Handler;

    .end local v6    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v6}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_11

    .restart local v6    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    .line 2087
    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getRendition(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;ILjava/lang/String;ILcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    return-object v0

    .line 2083
    .end local v6    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_11
    move-exception v7

    .line 2084
    .local v7, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    .restart local v6    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public getRendition(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;ILjava/lang/String;ILcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 14
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "pixels"    # I
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "page"    # I
    .param p5, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    .param p6, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v6, 0x0

    .line 2023
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    if-nez v0, :cond_20

    move-object v5, v6

    :goto_6
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestRenditionFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;IILjava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    .line 2024
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;

    invoke-direct {v4, p0, p5, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;)V

    .line 2071
    .local v4, "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v3, v6

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    return-object v0

    .line 2023
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v4    # "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    :cond_20
    const-string v5, "If-None-Match"

    goto :goto_6
.end method

.method public getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 12
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "callback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    .prologue
    .line 451
    const/4 v5, 0x0

    .line 453
    .local v5, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v5, Landroid/os/Handler;

    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v5}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_10

    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 458
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    return-object v0

    .line 454
    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_10
    move-exception v6

    .line 455
    .local v6, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 18
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "sessionClient"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .param p5, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 473
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForURI(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    .line 474
    .local v1, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v1, :cond_3b

    .line 476
    const-string v9, "Adobe cloud not specified."

    .line 478
    .local v9, "errorMsg":Ljava/lang/String;
    if-eqz p4, :cond_2f

    .line 480
    new-instance v8, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v8, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 481
    .local v8, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p5, :cond_29

    .line 482
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$1;

    move-object/from16 v0, p4

    invoke-direct {v2, p0, v0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 497
    .end local v8    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :goto_27
    const/4 v10, 0x0

    .line 560
    .end local v9    # "errorMsg":Ljava/lang/String;
    :goto_28
    return-object v10

    .line 489
    .restart local v8    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .restart local v9    # "errorMsg":Ljava/lang/String;
    :cond_29
    move-object/from16 v0, p4

    invoke-interface {v0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_27

    .line 494
    .end local v8    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_2f
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_27

    .line 500
    .end local v9    # "errorMsg":Ljava/lang/String;
    :cond_3b
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->checkEntitlements()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    move-result-object v7

    .line 501
    .local v7, "entitlementError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz v7, :cond_69

    .line 503
    if-eqz p4, :cond_59

    .line 504
    if-eqz p5, :cond_53

    .line 505
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$2;

    move-object/from16 v0, p4

    invoke-direct {v2, p0, v0, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 517
    :goto_51
    const/4 v10, 0x0

    goto :goto_28

    .line 512
    :cond_53
    move-object/from16 v0, p4

    invoke-interface {v0, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_51

    .line 515
    :cond_59
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Entitlement Check failed"

    invoke-static {v2, v3, v4, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_51

    .line 520
    :cond_69
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$3;

    move-object/from16 v0, p4

    invoke-direct {v5, p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)V

    .line 535
    .local v5, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 537
    if-nez p2, :cond_9a

    .line 538
    if-eqz p3, :cond_82

    .line 539
    invoke-virtual {p1, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody([B)V

    .line 540
    :cond_82
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object/from16 v0, p5

    invoke-virtual {v1, p1, v2, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v10

    .line 550
    .local v10, "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :goto_8a
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestMap:Ljava/util/Map;

    invoke-interface {v2, p1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    new-instance v11, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;

    move-object/from16 v0, p4

    invoke-direct {v11, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)V

    .line 558
    .local v11, "listener":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    invoke-virtual {v10, v11}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->registerListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V

    goto :goto_28

    .line 541
    .end local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .end local v11    # "listener":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    :cond_9a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v2, v3, :cond_ad

    .line 542
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v10

    .restart local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_8a

    .line 544
    .end local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_ad
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodHEAD:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v2, v3, :cond_be

    .line 545
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object/from16 v0, p5

    invoke-virtual {v1, p1, v2, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v10

    .restart local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_8a

    .line 547
    .end local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_be
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v10

    .restart local v10    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_8a
.end method

.method protected getServiceForURI(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .registers 9
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 230
    const-string v4, "files"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    .line 232
    .local v1, "result":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    const/4 v2, 0x0

    .line 234
    .local v2, "url":Ljava/net/URL;
    :try_start_7
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_c} :catch_66

    .end local v2    # "url":Ljava/net/URL;
    .local v3, "url":Ljava/net/URL;
    move-object v2, v3

    .line 239
    .end local v3    # "url":Ljava/net/URL;
    .restart local v2    # "url":Ljava/net/URL;
    :goto_d
    if-eqz v2, :cond_46

    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_44

    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p1

    .end local p1    # "uri":Ljava/lang/String;
    move-object v0, p1

    .line 241
    .local v0, "path":Ljava/lang/String;
    :goto_1a
    const-string v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2e

    .line 243
    const-string v4, "/%s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 246
    :cond_2e
    const-string v4, "/archive"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_48

    .line 248
    const-string v4, "archive"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    .line 250
    if-nez v1, :cond_43

    .line 251
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    .line 263
    :cond_43
    :goto_43
    return-object v1

    .end local v0    # "path":Ljava/lang/String;
    .restart local p1    # "uri":Ljava/lang/String;
    :cond_44
    move-object v0, p1

    .line 239
    goto :goto_1a

    :cond_46
    move-object v0, p1

    goto :goto_1a

    .line 254
    .end local p1    # "uri":Ljava/lang/String;
    .restart local v0    # "path":Ljava/lang/String;
    :cond_48
    const-string v4, "/assets/adobe-libraries"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_57

    .line 256
    const-string v4, "libraries"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    goto :goto_43

    .line 258
    :cond_57
    const-string v4, "/assets"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 260
    const-string v4, "assets"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v1

    goto :goto_43

    .line 235
    .end local v0    # "path":Ljava/lang/String;
    .restart local p1    # "uri":Ljava/lang/String;
    :catch_66
    move-exception v4

    goto :goto_d
.end method

.method getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 7
    .param p1, "err"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 648
    const/4 v0, 0x0

    .line 650
    .local v0, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorOffline:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v1, v2, :cond_12

    .line 652
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorOffline:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-static {v1, v3, v3, v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 667
    :goto_11
    return-object v1

    .line 655
    :cond_12
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v1, v2, :cond_21

    .line 657
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-static {v1, v3, v3, v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    goto :goto_11

    .line 659
    :cond_21
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorTimeout:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v1, v2, :cond_30

    .line 660
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorTimeout:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-static {v1, v3, v3, v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    goto :goto_11

    .line 663
    :cond_30
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_51

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "Response"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 665
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "Response"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-object v0, v1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .line 667
    :cond_51
    invoke-virtual {p0, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    goto :goto_11
.end method

.method public getVideoMetadata(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 7
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    .prologue
    .line 1890
    const/4 v0, 0x0

    .line 1892
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_b

    .line 1897
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2

    .line 1893
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_b
    move-exception v1

    .line 1894
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method public getVideoMetadata(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 12
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;
    .param p4, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v2, 0x0

    .line 1947
    const-string v0, "application/vnd.adobe.ccv.videometadata"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "video/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 1949
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnsupportedMedia:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-direct {v6, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;)V

    .line 1950
    .local v6, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-interface {p3, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    .line 1990
    .end local v6    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :goto_1b
    return-object v2

    .line 1953
    :cond_1c
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->etag:Ljava/lang/String;

    if-eqz v0, :cond_33

    const-string v0, "If-None-Match"

    :goto_22
    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestVideoMetadataFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    .line 1955
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$18;

    invoke-direct {v4, p0, p3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$18;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;)V

    .local v4, "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    move-object v0, p0

    move-object v3, v2

    move-object v5, p4

    .line 1989
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-object v2, v1

    .line 1990
    goto :goto_1b

    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v4    # "responsehandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    :cond_33
    move-object v0, v2

    .line 1953
    goto :goto_22
.end method

.method protected isCacheConfigured()Z
    .registers 2

    .prologue
    .line 224
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->_cacheConfigured:Z

    return v0
.end method

.method public moveAsset(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 8
    .param p1, "targetLocation"    # Ljava/lang/String;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p3, "editAssetCallback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    .prologue
    .line 908
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v0

    .line 909
    .local v0, "fileName":Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 910
    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 911
    :cond_17
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getValidatedAssetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 912
    .local v1, "newFileLocation":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->moveAssetUtil(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2
.end method

.method public renameAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 13
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "renameCallback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    .prologue
    const/4 v7, 0x0

    .line 861
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getParentHref()Ljava/net/URI;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 862
    .local v0, "assetHref":Ljava/lang/String;
    const/4 v2, 0x0

    .line 870
    .local v2, "extension":Ljava/lang/String;
    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getValidatedAssetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 871
    .local v6, "validName":Ljava/lang/String;
    if-nez v6, :cond_1a

    .line 873
    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorBadRequest:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-static {v8, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;->createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 874
    .local v1, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-interface {p3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 887
    .end local v1    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :goto_19
    return-object v7

    .line 877
    :cond_1a
    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v7, :cond_2f

    .line 879
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v3

    .line 880
    .local v3, "name":Ljava/lang/String;
    const-string v7, "."

    invoke-virtual {v3, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    .line 881
    .local v5, "pathIndex":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_2f

    .line 882
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 884
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "pathIndex":I
    :cond_2f
    if-eqz v2, :cond_35

    .line 885
    invoke-virtual {v6, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 886
    :cond_35
    invoke-virtual {v0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 887
    .local v4, "newFileName":Ljava/lang/String;
    invoke-direct {p0, v4, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->moveAssetUtil(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v7

    goto :goto_19
.end method

.method public requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 12
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    .param p2, "method"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p3, "etagHeaderField"    # Ljava/lang/String;
    .param p4, "setContentType"    # Z

    .prologue
    .line 348
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;ZLjava/util/ArrayList;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;ZLjava/util/ArrayList;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 25
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    .param p2, "method"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p3, "etagHeaderField"    # Ljava/lang/String;
    .param p4, "setContentType"    # Z
    .param p6, "ignoreCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;"
        }
    .end annotation

    .prologue
    .line 372
    .local p5, "xUpdateValues":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->href:Ljava/net/URI;

    invoke-virtual {v14}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForURI(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v9

    .line 373
    .local v9, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    new-instance v11, Ljava/net/URI;

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->href:Ljava/net/URI;

    invoke-virtual {v14}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v15

    invoke-virtual {v15}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 376
    .local v11, "uri":Ljava/net/URI;
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->isCollection:Z

    .line 377
    .local v5, "isCollection":Z
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->toString()Ljava/lang/String;

    move-result-object v6

    .line 378
    .local v6, "methodString":Ljava/lang/String;
    if-eqz v5, :cond_69

    const-string v14, "AdobeNetworkHttpRequestMethodGET"

    invoke-virtual {v6, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_69

    .line 380
    move-object/from16 v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-object v2, v0

    .line 382
    .local v2, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getPercentEncodedQuery()Ljava/lang/String;

    move-result-object v7

    .line 384
    .local v7, "pQuery":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_69

    .line 385
    new-instance v12, Ljava/net/URI;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "?"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .end local v11    # "uri":Ljava/net/URI;
    .local v12, "uri":Ljava/net/URI;
    move-object v11, v12

    .line 388
    .end local v2    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v7    # "pQuery":Ljava/lang/String;
    .end local v12    # "uri":Ljava/net/URI;
    .restart local v11    # "uri":Ljava/net/URI;
    :cond_69
    invoke-virtual {v11}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v13

    .line 389
    .local v13, "url":Ljava/net/URL;
    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 390
    .local v8, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v8, v13}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 391
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 407
    if-eqz p3, :cond_89

    .line 408
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->etag:Ljava/lang/String;

    if-nez v14, :cond_c7

    const-string v14, "*"

    :goto_84
    move-object/from16 v0, p3

    invoke-virtual {v8, v0, v14}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    :cond_89
    if-eqz p4, :cond_9a

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->type:Ljava/lang/String;

    if-eqz v14, :cond_9a

    .line 411
    const-string v14, "Content-Type"

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->type:Ljava/lang/String;

    invoke-virtual {v8, v14, v15}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    :cond_9a
    if-eqz p5, :cond_dc

    .line 413
    const-string v10, ""

    .line 414
    .local v10, "updateStr":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_9f
    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v4, v14, :cond_cc

    .line 415
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 414
    add-int/lit8 v4, v4, 0x1

    goto :goto_9f

    .line 408
    .end local v4    # "i":I
    .end local v10    # "updateStr":Ljava/lang/String;
    :cond_c7
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->etag:Ljava/lang/String;

    goto :goto_84

    .line 417
    .restart local v4    # "i":I
    .restart local v10    # "updateStr":Ljava/lang/String;
    :cond_cc
    const/4 v14, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    invoke-virtual {v10, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 418
    const-string v14, "X-Update"

    invoke-virtual {v8, v14, v10}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    .end local v4    # "i":I
    .end local v10    # "updateStr":Ljava/lang/String;
    :cond_dc
    if-eqz p5, :cond_f7

    const-string v14, "X-Ordinal"

    move-object/from16 v0, p5

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f7

    .line 421
    const-string v14, "X-Ordinal"

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->ordinal:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v14, v15}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f7
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_f7} :catch_f8
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_f7} :catch_fe

    .line 437
    .end local v5    # "isCollection":Z
    .end local v6    # "methodString":Ljava/lang/String;
    .end local v8    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v9    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v11    # "uri":Ljava/net/URI;
    .end local v13    # "url":Ljava/net/URL;
    :cond_f7
    :goto_f7
    return-object v8

    .line 430
    :catch_f8
    move-exception v3

    .line 432
    .local v3, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v3}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 437
    .end local v3    # "e":Ljava/net/MalformedURLException;
    :goto_fc
    const/4 v8, 0x0

    goto :goto_f7

    .line 433
    :catch_fe
    move-exception v3

    .line 435
    .local v3, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v3}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_fc
.end method

.method public setUpService()V
    .registers 10

    .prologue
    .line 186
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->isCacheConfigured()Z

    move-result v1

    if-nez v1, :cond_2f

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2f

    .line 190
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-static {v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v6

    .line 191
    .local v6, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    const/4 v8, 0x0

    .line 193
    .local v8, "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :try_start_1d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v1

    const-string v2, "com.adobe.cc.storage"

    const/16 v3, 0x64

    const-wide/high16 v4, 0x41a0000000000000L

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->configureCache(Ljava/lang/String;IDLjava/util/EnumSet;)V
    :try_end_2a
    .catch Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException; {:try_start_1d .. :try_end_2a} :catch_30

    .line 197
    :goto_2a
    if-eqz v8, :cond_33

    .line 198
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->_cacheConfigured:Z

    .line 205
    .end local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .end local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_2f
    :goto_2f
    return-void

    .line 194
    .restart local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .restart local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :catch_30
    move-exception v7

    .line 195
    .local v7, "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    move-object v8, v7

    goto :goto_2a

    .line 202
    .end local v7    # "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_33
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2f
.end method

.method public tearDownService()V
    .registers 4

    .prologue
    .line 209
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 210
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.storage"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->doesCacheExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 212
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.storage"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->printStatistics(Ljava/lang/String;)V

    .line 214
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.storage"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeCache(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 216
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Removal of cache failed"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    :cond_31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->_cacheConfigured:Z

    .line 221
    return-void
.end method
