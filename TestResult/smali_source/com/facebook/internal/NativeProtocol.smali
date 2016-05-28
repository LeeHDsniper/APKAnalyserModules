.class public final Lcom/facebook/internal/NativeProtocol;
.super Ljava/lang/Object;
.source "NativeProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;,
        Lcom/facebook/internal/NativeProtocol$MessengerAppInfo;,
        Lcom/facebook/internal/NativeProtocol$NativeAppInfo;,
        Lcom/facebook/internal/NativeProtocol$WakizashiAppInfo;
    }
.end annotation


# static fields
.field private static final FACEBOOK_APP_INFO:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

.field private static final KNOWN_PROTOCOL_VERSIONS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static actionToAppInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/internal/NativeProtocol$NativeAppInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private static facebookAppInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/internal/NativeProtocol$NativeAppInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 276
    new-instance v0, Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;-><init>(Lcom/facebook/internal/NativeProtocol$KatanaAppInfo;)V

    sput-object v0, Lcom/facebook/internal/NativeProtocol;->FACEBOOK_APP_INFO:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 277
    invoke-static {}, Lcom/facebook/internal/NativeProtocol;->buildFacebookAppList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    .line 278
    invoke-static {}, Lcom/facebook/internal/NativeProtocol;->buildActionToAppInfoMap()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/NativeProtocol;->actionToAppInfoMap:Ljava/util/Map;

    .line 391
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    .line 393
    const v2, 0x133529d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 394
    const v2, 0x1335124

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 395
    const v2, 0x13350ac

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 396
    const v2, 0x1332d23

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    .line 397
    const v2, 0x1332b3a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 398
    const v2, 0x1332ac6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 399
    const v2, 0x133060d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 392
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/NativeProtocol;->KNOWN_PROTOCOL_VERSIONS:Ljava/util/List;

    .line 400
    return-void
.end method

