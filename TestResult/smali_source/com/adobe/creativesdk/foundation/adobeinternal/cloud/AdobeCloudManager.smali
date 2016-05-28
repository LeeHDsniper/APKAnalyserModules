.class public Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
.super Ljava/lang/Object;
.source "AdobeCloudManager.java"

# interfaces
.implements Ljava/util/Observer;


# static fields
.field private static _sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;


# instance fields
.field private _clouds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;"
        }
    .end annotation
.end field

.field private _defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _ignoreNotification:Z

.field private _syncObject:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    return-void
.end method

.method protected constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_ignoreNotification:Z

    .line 63
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_syncObject:Ljava/lang/Object;

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    .line 145
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 146
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_syncObject:Ljava/lang/Object;

    .line 147
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 148
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntilementUserProfileDataFetchNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 149
    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    return-object v0
.end method

.method private static fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 8
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    .line 75
    .local v0, "data":[B
    new-instance v2, Ljava/io/ObjectInputStream;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 77
    .local v2, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 78
    .local v1, "o":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "AdobeCloudManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Adobe Cloud being retrieved from cache ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    .line 80
    return-object v1
.end method

.method private getBestGuessForDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 5

    .prologue
    .line 532
    const/4 v1, 0x0

    .line 533
    .local v1, "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_11

    .line 534
    :cond_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->refreshCloudsFromCache()V

    .line 548
    :cond_10
    :goto_10
    return-object v1

    .line 536
    :cond_11
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_24

    .line 537
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .restart local v1    # "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    goto :goto_10

    .line 540
    :cond_24
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 541
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 542
    move-object v1, v0

    .line 543
    goto :goto_10
.end method

.method public static getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    .registers 12

    .prologue
    .line 97
    const-class v9, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    monitor-enter v9

    .line 98
    :try_start_3
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    if-nez v8, :cond_7e

    .line 99
    new-instance v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-direct {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;-><init>()V

    sput-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    .line 101
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "guid":Ljava/lang/String;
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v8}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v5

    .line 104
    .local v5, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v8

    const-string v10, "profile"

    const-string v11, "com.adobe.cc.entitlements"

    invoke-virtual {v8, v2, v10, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->containsItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_90

    move-result v8

    if-eqz v8, :cond_7e

    .line 106
    const/4 v6, 0x0

    .line 108
    .local v6, "profileData":Lorg/json/JSONObject;
    :try_start_2b
    new-instance v7, Lorg/json/JSONObject;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v8

    const-string v10, "profile"

    const-string v11, "com.adobe.cc.entitlements"

    invoke-virtual {v8, v2, v10, v5, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3e
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_3e} :catch_82
    .catchall {:try_start_2b .. :try_end_3e} :catchall_90

    .end local v6    # "profileData":Lorg/json/JSONObject;
    .local v7, "profileData":Lorg/json/JSONObject;
    move-object v6, v7

    .line 112
    .end local v7    # "profileData":Lorg/json/JSONObject;
    .restart local v6    # "profileData":Lorg/json/JSONObject;
    :goto_3f
    const/4 v4, 0x1

    .line 113
    .local v4, "hasAccessToPublicStorage":Z
    :try_start_40
    const-string v8, "public_cloud"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_4e

    .line 115
    const-string v8, "public_cloud"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 117
    :cond_4e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v8

    invoke-virtual {v8, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPublicStorageServices(Z)V

    .line 119
    const/4 v3, 0x1

    .line 120
    .local v3, "hasAccessToPrivateStorage":Z
    const-string v8, "private_cloud"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_64

    .line 122
    const-string v8, "private_cloud"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 124
    :cond_64
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v8

    invoke-virtual {v8, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPrivateStorageServices(Z)V

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_70
    .catchall {:try_start_40 .. :try_end_70} :catchall_90

    .line 128
    .local v0, "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :try_start_70
    invoke-static {v6, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->getCloudsFromUserProfile(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z

    .line 129
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_7e

    .line 131
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateClouds(Ljava/util/ArrayList;)V
    :try_end_7e
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_70 .. :try_end_7e} :catch_93
    .catchall {:try_start_70 .. :try_end_7e} :catchall_90

    .line 139
    .end local v0    # "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    .end local v3    # "hasAccessToPrivateStorage":Z
    .end local v4    # "hasAccessToPublicStorage":Z
    .end local v6    # "profileData":Lorg/json/JSONObject;
    :cond_7e
    :goto_7e
    :try_start_7e
    monitor-exit v9
    :try_end_7f
    .catchall {:try_start_7e .. :try_end_7f} :catchall_90

    .line 140
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    return-object v8

    .line 109
    .restart local v6    # "profileData":Lorg/json/JSONObject;
    :catch_82
    move-exception v1

    .line 110
    .local v1, "e":Lorg/json/JSONException;
    :try_start_83
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v8, v10, v11, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3f

    .line 139
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v5    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .end local v6    # "profileData":Lorg/json/JSONObject;
    :catchall_90
    move-exception v8

    monitor-exit v9
    :try_end_92
    .catchall {:try_start_83 .. :try_end_92} :catchall_90

    throw v8

    .line 134
    .restart local v0    # "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    .restart local v3    # "hasAccessToPrivateStorage":Z
    .restart local v4    # "hasAccessToPublicStorage":Z
    .restart local v5    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .restart local v6    # "profileData":Lorg/json/JSONObject;
    :catch_93
    move-exception v1

    .line 135
    .local v1, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    :try_start_94
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v8, v10, v11, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    :try_end_a0
    .catchall {:try_start_94 .. :try_end_a0} :catchall_90

    goto :goto_7e
.end method

.method private static toString(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Ljava/lang/String;
    .registers 7
    .param p0, "o"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "AdobeCloudManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Adobe Cloud being saved to cache ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 87
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 88
    .local v1, "oos":Ljava/io/ObjectOutputStream;
    invoke-virtual {v1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 89
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V

    .line 90
    new-instance v2, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    return-object v2
.end method


# virtual methods
.method protected addCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 3
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 323
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 325
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 327
    :cond_b
    return-void
.end method

.method protected getCloudsFromCache()Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;"
        }
    .end annotation

    .prologue
    .line 553
    const/4 v4, 0x0

    .line 554
    .local v4, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileFromCache()Lorg/json/JSONObject;

    move-result-object v0

    .line 556
    .local v0, "cachedUserProfile":Lorg/json/JSONObject;
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v7, "AdobeCloudManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "The cached userprofile information = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v0, :cond_5f

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1e
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v7, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    if-eqz v0, :cond_3c

    .line 560
    new-instance v2, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 562
    .local v2, "clouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :try_start_32
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->getCloudsFromUserProfile(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z
    :try_end_35
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_32 .. :try_end_35} :catch_62

    .line 567
    :goto_35
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_3c

    .line 568
    move-object v4, v2

    .line 572
    .end local v2    # "clouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :cond_3c
    if-eqz v4, :cond_5e

    .line 573
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_42
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 574
    .local v1, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->isCloudValid(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v6

    if-nez v6, :cond_42

    .line 575
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "AdobeCloudManager"

    const-string v7, "Should not hit this condition"

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    const/4 v4, 0x0

    .line 581
    .end local v1    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_5e
    return-object v4

    .line 556
    :cond_5f
    const-string v5, ""

    goto :goto_1e

    .line 563
    .restart local v2    # "clouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :catch_62
    move-exception v3

    .line 564
    .local v3, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_35
.end method

.method public getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 214
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v4, :cond_2d

    .line 217
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAdobeApplication()Z

    move-result v4

    if-eqz v4, :cond_81

    .line 220
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v3

    .line 221
    .local v3, "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    const-string v4, "defaultCloud"

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 224
    .local v2, "encodedCloudB64":Ljava/lang/String;
    if-eqz v2, :cond_7a

    .line 226
    const/4 v0, 0x0

    .line 228
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :try_start_1c
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1f} :catch_54
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1c .. :try_end_1f} :catch_61

    move-result-object v0

    .line 235
    :goto_20
    if-eqz v0, :cond_6e

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->isCloudValid(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 237
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->addCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 238
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 263
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v2    # "encodedCloudB64":Ljava/lang/String;
    .end local v3    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    :cond_2d
    :goto_2d
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-eqz v4, :cond_51

    .line 264
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "AdobeCloudManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Getting default cloud ="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    :cond_51
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v4

    .line 229
    .restart local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .restart local v2    # "encodedCloudB64":Ljava/lang/String;
    .restart local v3    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    :catch_54
    move-exception v1

    .line 230
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_20

    .line 231
    .end local v1    # "e":Ljava/io/IOException;
    :catch_61
    move-exception v1

    .line 232
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_20

    .line 242
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :cond_6e
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "AdobeCloudManager"

    const-string v6, "Should not hit this condition"

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    goto :goto_2d

    .line 247
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_7a
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getBestGuessForDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    goto :goto_2d

    .line 252
    .end local v2    # "encodedCloudB64":Ljava/lang/String;
    .end local v3    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    :cond_81
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;-><init>()V

    .line 253
    .restart local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    const-string v4, "00000000-0000-0000-0000-000000000000"

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setGUID(Ljava/lang/String;)V

    .line 254
    const-string v4, "Adobe Creative Cloud"

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setName(Ljava/lang/String;)V

    .line 255
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setAvailable(Z)V

    .line 256
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setPrivateCloud(Z)V

    .line 258
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->addCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 259
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    goto :goto_2d
.end method

.method public getMatchingCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 6
    .param p1, "serializedCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    const/4 v1, 0x0

    .line 515
    if-nez p1, :cond_5

    move-object v0, v1

    .line 527
    :goto_4
    return-object v0

    .line 518
    :cond_5
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    if-eqz v2, :cond_11

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_13

    :cond_11
    move-object v0, v1

    .line 519
    goto :goto_4

    .line 521
    :cond_13
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 522
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    goto :goto_4

    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_2c
    move-object v0, v1

    .line 527
    goto :goto_4
.end method

.method public refreshClouds(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V
    .registers 10
    .param p3, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 440
    .local p1, "successBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;>;"
    .local p2, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object v1, p0

    .line 454
    .local v1, "self":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 455
    .local v0, "ims":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_ignoreNotification:Z

    .line 456
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    move-result-object v2

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;

    invoke-direct {v4, p0, v1, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$1;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;

    invoke-direct {v5, p0, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager$2;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    invoke-virtual {v2, v3, v4, v5, p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileForToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 511
    return-void
.end method

.method protected refreshCloudsFromCache()V
    .registers 2

    .prologue
    .line 586
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getCloudsFromCache()Ljava/util/ArrayList;

    move-result-object v0

    .line 588
    .local v0, "cachedClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    if-eqz v0, :cond_9

    .line 589
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateClouds(Ljava/util/ArrayList;)V

    .line 591
    :cond_9
    return-void
.end method

.method public setDefaultCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 13
    .param p1, "defaultCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 272
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_syncObject:Ljava/lang/Object;

    monitor-enter v7

    .line 274
    if-eqz p1, :cond_23

    .line 275
    :try_start_5
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v8, "AdobeCloudManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Getting default cloud ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    :cond_23
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-eqz v6, :cond_54

    if-eqz p1, :cond_54

    .line 279
    const/4 v1, 0x0

    .line 282
    .local v1, "cloudsArrayContainsDefaultCloud":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_30
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_45

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 283
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v8

    if-eqz v8, :cond_30

    .line 284
    const/4 v1, 0x1

    .line 290
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_45
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {p1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v6

    if-nez v6, :cond_54

    if-nez v1, :cond_54

    .line 291
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->removeAllServices()V

    .line 295
    .end local v1    # "cloudsArrayContainsDefaultCloud":Z
    :cond_54
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 296
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAdobeApplication()Z
    :try_end_5d
    .catchall {:try_start_5 .. :try_end_5d} :catchall_8f

    move-result v6

    if-eqz v6, :cond_83

    .line 297
    if-eqz p1, :cond_85

    .line 298
    const/4 v3, 0x0

    .line 300
    .local v3, "encodedCloudB64":Ljava/lang/String;
    :try_start_63
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->toString(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Ljava/lang/String;
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_66} :catch_92
    .catchall {:try_start_63 .. :try_end_66} :catchall_8f

    move-result-object v3

    .line 305
    :goto_67
    :try_start_67
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v4

    .line 306
    .local v4, "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    const-string v6, "defaultCloud"

    invoke-virtual {v4, v6, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->updateOrAddKey(Ljava/lang/String;Ljava/lang/Object;)V

    .line 311
    .end local v3    # "encodedCloudB64":Ljava/lang/String;
    :goto_70
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 312
    .local v5, "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCloudManagerDefaultCloudUpdatedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v2, v6, v5}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 316
    .local v2, "cloudsUpdatedNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 318
    .end local v2    # "cloudsUpdatedNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    .end local v4    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    .end local v5    # "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_83
    monitor-exit v7

    .line 319
    return-void

    .line 308
    :cond_85
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v4

    .line 309
    .restart local v4    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    const-string v6, "defaultCloud"

    invoke-virtual {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    goto :goto_70

    .line 318
    .end local v4    # "sharedKeychain":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;
    :catchall_8f
    move-exception v6

    monitor-exit v7
    :try_end_91
    .catchall {:try_start_67 .. :try_end_91} :catchall_8f

    throw v6

    .line 301
    .restart local v3    # "encodedCloudB64":Ljava/lang/String;
    :catch_92
    move-exception v6

    goto :goto_67
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 360
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 362
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    if-eqz v1, :cond_10

    .line 364
    const-string v1, "clouds"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    :cond_10
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-eqz v1, :cond_1b

    .line 370
    const-string v1, "defaultCloud"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    :cond_1b
    invoke-virtual {v0}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 16
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 153
    move-object v7, p2

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 154
    .local v7, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v10

    sget-object v11, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v10, v11, :cond_31

    .line 155
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v10

    if-nez v10, :cond_31

    .line 157
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_17
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_27

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 158
    .local v1, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->removeAllServices()V

    goto :goto_17

    .line 160
    .end local v1    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_27
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 161
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->setDefaultCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 208
    :cond_30
    :goto_30
    return-void

    .line 162
    :cond_31
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v10

    sget-object v11, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntilementUserProfileDataFetchNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v10, v11, :cond_30

    .line 163
    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_ignoreNotification:Z

    if-eqz v10, :cond_41

    .line 164
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_ignoreNotification:Z

    goto :goto_30

    .line 168
    :cond_41
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v6

    .line 169
    .local v6, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "AdobeEntitlementSessionUserProfileData"

    invoke-interface {v6, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 170
    .local v8, "profileData":Lorg/json/JSONObject;
    const/4 v5, 0x1

    .line 171
    .local v5, "hasAccessToPublicStorage":Z
    const/4 v9, 0x1

    .line 173
    .local v9, "profileUnChanged":Z
    const-string v10, "public_cloud"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_5d

    .line 175
    const-string v10, "public_cloud"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    .line 179
    :cond_5d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPublicStorageServices()Z

    move-result v10

    if-ne v5, v10, :cond_be

    const/4 v10, 0x1

    :goto_68
    and-int/2addr v9, v10

    .line 180
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v10

    invoke-virtual {v10, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPublicStorageServices(Z)V

    .line 182
    const/4 v4, 0x1

    .line 183
    .local v4, "hasAccessToPrivateStorage":Z
    const-string v10, "private_cloud"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_7f

    .line 185
    const-string v10, "private_cloud"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 188
    :cond_7f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPrivateStorageServices()Z

    move-result v10

    if-ne v4, v10, :cond_c0

    const/4 v10, 0x1

    :goto_8a
    and-int/2addr v9, v10

    .line 189
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v10

    invoke-virtual {v10, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPrivateStorageServices(Z)V

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .local v0, "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    :try_start_97
    invoke-static {v8, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->getCloudsFromUserProfile(Lorg/json/JSONObject;Ljava/util/ArrayList;)Z

    .line 195
    sget-object v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_sharedManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    iget-object v10, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-static {v0, v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudUtils;->areValuesEqual(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v3

    .line 196
    .local v3, "endPointsUnChanged":Z
    and-int/2addr v9, v3

    .line 199
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_30

    if-nez v3, :cond_30

    .line 201
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateClouds(Ljava/util/ArrayList;)V
    :try_end_ae
    .catch Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException; {:try_start_97 .. :try_end_ae} :catch_af

    goto :goto_30

    .line 204
    .end local v3    # "endPointsUnChanged":Z
    :catch_af
    move-exception v2

    .line 205
    .local v2, "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v11}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v10, v11, v12, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto/16 :goto_30

    .line 179
    .end local v0    # "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    .end local v2    # "e":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    .end local v4    # "hasAccessToPrivateStorage":Z
    :cond_be
    const/4 v10, 0x0

    goto :goto_68

    .line 188
    .restart local v4    # "hasAccessToPrivateStorage":Z
    :cond_c0
    const/4 v10, 0x0

    goto :goto_8a
.end method

.method protected updateCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 7
    .param p1, "newCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 331
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_syncObject:Ljava/lang/Object;

    monitor-enter v3

    .line 333
    :try_start_3
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 334
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    :cond_10
    :goto_10
    monitor-exit v3

    .line 344
    return-void

    .line 337
    :cond_12
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 338
    .local v0, "index":I
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 339
    .local v1, "storedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v4

    if-eq v2, v4, :cond_10

    .line 340
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 343
    .end local v0    # "index":I
    .end local v1    # "storedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :catchall_30
    move-exception v2

    monitor-exit v3
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v2
.end method

.method protected updateClouds(Ljava/util/ArrayList;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "clouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    const/4 v10, 0x0

    .line 378
    const/4 v6, 0x1

    .line 380
    .local v6, "updateClouds":Z
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ne v8, v9, :cond_2b

    .line 382
    const/4 v1, 0x1

    .line 384
    .local v1, "cloudsAreAllTheSame":Z
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_13
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_28

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 385
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_65

    .line 386
    const/4 v1, 0x0

    .line 401
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_28
    :goto_28
    if-eqz v1, :cond_2b

    .line 403
    const/4 v6, 0x0

    .line 407
    .end local v1    # "cloudsAreAllTheSame":Z
    :cond_2b
    if-eqz v6, :cond_64

    .line 409
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_7b

    .line 410
    invoke-virtual {p1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 411
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v8, :cond_4a

    .line 412
    invoke-virtual {p1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->setDefaultCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 425
    :cond_4a
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 426
    .local v7, "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v8, "Clouds"

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCloudManagerCloudsUpdatedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v2, v8, v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 431
    .local v2, "cloudsUpdatedNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 433
    .end local v2    # "cloudsUpdatedNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    .end local v7    # "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_64
    return-void

    .line 391
    .restart local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .restart local v1    # "cloudsAreAllTheSame":Z
    :cond_65
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 392
    .local v3, "index":I
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_clouds:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 393
    .local v5, "storedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v5, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v9

    if-nez v9, :cond_13

    .line 395
    const/4 v1, 0x0

    .line 396
    goto :goto_28

    .line 416
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v1    # "cloudsAreAllTheSame":Z
    .end local v3    # "index":I
    .end local v5    # "storedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_7b
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7f
    :goto_7f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 417
    .local v4, "newCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->updateCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 419
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->_defaultCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v9, :cond_7f

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v9

    if-nez v9, :cond_7f

    .line 421
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->setDefaultCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    goto :goto_7f
.end method
