.class public Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;
.super Ljava/lang/Object;
.source "AdobeAnalyticsSDKReporter.java"


# static fields
.field public static final AdobeAnalyticsShareTargetBehanceProject:Ljava/lang/String; = "Behance-Project"

.field public static final AdobeAnalyticsShareTargetBehanceWIP:Ljava/lang/String; = "Behance-WIP"

.field public static final AdobeAnalyticsShareTypePublishFailure:Ljava/lang/String; = "Publish Failure"

.field public static final AdobeAnalyticsShareTypePublishSuccess:Ljava/lang/String; = "Publish Success"

.field public static final AdobeAnalyticsShareTypePublishUXCancel:Ljava/lang/String; = "Publish UX Cancel"

.field public static final AdobeAnalyticsShareTypePublishUXStart:Ljava/lang/String; = "Publish UX Start"


# direct methods
.method static declared-synchronized addGlobalAnalyticsFields(Ljava/util/Map;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-class v8, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v8

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v1

    .line 220
    .local v1, "authManager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v6

    .line 221
    .local v6, "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    .line 223
    .local v3, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    const-string v7, "adb.user.profile.profileId"

    invoke-interface {p0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_24

    .line 225
    if-eqz v6, :cond_67

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "adobeId":Ljava/lang/String;
    :goto_1d
    if-eqz v0, :cond_69

    .line 227
    const-string v7, "adb.user.profile.profileId"

    invoke-interface {p0, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .end local v0    # "adobeId":Ljava/lang/String;
    :cond_24
    :goto_24
    const-string v7, "adb.user.profile.attributes.clientId"

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v9

    invoke-interface {p0, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    const-string v7, "adb.page.pageInfo.SKDsUtilized"

    invoke-interface {p0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_74

    .line 236
    const-string v7, "adb.page.pageInfo.SKDsUtilized"

    const-string v9, "Creative SDK Android"

    invoke-interface {p0, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    :goto_3c
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->isAuthenticated()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 241
    .local v4, "isLoggedIn":Ljava/lang/Boolean;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 242
    .local v5, "isOnline":Ljava/lang/Boolean;
    const-string v2, ""

    .line 244
    .local v2, "authStatus":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_9c

    .line 245
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_99

    const-string v2, "Logged In : Online"

    .line 249
    :goto_60
    const-string v7, "adb.user.profile.attributes.authStatus"

    invoke-interface {p0, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_65
    .catchall {:try_start_3 .. :try_end_65} :catchall_71

    .line 251
    monitor-exit v8

    return-void

    .line 225
    .end local v2    # "authStatus":Ljava/lang/String;
    .end local v4    # "isLoggedIn":Ljava/lang/Boolean;
    .end local v5    # "isOnline":Ljava/lang/Boolean;
    :cond_67
    const/4 v0, 0x0

    goto :goto_1d

    .line 229
    .restart local v0    # "adobeId":Ljava/lang/String;
    :cond_69
    :try_start_69
    const-string v7, "adb.user.profile.profileId"

    const-string v9, "Unknown"

    invoke-interface {p0, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_70
    .catchall {:try_start_69 .. :try_end_70} :catchall_71

    goto :goto_24

    .line 219
    .end local v0    # "adobeId":Ljava/lang/String;
    .end local v1    # "authManager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    .end local v3    # "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .end local v6    # "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    :catchall_71
    move-exception v7

    monitor-exit v8

    throw v7

    .line 238
    .restart local v1    # "authManager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    .restart local v3    # "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .restart local v6    # "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    :cond_74
    :try_start_74
    const-string v7, "adb.page.pageInfo.SKDsUtilized"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "adb.page.pageInfo.SKDsUtilized"

    invoke-interface {p0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "|"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Creative SDK Android"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {p0, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3c

    .line 245
    .restart local v2    # "authStatus":Ljava/lang/String;
    .restart local v4    # "isLoggedIn":Ljava/lang/Boolean;
    .restart local v5    # "isOnline":Ljava/lang/Boolean;
    :cond_99
    const-string v2, "Logged In : Offline"

    goto :goto_60

    .line 247
    :cond_9c
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_a5

    const-string v2, "Logged Out : Online"

    :goto_a4
    goto :goto_60

    :cond_a5
    const-string v2, "Logged Out : Offline"
    :try_end_a7
    .catchall {:try_start_74 .. :try_end_a7} :catchall_71

    goto :goto_a4
.end method

.method public static declared-synchronized trackAction(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p0, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v1

    :try_start_3
    const-string v0, "adb.event.eventInfo.eventName"

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->addGlobalAnalyticsFields(Ljava/util/Map;)V

    .line 193
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->trackAction(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_14

    .line 194
    monitor-exit v1

    return-void

    .line 191
    :catchall_14
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized trackAssetBrowserAction(Ljava/lang/String;)V
    .registers 4
    .param p0, "action"    # Ljava/lang/String;

    .prologue
    .line 177
    const-class v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v2

    :try_start_3
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 178
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "adb.event.eventInfo.eventAction"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    const-string v1, "Asset Browser Action"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAction(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_16

    .line 180
    monitor-exit v2

    return-void

    .line 177
    .end local v0    # "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_16
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "authStep"    # Ljava/lang/String;
    .param p1, "adobeId"    # Ljava/lang/String;

    .prologue
    .line 145
    const-class v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v2

    :try_start_3
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 146
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_11

    .line 147
    const-string v1, "adb.user.profile.profileId"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_11
    const-string v1, "adb.event.eventInfo.eventAction"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const-string v1, "Auth Step"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAction(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_1d

    .line 152
    monitor-exit v2

    return-void

    .line 145
    .end local v0    # "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_1d
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized trackRegStep(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "regStep"    # Ljava/lang/String;
    .param p1, "adobeId"    # Ljava/lang/String;

    .prologue
    .line 156
    const-class v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v2

    :try_start_3
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 160
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "adb.event.eventInfo.eventAction"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    const-string v1, "Registration Step"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAction(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_16

    .line 163
    monitor-exit v2

    return-void

    .line 156
    .end local v0    # "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_16
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "shareType"    # Ljava/lang/String;
    .param p1, "shareTarget"    # Ljava/lang/String;

    .prologue
    .line 167
    const-class v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;

    monitor-enter v2

    :try_start_3
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 169
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "adb.event.eventInfo.eventAction"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    const-string v1, "adb.event.eventInfo.type"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string v1, "Sharing Action"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAction(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1b

    .line 173
    monitor-exit v2

    return-void

    .line 167
    .end local v0    # "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_1b
    move-exception v1

    monitor-exit v2

    throw v1
.end method
