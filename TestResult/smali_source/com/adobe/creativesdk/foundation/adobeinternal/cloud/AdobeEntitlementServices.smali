.class public Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
.super Ljava/lang/Object;
.source "AdobeEntitlementServices.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$3;,
        Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    }
.end annotation


# static fields
.field private static _sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;


# instance fields
.field private _accessToPrivateStorageServices:Z

.field private _accessToPublicStorageServices:Z

.field private _ignoreNotification:Z

.field private _servicePrerequisite:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;",
            ">;"
        }
    .end annotation
.end field

.field private _userPublicServices:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 91
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_ignoreNotification:Z

    .line 132
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    .line 133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "private_cloud"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "public_cloud"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "cc_storage"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "behance"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "story"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "phonegap_build"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "lightroom"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisitePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "edge_inspect"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "premiere_clip"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "image"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "extract"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "preview"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "allow_mobile"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "file_sync"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "collaboration"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "storage"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "libraries"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "design_assets"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "color"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "sync_settings"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    const-string v1, "sync_metadata"

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteNone:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntilementUserProfileDataFetchNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 158
    return-void
.end method

.method public static getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
    .registers 12

    .prologue
    .line 161
    const-class v9, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    monitor-enter v9

    .line 162
    :try_start_3
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    if-nez v8, :cond_72

    .line 163
    new-instance v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-direct {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;-><init>()V

    sput-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    .line 165
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    .line 166
    .local v1, "guid":Ljava/lang/String;
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v8, v10}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    .line 168
    .local v4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v8

    const-string v10, "profile"

    const-string v11, "com.adobe.cc.entitlements"

    invoke-virtual {v8, v1, v10, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->containsItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_84

    move-result v8

    if-eqz v8, :cond_72

    .line 169
    const/4 v5, 0x0

    .line 171
    .local v5, "profileData":Lorg/json/JSONObject;
    :try_start_2d
    new-instance v6, Lorg/json/JSONObject;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v8

    const-string v10, "profile"

    const-string v11, "com.adobe.cc.entitlements"

    invoke-virtual {v8, v1, v10, v4, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {v6, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_40} :catch_76
    .catchall {:try_start_2d .. :try_end_40} :catchall_84

    .end local v5    # "profileData":Lorg/json/JSONObject;
    .local v6, "profileData":Lorg/json/JSONObject;
    move-object v5, v6

    .line 176
    .end local v6    # "profileData":Lorg/json/JSONObject;
    .restart local v5    # "profileData":Lorg/json/JSONObject;
    :goto_41
    const/4 v3, 0x1

    .line 177
    .local v3, "hasAccessToPublicStorage":Z
    :try_start_42
    const-string v8, "public_cloud"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_50

    .line 178
    const-string v8, "public_cloud"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 180
    :cond_50
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v8, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPublicStorageServices(Z)V

    .line 182
    const/4 v2, 0x1

    .line 183
    .local v2, "hasAccessToPrivateStorage":Z
    const-string v8, "private_cloud"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_64

    .line 184
    const-string v8, "private_cloud"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 186
    :cond_64
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v8, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPrivateStorageServices(Z)V
    :try_end_69
    .catchall {:try_start_42 .. :try_end_69} :catchall_84

    .line 190
    :try_start_69
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->getServicesForUserProfile(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v7

    .line 191
    .local v7, "services":Lorg/json/JSONObject;
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v8, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->updateServices(Lorg/json/JSONObject;)V
    :try_end_72
    .catch Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException; {:try_start_69 .. :try_end_72} :catch_87
    .catchall {:try_start_69 .. :try_end_72} :catchall_84

    .line 197
    .end local v2    # "hasAccessToPrivateStorage":Z
    .end local v3    # "hasAccessToPublicStorage":Z
    .end local v5    # "profileData":Lorg/json/JSONObject;
    .end local v7    # "services":Lorg/json/JSONObject;
    :cond_72
    :goto_72
    :try_start_72
    monitor-exit v9
    :try_end_73
    .catchall {:try_start_72 .. :try_end_73} :catchall_84

    .line 198
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_sharedServices:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    return-object v8

    .line 172
    .restart local v5    # "profileData":Lorg/json/JSONObject;
    :catch_76
    move-exception v0

    .line 173
    .local v0, "e":Lorg/json/JSONException;
    :try_start_77
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v8, v10, v11, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_41

    .line 197
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v4    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .end local v5    # "profileData":Lorg/json/JSONObject;
    :catchall_84
    move-exception v8

    monitor-exit v9
    :try_end_86
    .catchall {:try_start_77 .. :try_end_86} :catchall_84

    throw v8

    .line 192
    .restart local v2    # "hasAccessToPrivateStorage":Z
    .restart local v3    # "hasAccessToPublicStorage":Z
    .restart local v4    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .restart local v5    # "profileData":Lorg/json/JSONObject;
    :catch_87
    move-exception v0

    .line 193
    .local v0, "e":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    :try_start_88
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v8, v10, v11, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    :try_end_94
    .catchall {:try_start_88 .. :try_end_94} :catchall_84

    goto :goto_72
.end method

.method private prereqSatisfiedForService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    .registers 10
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 236
    const/4 v1, 0x1

    .line 238
    .local v1, "result":Z
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1e

    .line 239
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_servicePrerequisite:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    .line 240
    .local v0, "preReq":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$3;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$cloud$AdobeEntitlementServices$AdobeCloudServicePrerequisite:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_90

    .line 278
    .end local v0    # "preReq":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    :cond_1e
    :goto_1e
    return v1

    .line 242
    .restart local v0    # "preReq":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;
    :pswitch_1f
    const/4 v1, 0x1

    .line 243
    goto :goto_1e

    .line 245
    :pswitch_21
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {p2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v5

    if-eqz v5, :cond_2b

    move v1, v3

    .line 246
    :goto_2a
    goto :goto_1e

    :cond_2b
    move v1, v4

    .line 245
    goto :goto_2a

    .line 248
    :pswitch_2d
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeMarket:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {p2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v5

    if-eqz v5, :cond_37

    move v1, v3

    .line 249
    :goto_36
    goto :goto_1e

    :cond_37
    move v1, v4

    .line 248
    goto :goto_36

    .line 251
    :pswitch_39
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {p2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v5

    if-eqz v5, :cond_43

    move v1, v3

    .line 252
    :goto_42
    goto :goto_1e

    :cond_43
    move v1, v4

    .line 251
    goto :goto_42

    .line 258
    :pswitch_45
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {p2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v2

    .line 259
    .local v2, "storageSession":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    if-nez v2, :cond_4f

    .line 261
    const/4 v1, 0x0

    goto :goto_1e

    .line 263
    :cond_4f
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageAsset:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    if-ne v0, v5, :cond_5f

    .line 264
    const-string v5, "assets"

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v5

    if-eqz v5, :cond_5d

    move v1, v3

    :goto_5c
    goto :goto_1e

    :cond_5d
    move v1, v4

    goto :goto_5c

    .line 265
    :cond_5f
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageFile:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    if-ne v0, v5, :cond_6f

    .line 266
    const-string v5, "files"

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v5

    if-eqz v5, :cond_6d

    move v1, v3

    :goto_6c
    goto :goto_1e

    :cond_6d
    move v1, v4

    goto :goto_6c

    .line 267
    :cond_6f
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    if-ne v0, v5, :cond_7f

    .line 268
    const-string v5, "libraries"

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v5

    if-eqz v5, :cond_7d

    move v1, v3

    :goto_7c
    goto :goto_1e

    :cond_7d
    move v1, v4

    goto :goto_7c

    .line 269
    :cond_7f
    sget-object v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;->AdobeCloudServicePrerequisiteStorageArchive:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices$AdobeCloudServicePrerequisite;

    if-ne v0, v5, :cond_1e

    .line 270
    const-string v5, "archive"

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v5

    if-eqz v5, :cond_8d

    move v1, v3

    :goto_8c
    goto :goto_1e

    :cond_8d
    move v1, v4

    goto :goto_8c

    .line 240
    nop

    :pswitch_data_90
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_21
        :pswitch_2d
        :pswitch_39
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_45
    .end packed-switch
.end method


# virtual methods
.method public getServices()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    return-object v0
.end method

.method public hasAccessToPrivateStorageServices()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_accessToPrivateStorageServices:Z

    return v0
.end method

.method public hasAccessToPublicStorageServices()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_accessToPublicStorageServices:Z

    return v0
.end method

.method public isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    .registers 7
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 216
    const/4 v0, 0x1

    .line 217
    .local v0, "result":Z
    if-nez p2, :cond_b

    .line 218
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object p2

    .line 222
    :cond_b
    if-nez p2, :cond_f

    move v1, v0

    .line 231
    .end local v0    # "result":Z
    .local v1, "result":I
    :goto_e
    return v1

    .line 225
    .end local v1    # "result":I
    .restart local v0    # "result":Z
    :cond_f
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->prereqSatisfiedForService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v0

    .line 226
    if-eqz v0, :cond_35

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    if-eqz v2, :cond_35

    .line 227
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_35

    .line 228
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_37

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "entitled"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    :cond_35
    :goto_35
    move v1, v0

    .line 231
    .restart local v1    # "result":I
    goto :goto_e

    .line 228
    .end local v1    # "result":I
    :cond_37
    const/4 v0, 0x0

    goto :goto_35
.end method

.method public setAccessToPrivateStorageServices(Z)V
    .registers 2
    .param p1, "accessToPrivateStorageServices"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_accessToPrivateStorageServices:Z

    .line 118
    return-void
.end method

.method public setAccessToPublicStorageServices(Z)V
    .registers 2
    .param p1, "accessToPublicStorageServices"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_accessToPublicStorageServices:Z

    .line 110
    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 16
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 367
    move-object v4, p2

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 368
    .local v4, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v9

    sget-object v12, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntilementUserProfileDataFetchNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v9, v12, :cond_13

    .line 370
    iget-boolean v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_ignoreNotification:Z

    if-eqz v9, :cond_14

    .line 371
    iput-boolean v11, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_ignoreNotification:Z

    .line 405
    :cond_13
    :goto_13
    return-void

    .line 375
    :cond_14
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v3

    .line 376
    .local v3, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "AdobeEntitlementSessionUserProfileData"

    invoke-interface {v3, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    .line 378
    .local v5, "profileData":Lorg/json/JSONObject;
    const/4 v6, 0x1

    .line 379
    .local v6, "profileUnchanged":Z
    const/4 v2, 0x1

    .line 380
    .local v2, "hasAccessToPublicStorage":Z
    const-string v9, "public_cloud"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_30

    .line 382
    const-string v9, "public_cloud"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 384
    :cond_30
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPublicStorageServices()Z

    move-result v9

    if-ne v2, v9, :cond_74

    move v9, v10

    :goto_37
    and-int/2addr v6, v9

    .line 385
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPublicStorageServices(Z)V

    .line 387
    const/4 v1, 0x1

    .line 388
    .local v1, "hasAccessToPrivateStorage":Z
    const-string v9, "private_cloud"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_4a

    .line 390
    const-string v9, "private_cloud"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 392
    :cond_4a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPrivateStorageServices()Z

    move-result v9

    if-ne v1, v9, :cond_76

    :goto_50
    and-int/2addr v6, v10

    .line 393
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->setAccessToPrivateStorageServices(Z)V

    .line 397
    :try_start_54
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->getServicesForUserProfile(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v7

    .line 398
    .local v7, "services":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getServices()Lorg/json/JSONObject;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementUtils;->areValuesEqual(Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v8

    .line 399
    .local v8, "servicesUnchanged":Z
    if-nez v8, :cond_13

    .line 400
    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->updateServices(Lorg/json/JSONObject;)V
    :try_end_65
    .catch Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException; {:try_start_54 .. :try_end_65} :catch_66

    goto :goto_13

    .line 401
    .end local v7    # "services":Lorg/json/JSONObject;
    .end local v8    # "servicesUnchanged":Z
    :catch_66
    move-exception v0

    .line 402
    .local v0, "e":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v9, v10, v11, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_13

    .end local v0    # "e":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;
    .end local v1    # "hasAccessToPrivateStorage":Z
    :cond_74
    move v9, v11

    .line 384
    goto :goto_37

    .restart local v1    # "hasAccessToPrivateStorage":Z
    :cond_76
    move v10, v11

    .line 392
    goto :goto_50
.end method

.method protected updateServices(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "services"    # Lorg/json/JSONObject;

    .prologue
    .line 212
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->_userPublicServices:Lorg/json/JSONObject;

    .line 213
    return-void
.end method
