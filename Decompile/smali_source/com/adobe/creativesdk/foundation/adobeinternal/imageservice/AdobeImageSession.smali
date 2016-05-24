.class public Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;
.super Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.source "AdobeImageSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static TAG:Ljava/lang/String;

.field private static totalPhysicalMemory:J


# instance fields
.field private imageSessionTmpDir:Ljava/lang/String;

.field private requestMap:Ljava/util/Map;
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


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 65
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->$assertionsDisabled:Z

    .line 68
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->totalPhysicalMemory:J

    .line 72
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->TAG:Ljava/lang/String;

    return-void

    .line 65
    :cond_18
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 5
    .param p1, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 123
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->imageSessionTmpDir:Ljava/lang/String;

    .line 124
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->createTmpDir()Ljava/lang/String;

    .line 126
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->setUpService()V

    .line 127
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeImageServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V

    .line 128
    const-wide/16 v0, 0xf

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->setupOngoingConnectionTimer(JZ)V

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->requestMap:Ljava/util/Map;

    .line 130
    return-void
.end method

.method protected static getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 8

    .prologue
    .line 75
    const/4 v4, 0x0

    .line 76
    .local v4, "serviceEndpointURL":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v1

    .line 78
    .local v1, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_40

    .line 93
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "An undefined authentication endpoint has been specified."

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    :goto_21
    const/4 v2, 0x0

    .line 99
    .local v2, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_22
    new-instance v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    const-string v5, "imageservices"

    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object v7, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-direct {v3, v5, v6, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_30
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_30} :catch_3b

    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .local v3, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    move-object v2, v3

    .line 103
    .end local v3    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :goto_31
    return-object v2

    .line 80
    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :pswitch_32
    const-string v4, "https://cc-api-image.adobe.io"

    .line 81
    goto :goto_21

    .line 84
    :pswitch_35
    const-string v4, "https://cc-api-image-stage.adobe.io"

    .line 85
    goto :goto_21

    .line 88
    :pswitch_38
    const-string v4, "https://cc-api-image-labs.adobe.io"

    .line 89
    goto :goto_21

    .line 100
    .restart local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_3b
    move-exception v0

    .line 101
    .local v0, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_31

    .line 78
    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_32
        :pswitch_35
        :pswitch_38
    .end packed-switch
.end method

.method public static getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    .registers 2
    .param p0, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 115
    if-nez p0, :cond_6

    .line 116
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object p0

    .line 119
    :cond_6
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    return-object v0
.end method


# virtual methods
.method protected declared-synchronized createTmpDir()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1303
    monitor-enter p0

    :try_start_1
    const-string v0, "ImageSessionTemp"

    .line 1305
    .local v0, "dirName":Ljava/lang/String;
    invoke-static {}, Lorg/apache/commons/io/FileUtils;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lorg/apache/commons/io/FilenameUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1307
    .local v2, "tmpDir":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1308
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_19

    .line 1309
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 1311
    :cond_19
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 1312
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->imageSessionTmpDir:Ljava/lang/String;

    .line 1314
    :cond_21
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_24
    .catchall {:try_start_1 .. :try_end_24} :catchall_2a

    move-result v3

    if-nez v3, :cond_28

    .line 1315
    const/4 v2, 0x0

    .line 1316
    .end local v2    # "tmpDir":Ljava/lang/String;
    :cond_28
    monitor-exit p0

    return-object v2

    .line 1303
    .end local v0    # "dirName":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    :catchall_2a
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public setUpService()V
    .registers 1

    .prologue
    .line 146
    return-void
.end method

.method public tearDownService()V
    .registers 1

    .prologue
    .line 150
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 151
    return-void
.end method