.method private static buildActionToAppInfoMap()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/internal/NativeProtocol$NativeAppInfo;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 291
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 293
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/facebook/internal/NativeProtocol$NativeAppInfo;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .local v1, "messengerAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/internal/NativeProtocol$NativeAppInfo;>;"
    new-instance v2, Lcom/facebook/internal/NativeProtocol$MessengerAppInfo;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/facebook/internal/NativeProtocol$MessengerAppInfo;-><init>(Lcom/facebook/internal/NativeProtocol$MessengerAppInfo;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    const-string v2, "com.facebook.platform.action.request.OGACTIONPUBLISH_DIALOG"

    sget-object v3, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v2, "com.facebook.platform.action.request.FEED_DIALOG"

    sget-object v3, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    const-string v2, "com.facebook.platform.action.request.MESSAGE_DIALOG"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    const-string v2, "com.facebook.platform.action.request.OGMESSAGEPUBLISH_DIALOG"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    return-object v0
.end method

.method private static buildFacebookAppList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/internal/NativeProtocol$NativeAppInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 281
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 284
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/internal/NativeProtocol$NativeAppInfo;>;"
    sget-object v1, Lcom/facebook/internal/NativeProtocol;->FACEBOOK_APP_INFO:Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    new-instance v1, Lcom/facebook/internal/NativeProtocol$WakizashiAppInfo;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/internal/NativeProtocol$WakizashiAppInfo;-><init>(Lcom/facebook/internal/NativeProtocol$WakizashiAppInfo;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    return-object v0
.end method

.method private static buildPlatformProviderVersionURI(Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/net/Uri;
    .registers 3
    .param p0, "appInfo"    # Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .prologue
    .line 626
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "content://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->getPackage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".provider.PlatformProvider/versions"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static createPlatformServiceIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 465
    sget-object v2, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_e

    .line 474
    const/4 v1, 0x0

    :goto_d
    return-object v1

    .line 465
    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 466
    .local v0, "appInfo":Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.facebook.platform.PLATFORM_SERVICE"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 467
    invoke-virtual {v0}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->getPackage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .line 468
    const-string v4, "android.intent.category.DEFAULT"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 469
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p0, v1, v0}, Lcom/facebook/internal/NativeProtocol;->validateServiceIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/content/Intent;

    move-result-object v1

    .line 470
    if-eqz v1, :cond_6

    goto :goto_d
.end method

.method public static createProxyAuthIntent(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;ZLcom/facebook/SessionDefaultAudience;)Landroid/content/Intent;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "applicationId"    # Ljava/lang/String;
    .param p3, "e2e"    # Ljava/lang/String;
    .param p4, "isRerequest"    # Z
    .param p5, "defaultAudience"    # Lcom/facebook/SessionDefaultAudience;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/facebook/SessionDefaultAudience;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 341
    .local p2, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v2, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_e

    .line 373
    const/4 v1, 0x0

    :goto_d
    return-object v1

    .line 341
    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 342
    .local v0, "appInfo":Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 343
    invoke-virtual {v0}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->getPackage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.facebook.katana.ProxyAuth"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .line 344
    const-string v4, "client_id"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 346
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_3a

    .line 347
    const-string v3, "scope"

    const-string v4, ","

    invoke-static {v4, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 349
    :cond_3a
    invoke-static {p3}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_45

    .line 350
    const-string v3, "e2e"

    invoke-virtual {v1, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 353
    :cond_45
    const-string v3, "response_type"

    const-string v4, "token"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 354
    const-string v3, "return_scopes"

    const-string v4, "true"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 355
    const-string v3, "default_audience"

    invoke-virtual {p5}, Lcom/facebook/SessionDefaultAudience;->getNativeProtocolAudience()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 357
    invoke-static {}, Lcom/facebook/Settings;->getPlatformCompatibilityEnabled()Z

    move-result v3

    if-nez v3, :cond_72

    .line 359
    const-string v3, "legacy_override"

    const-string v4, "v2.1"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 362
    if-eqz p4, :cond_72

    .line 363
    const-string v3, "auth_type"

    const-string v4, "rerequest"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 367
    :cond_72
    invoke-static {p0, v1, v0}, Lcom/facebook/internal/NativeProtocol;->validateActivityIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/content/Intent;

    move-result-object v1

    .line 369
    if-eqz v1, :cond_6

    goto :goto_d
.end method

.method public static createTokenRefreshIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 377
    sget-object v2, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_e

    .line 387
    const/4 v1, 0x0

    :goto_d
    return-object v1

    .line 377
    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 378
    .local v0, "appInfo":Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 379
    invoke-virtual {v0}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->getPackage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.facebook.katana.platform.TokenRefreshService"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 381
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p0, v1, v0}, Lcom/facebook/internal/NativeProtocol;->validateServiceIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/content/Intent;

    move-result-object v1

    .line 383
    if-eqz v1, :cond_6

    goto :goto_d
.end method

.method public static getBridgeArgumentsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;
    .registers 3
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 504
    invoke-static {p0}, Lcom/facebook/internal/NativeProtocol;->getProtocolVersionFromIntent(Landroid/content/Intent;)I

    move-result v0

    .line 505
    .local v0, "version":I
    invoke-static {v0}, Lcom/facebook/internal/NativeProtocol;->isVersionCompatibleWithBucketedIntent(I)Z

    move-result v1

    if-nez v1, :cond_c

    .line 506
    const/4 v1, 0x0

    .line 509
    :goto_b
    return-object v1

    :cond_c
    const-string v1, "com.facebook.platform.protocol.BRIDGE_ARGS"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    goto :goto_b
.end method

.method private static getLatestAvailableProtocolVersionForAppInfo(Landroid/content/Context;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;I)I
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appInfo"    # Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    .param p2, "minimumVersion"    # I

    .prologue
    const/4 v10, -0x1

    .line 590
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 592
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "version"

    aput-object v4, v2, v3

    .line 593
    .local v2, "projection":[Ljava/lang/String;
    invoke-static {p1}, Lcom/facebook/internal/NativeProtocol;->buildPlatformProviderVersionURI(Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/net/Uri;

    move-result-object v1

    .line 594
    .local v1, "uri":Landroid/net/Uri;
    const/4 v6, 0x0

    .line 596
    .local v6, "c":Landroid/database/Cursor;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_15
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_52

    move-result-object v6

    .line 597
    if-nez v6, :cond_22

    .line 617
    if-eqz v6, :cond_20

    .line 618
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_20
    move v3, v10

    .line 622
    :cond_21
    :goto_21
    return v3

    .line 601
    :cond_22
    :try_start_22
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 602
    .local v9, "versions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :goto_27
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_40

    .line 607
    sget-object v3, Lcom/facebook/internal/NativeProtocol;->KNOWN_PROTOCOL_VERSIONS:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_33
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_36
    .catchall {:try_start_22 .. :try_end_36} :catchall_52

    move-result v4

    if-nez v4, :cond_59

    .line 617
    if-eqz v6, :cond_3e

    .line 618
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3e
    move v3, v10

    .line 622
    goto :goto_21

    .line 603
    :cond_40
    :try_start_40
    const-string v3, "version"

    invoke-interface {v6, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v6, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 604
    .local v8, "version":I
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v9, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_51
    .catchall {:try_start_40 .. :try_end_51} :catchall_52

    goto :goto_27

    .line 616
    .end local v8    # "version":I
    .end local v9    # "versions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :catchall_52
    move-exception v3

    .line 617
    if-eqz v6, :cond_58

    .line 618
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 620
    :cond_58
    throw v3

    .line 607
    .restart local v9    # "versions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_59
    :try_start_59
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 608
    .local v7, "knownVersion":Ljava/lang/Integer;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_62
    .catchall {:try_start_59 .. :try_end_62} :catchall_52

    move-result v4

    if-ge v4, p2, :cond_6c

    .line 617
    if-eqz v6, :cond_6a

    .line 618
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_6a
    move v3, v10

    .line 609
    goto :goto_21

    .line 612
    :cond_6c
    :try_start_6c
    invoke-interface {v9, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 613
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_75
    .catchall {:try_start_6c .. :try_end_75} :catchall_52

    move-result v3

    .line 617
    if-eqz v6, :cond_21

    .line 618
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_21
.end method

.method private static getLatestAvailableProtocolVersionForAppInfoList(Landroid/content/Context;Ljava/util/List;I)I
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "minimumVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/internal/NativeProtocol$NativeAppInfo;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .local p1, "appInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/internal/NativeProtocol$NativeAppInfo;>;"
    const/4 v2, -0x1

    .line 573
    if-nez p1, :cond_5

    move v1, v2

    .line 585
    :goto_4
    return v1

    .line 578
    :cond_5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_11

    move v1, v2

    .line 585
    goto :goto_4

    .line 578
    :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .line 579
    .local v0, "appInfo":Lcom/facebook/internal/NativeProtocol$NativeAppInfo;
    invoke-static {p0, v0, p2}, Lcom/facebook/internal/NativeProtocol;->getLatestAvailableProtocolVersionForAppInfo(Landroid/content/Context;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;I)I

    move-result v1

    .line 580
    .local v1, "protocolVersion":I
    if-eq v1, v2, :cond_9

    goto :goto_4
.end method

.method public static getLatestAvailableProtocolVersionForService(Landroid/content/Context;I)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "minimumVersion"    # I

    .prologue
    .line 563
    sget-object v0, Lcom/facebook/internal/NativeProtocol;->facebookAppInfoList:Ljava/util/List;

    invoke-static {p0, v0, p1}, Lcom/facebook/internal/NativeProtocol;->getLatestAvailableProtocolVersionForAppInfoList(Landroid/content/Context;Ljava/util/List;I)I

    move-result v0

    return v0
.end method

.method public static getProtocolVersionFromIntent(Landroid/content/Intent;)I
    .registers 3
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 478
    const-string v0, "com.facebook.platform.protocol.PROTOCOL_VERSION"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static isErrorResult(Landroid/content/Intent;)Z
    .registers 3
    .param p0, "resultIntent"    # Landroid/content/Intent;

    .prologue
    .line 523
    invoke-static {p0}, Lcom/facebook/internal/NativeProtocol;->getBridgeArgumentsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v0

    .line 524
    .local v0, "bridgeArgs":Landroid/os/Bundle;
    if-eqz v0, :cond_d

    .line 525
    const-string v1, "error"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    .line 527
    :goto_c
    return v1

    :cond_d
    const-string v1, "com.facebook.platform.status.ERROR_TYPE"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    goto :goto_c
.end method

.method public static isVersionCompatibleWithBucketedIntent(I)Z
    .registers 3
    .param p0, "version"    # I

    .prologue
    .line 424
    sget-object v0, Lcom/facebook/internal/NativeProtocol;->KNOWN_PROTOCOL_VERSIONS:Ljava/util/List;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const v0, 0x133529d

    if-lt p0, v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method static validateActivityIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/content/Intent;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "appInfo"    # Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .prologue
    const/4 v1, 0x0

    .line 306
    if-nez p1, :cond_5

    move-object p1, v1

    .line 319
    .end local p1    # "intent":Landroid/content/Intent;
    :cond_4
    :goto_4
    return-object p1

    .line 310
    .restart local p1    # "intent":Landroid/content/Intent;
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 311
    .local v0, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_12

    move-object p1, v1

    .line 312
    goto :goto_4

    .line 315
    :cond_12
    iget-object v2, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, p0, v2}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->validateSignature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    move-object p1, v1

    .line 316
    goto :goto_4
.end method

.method static validateServiceIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/facebook/internal/NativeProtocol$NativeAppInfo;)Landroid/content/Intent;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "appInfo"    # Lcom/facebook/internal/NativeProtocol$NativeAppInfo;

    .prologue
    const/4 v1, 0x0

    .line 323
    if-nez p1, :cond_5

    move-object p1, v1

    .line 336
    .end local p1    # "intent":Landroid/content/Intent;
    :cond_4
    :goto_4
    return-object p1

    .line 327
    .restart local p1    # "intent":Landroid/content/Intent;
    :cond_5
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 328
    .local v0, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_12

    move-object p1, v1

    .line 329
    goto :goto_4

    .line 332
    :cond_12
    iget-object v2, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v2, v2, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, p0, v2}, Lcom/facebook/internal/NativeProtocol$NativeAppInfo;->validateSignature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    move-object p1, v1

    .line 333
    goto :goto_4
.end method
