.class public Lcom/facebook/Session;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/Session$AuthorizationRequest;,
        Lcom/facebook/Session$AutoPublishAsyncTask;,
        Lcom/facebook/Session$Builder;,
        Lcom/facebook/Session$NewPermissionsRequest;,
        Lcom/facebook/Session$OpenRequest;,
        Lcom/facebook/Session$PermissionsPair;,
        Lcom/facebook/Session$SerializationProxyV1;,
        Lcom/facebook/Session$StartActivityDelegate;,
        Lcom/facebook/Session$StatusCallback;,
        Lcom/facebook/Session$TokenRefreshRequest;,
        Lcom/facebook/Session$TokenRefreshRequestHandler;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$facebook$SessionState:[I = null

.field public static final ACTION_ACTIVE_SESSION_CLOSED:Ljava/lang/String; = "com.facebook.sdk.ACTIVE_SESSION_CLOSED"

.field public static final ACTION_ACTIVE_SESSION_OPENED:Ljava/lang/String; = "com.facebook.sdk.ACTIVE_SESSION_OPENED"

.field public static final ACTION_ACTIVE_SESSION_SET:Ljava/lang/String; = "com.facebook.sdk.ACTIVE_SESSION_SET"

.field public static final ACTION_ACTIVE_SESSION_UNSET:Ljava/lang/String; = "com.facebook.sdk.ACTIVE_SESSION_UNSET"

.field private static final AUTH_BUNDLE_SAVE_KEY:Ljava/lang/String; = "com.facebook.sdk.Session.authBundleKey"

.field public static final DEFAULT_AUTHORIZE_ACTIVITY_CODE:I = 0xface

.field private static final MANAGE_PERMISSION_PREFIX:Ljava/lang/String; = "manage"

.field private static final OTHER_PUBLISH_PERMISSIONS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final PUBLISH_PERMISSION_PREFIX:Ljava/lang/String; = "publish"

.field private static final SESSION_BUNDLE_SAVE_KEY:Ljava/lang/String; = "com.facebook.sdk.Session.saveSessionKey"

.field private static final STATIC_LOCK:Ljava/lang/Object;

.field public static final TAG:Ljava/lang/String;

.field private static final TOKEN_EXTEND_RETRY_SECONDS:I = 0xe10

.field private static final TOKEN_EXTEND_THRESHOLD_SECONDS:I = 0x15180

.field public static final WEB_VIEW_ERROR_CODE_KEY:Ljava/lang/String; = "com.facebook.sdk.WebViewErrorCode"

.field public static final WEB_VIEW_FAILING_URL_KEY:Ljava/lang/String; = "com.facebook.sdk.FailingUrl"

.field private static activeSession:Lcom/facebook/Session; = null

.field private static final serialVersionUID:J = 0x1L

.field private static volatile staticContext:Landroid/content/Context;


# instance fields
.field private appEventsLogger:Lcom/facebook/AppEventsLogger;

.field private applicationId:Ljava/lang/String;

.field private volatile authorizationBundle:Landroid/os/Bundle;

.field private authorizationClient:Lcom/facebook/AuthorizationClient;

.field private autoPublishAsyncTask:Lcom/facebook/Session$AutoPublishAsyncTask;

.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/Session$StatusCallback;",
            ">;"
        }
    .end annotation
.end field

.field private volatile currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

.field private handler:Landroid/os/Handler;

.field private lastAttemptedTokenExtendDate:Ljava/util/Date;

.field private final lock:Ljava/lang/Object;

.field private pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

.field private state:Lcom/facebook/SessionState;

.field private tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

.field private tokenInfo:Lcom/facebook/AccessToken;


# direct methods
.method static synthetic $SWITCH_TABLE$com$facebook$SessionState()[I
    .registers 3

    .prologue
    .line 59
    sget-object v0, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState:[I

    if-eqz v0, :cond_5

    :goto_4
    return-object v0

    :cond_5
    invoke-static {}, Lcom/facebook/SessionState;->values()[Lcom/facebook/SessionState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/facebook/SessionState;->CLOSED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_5a

    :goto_15
    :try_start_15
    sget-object v1, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_1e} :catch_58

    :goto_1e
    :try_start_1e
    sget-object v1, Lcom/facebook/SessionState;->CREATED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_27} :catch_56

    :goto_27
    :try_start_27
    sget-object v1, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_30} :catch_54

    :goto_30
    :try_start_30
    sget-object v1, Lcom/facebook/SessionState;->OPENED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_39} :catch_52

    :goto_39
    :try_start_39
    sget-object v1, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_42} :catch_50

    :goto_42
    :try_start_42
    sget-object v1, Lcom/facebook/SessionState;->OPENING:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_4b} :catch_4e

    :goto_4b
    sput-object v0, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState:[I

    goto :goto_4

    :catch_4e
    move-exception v1

    goto :goto_4b

    :catch_50
    move-exception v1

    goto :goto_42

    :catch_52
    move-exception v1

    goto :goto_39

    :catch_54
    move-exception v1

    goto :goto_30

    :catch_56
    move-exception v1

    goto :goto_27

    :catch_58
    move-exception v1

    goto :goto_1e

    :catch_5a
    move-exception v1

    goto :goto_15
.end method

.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 65
    const-class v0, Lcom/facebook/Session;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    .line 117
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/facebook/Session;->STATIC_LOCK:Ljava/lang/Object;

    .line 132
    new-instance v0, Lcom/facebook/Session$1;

    invoke-direct {v0}, Lcom/facebook/Session$1;-><init>()V

    sput-object v0, Lcom/facebook/Session;->OTHER_PUBLISH_PERMISSIONS:Ljava/util/Set;

    .line 136
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "currentContext"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 266
    const/4 v0, 0x1

    invoke-direct {p0, p1, v1, v1, v0}, Lcom/facebook/Session;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/TokenCachingStrategy;Z)V

    .line 267
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/TokenCachingStrategy;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "applicationId"    # Ljava/lang/String;
    .param p3, "tokenCachingStrategy"    # Lcom/facebook/TokenCachingStrategy;

    .prologue
    .line 270
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/facebook/Session;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/TokenCachingStrategy;Z)V

    .line 271
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/TokenCachingStrategy;Z)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "applicationId"    # Ljava/lang/String;
    .param p3, "tokenCachingStrategy"    # Lcom/facebook/TokenCachingStrategy;
    .param p4, "loadTokenFromCache"    # Z

    .prologue
    const/4 v2, 0x0

    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v3, Ljava/util/Date;

    const-wide/16 v4, 0x0

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    iput-object v3, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 152
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    .line 277
    if-eqz p1, :cond_1c

    if-nez p2, :cond_1c

    .line 278
    invoke-static {p1}, Lcom/facebook/internal/Utility;->getMetadataApplicationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    .line 281
    :cond_1c
    const-string v3, "applicationId"

    invoke-static {p2, v3}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 283
    invoke-static {p1}, Lcom/facebook/Session;->initializeStaticContext(Landroid/content/Context;)V

    .line 285
    if-nez p3, :cond_2d

    .line 286
    new-instance p3, Lcom/facebook/SharedPreferencesTokenCachingStrategy;

    .end local p3    # "tokenCachingStrategy":Lcom/facebook/TokenCachingStrategy;
    sget-object v3, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    invoke-direct {p3, v3}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;-><init>(Landroid/content/Context;)V

    .line 289
    .restart local p3    # "tokenCachingStrategy":Lcom/facebook/TokenCachingStrategy;
    :cond_2d
    iput-object p2, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    .line 290
    iput-object p3, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    .line 291
    sget-object v3, Lcom/facebook/SessionState;->CREATED:Lcom/facebook/SessionState;

    iput-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 292
    iput-object v2, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 293
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    .line 294
    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/facebook/Session;->handler:Landroid/os/Handler;

    .line 296
    if-eqz p4, :cond_4f

    invoke-virtual {p3}, Lcom/facebook/TokenCachingStrategy;->load()Landroid/os/Bundle;

    move-result-object v2

    .line 297
    .local v2, "tokenState":Landroid/os/Bundle;
    :cond_4f
    invoke-static {v2}, Lcom/facebook/TokenCachingStrategy;->hasTokenInformation(Landroid/os/Bundle;)Z

    move-result v3

    if-eqz v3, :cond_7d

    .line 299
    const-string v3, "com.facebook.TokenCachingStrategy.ExpirationDate"

    invoke-static {v2, v3}, Lcom/facebook/TokenCachingStrategy;->getDate(Landroid/os/Bundle;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 300
    .local v0, "cachedExpirationDate":Ljava/util/Date;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 302
    .local v1, "now":Ljava/util/Date;
    if-eqz v0, :cond_68

    invoke-virtual {v0, v1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_72

    .line 305
    :cond_68
    invoke-virtual {p3}, Lcom/facebook/TokenCachingStrategy;->clear()V

    .line 306
    invoke-static {}, Lcom/facebook/AccessToken;->createEmptyToken()Lcom/facebook/AccessToken;

    move-result-object v3

    iput-object v3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 315
    .end local v0    # "cachedExpirationDate":Ljava/util/Date;
    .end local v1    # "now":Ljava/util/Date;
    :goto_71
    return-void

    .line 309
    .restart local v0    # "cachedExpirationDate":Ljava/util/Date;
    .restart local v1    # "now":Ljava/util/Date;
    :cond_72
    invoke-static {v2}, Lcom/facebook/AccessToken;->createFromCache(Landroid/os/Bundle;)Lcom/facebook/AccessToken;

    move-result-object v3

    iput-object v3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 310
    sget-object v3, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    iput-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    goto :goto_71

    .line 313
    .end local v0    # "cachedExpirationDate":Ljava/util/Date;
    .end local v1    # "now":Ljava/util/Date;
    :cond_7d
    invoke-static {}, Lcom/facebook/AccessToken;->createEmptyToken()Lcom/facebook/AccessToken;

    move-result-object v3

    iput-object v3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    goto :goto_71
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;)V
    .registers 12
    .param p1, "applicationId"    # Ljava/lang/String;
    .param p2, "state"    # Lcom/facebook/SessionState;
    .param p3, "tokenInfo"    # Lcom/facebook/AccessToken;
    .param p4, "lastAttemptedTokenExtendDate"    # Ljava/util/Date;
    .param p5, "shouldAutoPublish"    # Z
    .param p6, "pendingAuthorizationRequest"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    const/4 v4, 0x0

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v0, Ljava/util/Date;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 152
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    .line 231
    iput-object p1, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    .line 232
    iput-object p2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 233
    iput-object p3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 234
    iput-object p4, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 235
    iput-object p6, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 236
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/facebook/Session;->handler:Landroid/os/Handler;

    .line 237
    iput-object v4, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    .line 238
    iput-object v4, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    .line 239
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    .line 240
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;Lcom/facebook/Session;)V
    .registers 8

    .prologue
    .line 228
    invoke-direct/range {p0 .. p6}, Lcom/facebook/Session;-><init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;Ljava/util/Set;)V
    .registers 13
    .param p1, "applicationId"    # Ljava/lang/String;
    .param p2, "state"    # Lcom/facebook/SessionState;
    .param p3, "tokenInfo"    # Lcom/facebook/AccessToken;
    .param p4, "lastAttemptedTokenExtendDate"    # Ljava/util/Date;
    .param p5, "shouldAutoPublish"    # Z
    .param p6, "pendingAuthorizationRequest"    # Lcom/facebook/Session$AuthorizationRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/SessionState;",
            "Lcom/facebook/AccessToken;",
            "Ljava/util/Date;",
            "Z",
            "Lcom/facebook/Session$AuthorizationRequest;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p7, "requestedPermissions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v0, Ljava/util/Date;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 152
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    .line 249
    iput-object p1, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    .line 250
    iput-object p2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 251
    iput-object p3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 252
    iput-object p4, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 253
    iput-object p6, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 254
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/facebook/Session;->handler:Landroid/os/Handler;

    .line 255
    iput-object v4, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    .line 256
    iput-object v4, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    .line 257
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    .line 258
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;Ljava/util/Set;Lcom/facebook/Session;)V
    .registers 9

    .prologue
    .line 245
    invoke-direct/range {p0 .. p7}, Lcom/facebook/Session;-><init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;Ljava/util/Set;)V

    return-void
.end method

.method static synthetic access$11(Lcom/facebook/Session;ILcom/facebook/AuthorizationClient$Result;)V
    .registers 3

    .prologue
    .line 1314
    invoke-direct {p0, p1, p2}, Lcom/facebook/Session;->handleAuthorizationResult(ILcom/facebook/AuthorizationClient$Result;)V

    return-void
.end method

.method static synthetic access$12(Lcom/facebook/Session;)Ljava/util/List;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$13(Lcom/facebook/Session;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/facebook/Session;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$14(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 2

    .prologue
    .line 1573
    invoke-static {p0, p1}, Lcom/facebook/Session;->runWithHandlerOrExecutor(Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$2()Landroid/content/Context;
    .registers 1

    .prologue
    .line 119
    sget-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3(Lcom/facebook/Session;)Lcom/facebook/Session$TokenRefreshRequest;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    return-object v0
.end method

.method static synthetic access$4(Lcom/facebook/Session;Lcom/facebook/Session$TokenRefreshRequest;)V
    .registers 2

    .prologue
    .line 154
    iput-object p1, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    return-void
.end method

.method static synthetic access$5(Lcom/facebook/Session;Lcom/facebook/Session$AutoPublishAsyncTask;)V
    .registers 2

    .prologue
    .line 150
    iput-object p1, p0, Lcom/facebook/Session;->autoPublishAsyncTask:Lcom/facebook/Session$AutoPublishAsyncTask;

    return-void
.end method

.method static synthetic access$6(Lcom/facebook/Session;)Ljava/lang/Object;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$7(Lcom/facebook/Session;)Lcom/facebook/AccessToken;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    return-object v0
.end method

.method static synthetic access$8(Lcom/facebook/Session;Lcom/facebook/AccessToken;)V
    .registers 2

    .prologue
    .line 140
    iput-object p1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    return-void
.end method

.method static synthetic access$9(Lcom/facebook/Session;)Lcom/facebook/SessionState;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    return-object v0
.end method

.method private static areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 1766
    if-nez p0, :cond_8

    .line 1767
    if-nez p1, :cond_6

    const/4 v0, 0x1

    .line 1769
    :goto_5
    return v0

    .line 1767
    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    .line 1769
    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method private autoPublishAsync()V
    .registers 5

    .prologue
    .line 1830
    const/4 v1, 0x0

    .line 1831
    .local v1, "asyncTask":Lcom/facebook/Session$AutoPublishAsyncTask;
    monitor-enter p0

    .line 1832
    :try_start_2
    iget-object v3, p0, Lcom/facebook/Session;->autoPublishAsyncTask:Lcom/facebook/Session$AutoPublishAsyncTask;

    if-nez v3, :cond_1a

    invoke-static {}, Lcom/facebook/Settings;->getShouldAutoPublishInstall()Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 1834
    iget-object v0, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    .line 1837
    .local v0, "applicationId":Ljava/lang/String;
    if-eqz v0, :cond_1a

    .line 1838
    new-instance v2, Lcom/facebook/Session$AutoPublishAsyncTask;

    sget-object v3, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    invoke-direct {v2, p0, v0, v3}, Lcom/facebook/Session$AutoPublishAsyncTask;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/facebook/Session;->autoPublishAsyncTask:Lcom/facebook/Session$AutoPublishAsyncTask;

    .end local v1    # "asyncTask":Lcom/facebook/Session$AutoPublishAsyncTask;
    .local v2, "asyncTask":Lcom/facebook/Session$AutoPublishAsyncTask;
    move-object v1, v2

    .line 1831
    .end local v0    # "applicationId":Ljava/lang/String;
    .end local v2    # "asyncTask":Lcom/facebook/Session$AutoPublishAsyncTask;
    .restart local v1    # "asyncTask":Lcom/facebook/Session$AutoPublishAsyncTask;
    :cond_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_2 .. :try_end_1b} :catchall_24

    .line 1843
    if-eqz v1, :cond_23

    .line 1844
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v1, v3}, Lcom/facebook/Session$AutoPublishAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1846
    :cond_23
    return-void

    .line 1831
    :catchall_24
    move-exception v3

    :try_start_25
    monitor-exit p0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_24

    throw v3
.end method

.method private finishAuthorization(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "newToken"    # Lcom/facebook/AccessToken;
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 1488
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1489
    .local v0, "oldState":Lcom/facebook/SessionState;
    if-eqz p1, :cond_16

    .line 1490
    iput-object p1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 1491
    invoke-direct {p0, p1}, Lcom/facebook/Session;->saveTokenToCache(Lcom/facebook/AccessToken;)V

    .line 1493
    sget-object v1, Lcom/facebook/SessionState;->OPENED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1497
    :cond_d
    :goto_d
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 1498
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {p0, v0, v1, p2}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1499
    return-void

    .line 1494
    :cond_16
    if-eqz p2, :cond_d

    .line 1495
    sget-object v1, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    goto :goto_d
.end method

.method private finishReauthorization(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "newToken"    # Lcom/facebook/AccessToken;
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 1502
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1504
    .local v0, "oldState":Lcom/facebook/SessionState;
    if-eqz p1, :cond_d

    .line 1505
    iput-object p1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 1506
    invoke-direct {p0, p1}, Lcom/facebook/Session;->saveTokenToCache(Lcom/facebook/AccessToken;)V

    .line 1508
    sget-object v1, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1511
    :cond_d
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 1512
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {p0, v0, v1, p2}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1513
    return-void
.end method

.method public static final getActiveSession()Lcom/facebook/Session;
    .registers 2

    .prologue
    .line 941
    sget-object v1, Lcom/facebook/Session;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 942
    :try_start_3
    sget-object v0, Lcom/facebook/Session;->activeSession:Lcom/facebook/Session;

    monitor-exit v1

    return-object v0

    .line 941
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method private getAppEventsLogger()Lcom/facebook/AppEventsLogger;
    .registers 4

    .prologue
    .line 1620
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1621
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->appEventsLogger:Lcom/facebook/AppEventsLogger;

    if-nez v0, :cond_11

    .line 1622
    sget-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/facebook/AppEventsLogger;->newLogger(Landroid/content/Context;Ljava/lang/String;)Lcom/facebook/AppEventsLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/Session;->appEventsLogger:Lcom/facebook/AppEventsLogger;

    .line 1624
    :cond_11
    iget-object v0, p0, Lcom/facebook/Session;->appEventsLogger:Lcom/facebook/AppEventsLogger;

    monitor-exit v1

    return-object v0

    .line 1620
    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method private getLoginActivityIntent(Lcom/facebook/Session$AuthorizationRequest;)Landroid/content/Intent;
    .registers 7
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    .line 1426
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 1427
    .local v2, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/facebook/LoginActivity;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1428
    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getLoginBehavior()Lcom/facebook/SessionLoginBehavior;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/SessionLoginBehavior;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1431
    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getAuthorizationClientRequest()Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    move-result-object v0

    .line 1432
    .local v0, "authClientRequest":Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    invoke-static {v0}, Lcom/facebook/LoginActivity;->populateIntentExtras(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)Landroid/os/Bundle;

    move-result-object v1

    .line 1433
    .local v1, "extras":Landroid/os/Bundle;
    invoke-virtual {v2, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1435
    return-object v2
.end method

.method static getStaticContext()Landroid/content/Context;
    .registers 1

    .prologue
    .line 1140
    sget-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    return-object v0
.end method

.method private handleAuthorizationResult(ILcom/facebook/AuthorizationClient$Result;)V
    .registers 7
    .param p1, "resultCode"    # I
    .param p2, "result"    # Lcom/facebook/AuthorizationClient$Result;

    .prologue
    .line 1315
    const/4 v1, 0x0

    .line 1316
    .local v1, "newToken":Lcom/facebook/AccessToken;
    const/4 v0, 0x0

    .line 1317
    .local v0, "exception":Ljava/lang/Exception;
    const/4 v2, -0x1

    if-ne p1, v2, :cond_23

    .line 1318
    iget-object v2, p2, Lcom/facebook/AuthorizationClient$Result;->code:Lcom/facebook/AuthorizationClient$Result$Code;

    sget-object v3, Lcom/facebook/AuthorizationClient$Result$Code;->SUCCESS:Lcom/facebook/AuthorizationClient$Result$Code;

    if-ne v2, v3, :cond_1b

    .line 1319
    iget-object v1, p2, Lcom/facebook/AuthorizationClient$Result;->token:Lcom/facebook/AccessToken;

    .line 1327
    :cond_d
    :goto_d
    iget-object v2, p2, Lcom/facebook/AuthorizationClient$Result;->code:Lcom/facebook/AuthorizationClient$Result$Code;

    iget-object v3, p2, Lcom/facebook/AuthorizationClient$Result;->loggingExtras:Ljava/util/Map;

    invoke-direct {p0, v2, v3, v0}, Lcom/facebook/Session;->logAuthorizationComplete(Lcom/facebook/AuthorizationClient$Result$Code;Ljava/util/Map;Ljava/lang/Exception;)V

    .line 1329
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    .line 1330
    invoke-virtual {p0, v1, v0}, Lcom/facebook/Session;->finishAuthOrReauth(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V

    .line 1331
    return-void

    .line 1321
    :cond_1b
    new-instance v0, Lcom/facebook/FacebookAuthorizationException;

    .end local v0    # "exception":Ljava/lang/Exception;
    iget-object v2, p2, Lcom/facebook/AuthorizationClient$Result;->errorMessage:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/facebook/FacebookAuthorizationException;-><init>(Ljava/lang/String;)V

    .line 1323
    .restart local v0    # "exception":Ljava/lang/Exception;
    goto :goto_d

    :cond_23
    if-nez p1, :cond_d

    .line 1324
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    .end local v0    # "exception":Ljava/lang/Exception;
    iget-object v2, p2, Lcom/facebook/AuthorizationClient$Result;->errorMessage:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/facebook/FacebookOperationCanceledException;-><init>(Ljava/lang/String;)V

    .restart local v0    # "exception":Ljava/lang/Exception;
    goto :goto_d
.end method

.method static handlePermissionResponse(Lcom/facebook/Response;)Lcom/facebook/Session$PermissionsPair;
    .registers 14
    .param p0, "response"    # Lcom/facebook/Response;

    .prologue
    const/4 v10, 0x0

    .line 656
    invoke-virtual {p0}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v11

    if-eqz v11, :cond_8

    .line 699
    :cond_7
    :goto_7
    return-object v10

    .line 660
    :cond_8
    const-class v11, Lcom/facebook/model/GraphMultiResult;

    invoke-virtual {p0, v11}, Lcom/facebook/Response;->getGraphObjectAs(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v8

    check-cast v8, Lcom/facebook/model/GraphMultiResult;

    .line 661
    .local v8, "result":Lcom/facebook/model/GraphMultiResult;
    if-eqz v8, :cond_7

    .line 665
    invoke-interface {v8}, Lcom/facebook/model/GraphMultiResult;->getData()Lcom/facebook/model/GraphObjectList;

    move-result-object v0

    .line 666
    .local v0, "data":Lcom/facebook/model/GraphObjectList;, "Lcom/facebook/model/GraphObjectList<Lcom/facebook/model/GraphObject;>;"
    if-eqz v0, :cond_7

    invoke-interface {v0}, Lcom/facebook/model/GraphObjectList;->size()I

    move-result v11

    if-eqz v11, :cond_7

    .line 669
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v0}, Lcom/facebook/model/GraphObjectList;->size()I

    move-result v10

    invoke-direct {v4, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 670
    .local v4, "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Lcom/facebook/model/GraphObjectList;->size()I

    move-result v10

    invoke-direct {v1, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 673
    .local v1, "declinedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Lcom/facebook/model/GraphObjectList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/model/GraphObject;

    .line 674
    .local v3, "firstObject":Lcom/facebook/model/GraphObject;
    const-string v10, "permission"

    invoke-interface {v3, v10}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_85

    .line 675
    invoke-interface {v0}, Lcom/facebook/model/GraphObjectList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_43
    :goto_43
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_4f

    .line 699
    :cond_49
    new-instance v10, Lcom/facebook/Session$PermissionsPair;

    invoke-direct {v10, v4, v1}, Lcom/facebook/Session$PermissionsPair;-><init>(Ljava/util/List;Ljava/util/List;)V

    goto :goto_7

    .line 675
    :cond_4f
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/model/GraphObject;

    .line 676
    .local v5, "graphObject":Lcom/facebook/model/GraphObject;
    const-string v11, "permission"

    invoke-interface {v5, v11}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 677
    .local v6, "permission":Ljava/lang/String;
    const-string v11, "installed"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_43

    .line 680
    const-string v11, "status"

    invoke-interface {v5, v11}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 681
    .local v9, "status":Ljava/lang/String;
    const-string v11, "granted"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_79

    .line 682
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 683
    :cond_79
    const-string v11, "declined"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_43

    .line 684
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 688
    .end local v5    # "graphObject":Lcom/facebook/model/GraphObject;
    .end local v6    # "permission":Ljava/lang/String;
    .end local v9    # "status":Ljava/lang/String;
    :cond_85
    invoke-interface {v3}, Lcom/facebook/model/GraphObject;->asMap()Ljava/util/Map;

    move-result-object v7

    .line 689
    .local v7, "permissionsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_91
    :goto_91
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_49

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 690
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v12, "installed"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_91

    .line 693
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v12, 0x1

    if-ne v10, v12, :cond_91

    .line 694
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_91
.end method

.method static initializeStaticContext(Landroid/content/Context;)V
    .registers 3
    .param p0, "currentContext"    # Landroid/content/Context;

    .prologue
    .line 1144
    if-eqz p0, :cond_e

    sget-object v1, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    if-nez v1, :cond_e

    .line 1145
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 1146
    .local v0, "applicationContext":Landroid/content/Context;
    if-eqz v0, :cond_f

    .end local v0    # "applicationContext":Landroid/content/Context;
    :goto_c
    sput-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    .line 1148
    :cond_e
    return-void

    .restart local v0    # "applicationContext":Landroid/content/Context;
    :cond_f
    move-object v0, p0

    .line 1146
    goto :goto_c
.end method

.method public static isPublishPermission(Ljava/lang/String;)Z
    .registers 2
    .param p0, "permission"    # Ljava/lang/String;

    .prologue
    .line 1307
    if-eqz p0, :cond_1c

    .line 1308
    const-string v0, "publish"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 1309
    const-string v0, "manage"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 1310
    sget-object v0, Lcom/facebook/Session;->OTHER_PUBLISH_PERMISSIONS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 1307
    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method private logAuthorizationComplete(Lcom/facebook/AuthorizationClient$Result$Code;Ljava/util/Map;Ljava/lang/Exception;)V
    .registers 12
    .param p1, "result"    # Lcom/facebook/AuthorizationClient$Result$Code;
    .param p3, "exception"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/AuthorizationClient$Result$Code;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1358
    .local p2, "resultExtras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 1359
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-nez v4, :cond_31

    .line 1361
    const-string v4, ""

    invoke-static {v4}, Lcom/facebook/AuthorizationClient;->newAuthorizationLoggingBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1362
    const-string v4, "2_result"

    .line 1363
    sget-object v5, Lcom/facebook/AuthorizationClient$Result$Code;->ERROR:Lcom/facebook/AuthorizationClient$Result$Code;

    invoke-virtual {v5}, Lcom/facebook/AuthorizationClient$Result$Code;->getLoggingValue()Ljava/lang/String;

    move-result-object v5

    .line 1362
    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1364
    const-string v4, "5_error_message"

    .line 1365
    const-string v5, "Unexpected call to logAuthorizationComplete with null pendingAuthorizationRequest."

    .line 1364
    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1395
    :cond_1d
    :goto_1d
    const-string v4, "1_timestamp_ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1397
    invoke-direct {p0}, Lcom/facebook/Session;->getAppEventsLogger()Lcom/facebook/AppEventsLogger;

    move-result-object v3

    .line 1398
    .local v3, "logger":Lcom/facebook/AppEventsLogger;
    const-string v4, "fb_mobile_login_complete"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v0}, Lcom/facebook/AppEventsLogger;->logSdkEvent(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;)V

    .line 1399
    return-void

    .line 1367
    .end local v3    # "logger":Lcom/facebook/AppEventsLogger;
    :cond_31
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    invoke-virtual {v4}, Lcom/facebook/Session$AuthorizationRequest;->getAuthId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/AuthorizationClient;->newAuthorizationLoggingBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1368
    if-eqz p1, :cond_46

    .line 1369
    const-string v4, "2_result"

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$Result$Code;->getLoggingValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1371
    :cond_46
    if-eqz p3, :cond_57

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_57

    .line 1372
    const-string v4, "5_error_message"

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1376
    :cond_57
    const/4 v2, 0x0

    .line 1377
    .local v2, "jsonObject":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->loggingExtras:Ljava/util/Map;
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$2(Lcom/facebook/Session$AuthorizationRequest;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6f

    .line 1378
    new-instance v2, Lorg/json/JSONObject;

    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->loggingExtras:Ljava/util/Map;
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$2(Lcom/facebook/Session$AuthorizationRequest;)Ljava/util/Map;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1380
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :cond_6f
    if-eqz p2, :cond_86

    .line 1381
    if-nez v2, :cond_78

    .line 1382
    new-instance v2, Lorg/json/JSONObject;

    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1385
    .restart local v2    # "jsonObject":Lorg/json/JSONObject;
    :cond_78
    :try_start_78
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_80
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_83
    .catch Lorg/json/JSONException; {:try_start_78 .. :try_end_83} :catch_a6

    move-result v4

    if-nez v4, :cond_92

    .line 1391
    :cond_86
    :goto_86
    if-eqz v2, :cond_1d

    .line 1392
    const-string v4, "6_extras"

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 1385
    :cond_92
    :try_start_92
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1386
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a5
    .catch Lorg/json/JSONException; {:try_start_92 .. :try_end_a5} :catch_a6

    goto :goto_80

    .line 1388
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_a6
    move-exception v4

    goto :goto_86
.end method

.method private logAuthorizationStart()V
    .registers 7

    .prologue
    .line 1334
    iget-object v3, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    invoke-virtual {v3}, Lcom/facebook/Session$AuthorizationRequest;->getAuthId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/AuthorizationClient;->newAuthorizationLoggingBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1335
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "1_timestamp_ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1339
    :try_start_13
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1340
    .local v1, "extras":Lorg/json/JSONObject;
    const-string v3, "login_behavior"

    .line 1341
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->loginBehavior:Lcom/facebook/SessionLoginBehavior;
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$4(Lcom/facebook/Session$AuthorizationRequest;)Lcom/facebook/SessionLoginBehavior;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/SessionLoginBehavior;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1340
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1342
    const-string v3, "request_code"

    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->requestCode:I
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$5(Lcom/facebook/Session$AuthorizationRequest;)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1343
    const-string v3, "is_legacy"

    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->isLegacy:Z
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$3(Lcom/facebook/Session$AuthorizationRequest;)Z

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 1344
    const-string v3, "permissions"

    .line 1345
    const-string v4, ","

    iget-object v5, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->permissions:Ljava/util/List;
    invoke-static {v5}, Lcom/facebook/Session$AuthorizationRequest;->access$6(Lcom/facebook/Session$AuthorizationRequest;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    .line 1344
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1346
    const-string v3, "default_audience"

    .line 1347
    iget-object v4, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->defaultAudience:Lcom/facebook/SessionDefaultAudience;
    invoke-static {v4}, Lcom/facebook/Session$AuthorizationRequest;->access$7(Lcom/facebook/Session$AuthorizationRequest;)Lcom/facebook/SessionDefaultAudience;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/SessionDefaultAudience;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1346
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1348
    const-string v3, "6_extras"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_66
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_66} :catch_71

    .line 1352
    .end local v1    # "extras":Lorg/json/JSONObject;
    :goto_66
    invoke-direct {p0}, Lcom/facebook/Session;->getAppEventsLogger()Lcom/facebook/AppEventsLogger;

    move-result-object v2

    .line 1353
    .local v2, "logger":Lcom/facebook/AppEventsLogger;
    const-string v3, "fb_mobile_login_start"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v0}, Lcom/facebook/AppEventsLogger;->logSdkEvent(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;)V

    .line 1354
    return-void

    .line 1349
    .end local v2    # "logger":Lcom/facebook/AppEventsLogger;
    :catch_71
    move-exception v3

    goto :goto_66
.end method

.method private open(Lcom/facebook/Session$OpenRequest;Lcom/facebook/internal/SessionAuthorizationType;)V
    .registers 10
    .param p1, "openRequest"    # Lcom/facebook/Session$OpenRequest;
    .param p2, "authType"    # Lcom/facebook/internal/SessionAuthorizationType;

    .prologue
    .line 1194
    invoke-direct {p0, p1, p2}, Lcom/facebook/Session;->validatePermissions(Lcom/facebook/Session$AuthorizationRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 1195
    invoke-direct {p0, p1}, Lcom/facebook/Session;->validateLoginBehavior(Lcom/facebook/Session$AuthorizationRequest;)V

    .line 1198
    iget-object v3, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 1199
    :try_start_9
    iget-object v2, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-eqz v2, :cond_1d

    .line 1200
    iget-object v2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    iget-object v4, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    new-instance v5, Ljava/lang/UnsupportedOperationException;

    .line 1201
    const-string v6, "Session: an attempt was made to open a session that has a pending request."

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 1200
    invoke-virtual {p0, v2, v4, v5}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1202
    monitor-exit v3

    .line 1239
    :cond_1c
    :goto_1c
    return-void

    .line 1204
    :cond_1d
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1206
    .local v1, "oldState":Lcom/facebook/SessionState;
    invoke-static {}, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState()[I

    move-result-object v2

    iget-object v4, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v4}, Lcom/facebook/SessionState;->ordinal()I

    move-result v4

    aget v2, v2, v4

    packed-switch v2, :pswitch_data_8a

    .line 1227
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    .line 1228
    const-string v4, "Session: an attempt was made to open an already opened session."

    .line 1227
    invoke-direct {v2, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1198
    .end local v1    # "oldState":Lcom/facebook/SessionState;
    :catchall_36
    move-exception v2

    monitor-exit v3
    :try_end_38
    .catchall {:try_start_9 .. :try_end_38} :catchall_36

    throw v2

    .line 1208
    .restart local v1    # "oldState":Lcom/facebook/SessionState;
    :pswitch_39
    :try_start_39
    sget-object v0, Lcom/facebook/SessionState;->OPENING:Lcom/facebook/SessionState;

    .local v0, "newState":Lcom/facebook/SessionState;
    iput-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1209
    if-nez p1, :cond_47

    .line 1210
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "openRequest cannot be null when opening a new Session"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1212
    :cond_47
    iput-object p1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 1230
    :goto_49
    if-eqz p1, :cond_52

    .line 1231
    invoke-virtual {p1}, Lcom/facebook/Session$OpenRequest;->getCallback()Lcom/facebook/Session$StatusCallback;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/facebook/Session;->addCallback(Lcom/facebook/Session$StatusCallback;)V

    .line 1233
    :cond_52
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1198
    monitor-exit v3
    :try_end_57
    .catchall {:try_start_39 .. :try_end_57} :catchall_36

    .line 1236
    sget-object v2, Lcom/facebook/SessionState;->OPENING:Lcom/facebook/SessionState;

    if-ne v0, v2, :cond_1c

    .line 1237
    invoke-virtual {p0, p1}, Lcom/facebook/Session;->authorize(Lcom/facebook/Session$AuthorizationRequest;)V

    goto :goto_1c

    .line 1215
    .end local v0    # "newState":Lcom/facebook/SessionState;
    :pswitch_5f
    if-eqz p1, :cond_7b

    :try_start_61
    invoke-virtual {p1}, Lcom/facebook/Session$OpenRequest;->getPermissions()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_7b

    .line 1216
    invoke-virtual {p1}, Lcom/facebook/Session$OpenRequest;->getPermissions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/facebook/internal/Utility;->isSubset(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_7b

    .line 1217
    iput-object p1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 1220
    :cond_7b
    iget-object v2, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-nez v2, :cond_84

    .line 1221
    sget-object v0, Lcom/facebook/SessionState;->OPENED:Lcom/facebook/SessionState;

    .restart local v0    # "newState":Lcom/facebook/SessionState;
    iput-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    goto :goto_49

    .line 1223
    .end local v0    # "newState":Lcom/facebook/SessionState;
    :cond_84
    sget-object v0, Lcom/facebook/SessionState;->OPENING:Lcom/facebook/SessionState;

    .restart local v0    # "newState":Lcom/facebook/SessionState;
    iput-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;
    :try_end_88
    .catchall {:try_start_61 .. :try_end_88} :catchall_36

    goto :goto_49

    .line 1206
    nop

    :pswitch_data_8a
    .packed-switch 0x1
        :pswitch_39
        :pswitch_5f
    .end packed-switch
.end method

.method public static openActiveSession(Landroid/app/Activity;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "allowLoginUI"    # Z
    .param p2, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 1017
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p0}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p2}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/facebook/Session;->openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;

    move-result-object v0

    return-object v0
.end method

.method public static openActiveSession(Landroid/app/Activity;ZLjava/util/List;Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "allowLoginUI"    # Z
    .param p3, "callback"    # Lcom/facebook/Session$StatusCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/Session$StatusCallback;",
            ")",
            "Lcom/facebook/Session;"
        }
    .end annotation

    .prologue
    .line 1042
    .line 1044
    .local p2, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p0}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p3}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    .line 1041
    invoke-static {p0, p1, v0}, Lcom/facebook/Session;->openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;

    move-result-object v0

    return-object v0
.end method

.method public static openActiveSession(Landroid/content/Context;Landroid/support/v4/app/Fragment;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "allowLoginUI"    # Z
    .param p3, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 1067
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p1}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v0, p3}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    invoke-static {p0, p2, v0}, Lcom/facebook/Session;->openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;

    move-result-object v0

    return-object v0
.end method

.method public static openActiveSession(Landroid/content/Context;Landroid/support/v4/app/Fragment;ZLjava/util/List;Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "allowLoginUI"    # Z
    .param p4, "callback"    # Lcom/facebook/Session$StatusCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/support/v4/app/Fragment;",
            "Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/Session$StatusCallback;",
            ")",
            "Lcom/facebook/Session;"
        }
    .end annotation

    .prologue
    .line 1093
    .line 1095
    .local p3, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p1}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v0, p4}, Lcom/facebook/Session$OpenRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    .line 1092
    invoke-static {p0, p2, v0}, Lcom/facebook/Session;->openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;

    move-result-object v0

    return-object v0
.end method

.method private static openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "allowLoginUI"    # Z
    .param p2, "openRequest"    # Lcom/facebook/Session$OpenRequest;

    .prologue
    .line 1130
    new-instance v1, Lcom/facebook/Session$Builder;

    invoke-direct {v1, p0}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v0

    .line 1131
    .local v0, "session":Lcom/facebook/Session;
    sget-object v1, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/SessionState;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    if-eqz p1, :cond_1e

    .line 1132
    :cond_17
    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 1133
    invoke-virtual {v0, p2}, Lcom/facebook/Session;->openForRead(Lcom/facebook/Session$OpenRequest;)V

    .line 1136
    .end local v0    # "session":Lcom/facebook/Session;
    :goto_1d
    return-object v0

    .restart local v0    # "session":Lcom/facebook/Session;
    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public static openActiveSessionFromCache(Landroid/content/Context;)Lcom/facebook/Session;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 995
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/facebook/Session;->openActiveSession(Landroid/content/Context;ZLcom/facebook/Session$OpenRequest;)Lcom/facebook/Session;

    move-result-object v0

    return-object v0
.end method

.method public static openActiveSessionWithAccessToken(Landroid/content/Context;Lcom/facebook/AccessToken;Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "accessToken"    # Lcom/facebook/AccessToken;
    .param p2, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    const/4 v2, 0x0

    .line 1121
    new-instance v0, Lcom/facebook/Session;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v2, v2, v1}, Lcom/facebook/Session;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/TokenCachingStrategy;Z)V

    .line 1123
    .local v0, "session":Lcom/facebook/Session;
    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 1124
    invoke-virtual {v0, p1, p2}, Lcom/facebook/Session;->open(Lcom/facebook/AccessToken;Lcom/facebook/Session$StatusCallback;)V

    .line 1126
    return-object v0
.end method

.method static postActiveSessionAction(Ljava/lang/String;)V
    .registers 3
    .param p0, "action"    # Ljava/lang/String;

    .prologue
    .line 1568
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1570
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 1571
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidObjectException;
        }
    .end annotation

    .prologue
    .line 867
    new-instance v0, Ljava/io/InvalidObjectException;

    const-string v1, "Cannot readObject, serialization proxy required"

    invoke-direct {v0, v1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private requestNewPermissions(Lcom/facebook/Session$NewPermissionsRequest;Lcom/facebook/internal/SessionAuthorizationType;)V
    .registers 6
    .param p1, "newPermissionsRequest"    # Lcom/facebook/Session$NewPermissionsRequest;
    .param p2, "authType"    # Lcom/facebook/internal/SessionAuthorizationType;

    .prologue
    .line 1242
    invoke-direct {p0, p1, p2}, Lcom/facebook/Session;->validatePermissions(Lcom/facebook/Session$AuthorizationRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 1243
    invoke-direct {p0, p1}, Lcom/facebook/Session;->validateLoginBehavior(Lcom/facebook/Session$AuthorizationRequest;)V

    .line 1245
    if-eqz p1, :cond_36

    .line 1246
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1247
    :try_start_b
    iget-object v0, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-eqz v0, :cond_1a

    .line 1248
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 1249
    const-string v2, "Session: an attempt was made to request new permissions for a session that has a pending request."

    .line 1248
    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1246
    :catchall_17
    move-exception v0

    monitor-exit v1
    :try_end_19
    .catchall {:try_start_b .. :try_end_19} :catchall_17

    throw v0

    .line 1251
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v0}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 1252
    iput-object p1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 1246
    monitor-exit v1
    :try_end_25
    .catchall {:try_start_1a .. :try_end_25} :catchall_17

    .line 1262
    invoke-virtual {p0}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/Session$NewPermissionsRequest;->setValidateSameFbidAsToken(Ljava/lang/String;)V

    .line 1263
    invoke-virtual {p1}, Lcom/facebook/Session$NewPermissionsRequest;->getCallback()Lcom/facebook/Session$StatusCallback;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/facebook/Session;->addCallback(Lcom/facebook/Session$StatusCallback;)V

    .line 1264
    invoke-virtual {p0, p1}, Lcom/facebook/Session;->authorize(Lcom/facebook/Session$AuthorizationRequest;)V

    .line 1266
    :cond_36
    return-void

    .line 1253
    :cond_37
    :try_start_37
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v0}, Lcom/facebook/SessionState;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 1254
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 1255
    const-string v2, "Session: an attempt was made to request new permissions for a session that has been closed."

    .line 1254
    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1257
    :cond_47
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 1258
    const-string v2, "Session: an attempt was made to request new permissions for a session that is not currently open."

    .line 1257
    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4f
    .catchall {:try_start_37 .. :try_end_4f} :catchall_17
.end method

.method private resolveIntent(Landroid/content/Intent;)Z
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v1, 0x0

    .line 1418
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 1419
    .local v0, "resolveInfo":Landroid/content/pm/ResolveInfo;
    if-nez v0, :cond_10

    .line 1422
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x1

    goto :goto_f
.end method

.method public static final restoreSession(Landroid/content/Context;Lcom/facebook/TokenCachingStrategy;Lcom/facebook/Session$StatusCallback;Landroid/os/Bundle;)Lcom/facebook/Session;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cachingStrategy"    # Lcom/facebook/TokenCachingStrategy;
    .param p2, "callback"    # Lcom/facebook/Session$StatusCallback;
    .param p3, "bundle"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 906
    if-nez p3, :cond_5

    move-object v3, v4

    .line 931
    :goto_4
    return-object v3

    .line 909
    :cond_5
    const-string v5, "com.facebook.sdk.Session.saveSessionKey"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 910
    .local v0, "data":[B
    if-eqz v0, :cond_3a

    .line 911
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 913
    .local v2, "is":Ljava/io/ByteArrayInputStream;
    :try_start_12
    new-instance v5, Ljava/io/ObjectInputStream;

    invoke-direct {v5, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/Session;

    .line 914
    .local v3, "session":Lcom/facebook/Session;
    invoke-static {p0}, Lcom/facebook/Session;->initializeStaticContext(Landroid/content/Context;)V

    .line 915
    if-eqz p1, :cond_3c

    .line 916
    iput-object p1, v3, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    .line 920
    :goto_24
    if-eqz p2, :cond_29

    .line 921
    invoke-virtual {v3, p2}, Lcom/facebook/Session;->addCallback(Lcom/facebook/Session$StatusCallback;)V

    .line 923
    :cond_29
    const-string v5, "com.facebook.sdk.Session.authBundleKey"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    iput-object v5, v3, Lcom/facebook/Session;->authorizationBundle:Landroid/os/Bundle;
    :try_end_31
    .catch Ljava/lang/ClassNotFoundException; {:try_start_12 .. :try_end_31} :catch_32
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_31} :catch_44

    goto :goto_4

    .line 925
    .end local v3    # "session":Lcom/facebook/Session;
    :catch_32
    move-exception v1

    .line 926
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-object v5, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    const-string v6, "Unable to restore session"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v2    # "is":Ljava/io/ByteArrayInputStream;
    :cond_3a
    :goto_3a
    move-object v3, v4

    .line 931
    goto :goto_4

    .line 918
    .restart local v2    # "is":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "session":Lcom/facebook/Session;
    :cond_3c
    :try_start_3c
    new-instance v5, Lcom/facebook/SharedPreferencesTokenCachingStrategy;

    invoke-direct {v5, p0}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;-><init>(Landroid/content/Context;)V

    iput-object v5, v3, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;
    :try_end_43
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3c .. :try_end_43} :catch_32
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_43} :catch_44

    goto :goto_24

    .line 927
    .end local v3    # "session":Lcom/facebook/Session;
    :catch_44
    move-exception v1

    .line 928
    .local v1, "e":Ljava/io/IOException;
    sget-object v5, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    const-string v6, "Unable to restore session."

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3a
.end method

.method private static runWithHandlerOrExecutor(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 3
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 1574
    if-eqz p0, :cond_6

    .line 1575
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1579
    :goto_5
    return-void

    .line 1577
    :cond_6
    invoke-static {}, Lcom/facebook/Settings;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_5
.end method

.method public static final saveSession(Lcom/facebook/Session;Landroid/os/Bundle;)V
    .registers 6
    .param p0, "session"    # Lcom/facebook/Session;
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 878
    if-eqz p1, :cond_29

    if-eqz p0, :cond_29

    const-string v2, "com.facebook.sdk.Session.saveSessionKey"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_29

    .line 879
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 881
    .local v1, "outputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_11
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v2, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_19} :catch_2a

    .line 885
    const-string v2, "com.facebook.sdk.Session.saveSessionKey"

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 886
    const-string v2, "com.facebook.sdk.Session.authBundleKey"

    iget-object v3, p0, Lcom/facebook/Session;->authorizationBundle:Landroid/os/Bundle;

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 888
    .end local v1    # "outputStream":Ljava/io/ByteArrayOutputStream;
    :cond_29
    return-void

    .line 882
    .restart local v1    # "outputStream":Ljava/io/ByteArrayOutputStream;
    :catch_2a
    move-exception v0

    .line 883
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/facebook/FacebookException;

    const-string v3, "Unable to save session."

    invoke-direct {v2, v3, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private saveTokenToCache(Lcom/facebook/AccessToken;)V
    .registers 4
    .param p1, "newToken"    # Lcom/facebook/AccessToken;

    .prologue
    .line 1516
    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    if-eqz v0, :cond_f

    .line 1517
    iget-object v0, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    invoke-virtual {p1}, Lcom/facebook/AccessToken;->toCacheBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/TokenCachingStrategy;->save(Landroid/os/Bundle;)V

    .line 1519
    :cond_f
    return-void
.end method

.method public static final setActiveSession(Lcom/facebook/Session;)V
    .registers 4
    .param p0, "session"    # Lcom/facebook/Session;

    .prologue
    .line 962
    sget-object v2, Lcom/facebook/Session;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 963
    :try_start_3
    sget-object v1, Lcom/facebook/Session;->activeSession:Lcom/facebook/Session;

    if-eq p0, v1, :cond_29

    .line 964
    sget-object v0, Lcom/facebook/Session;->activeSession:Lcom/facebook/Session;

    .line 966
    .local v0, "oldSession":Lcom/facebook/Session;
    if-eqz v0, :cond_e

    .line 967
    invoke-virtual {v0}, Lcom/facebook/Session;->close()V

    .line 970
    :cond_e
    sput-object p0, Lcom/facebook/Session;->activeSession:Lcom/facebook/Session;

    .line 972
    if-eqz v0, :cond_17

    .line 973
    const-string v1, "com.facebook.sdk.ACTIVE_SESSION_UNSET"

    invoke-static {v1}, Lcom/facebook/Session;->postActiveSessionAction(Ljava/lang/String;)V

    .line 976
    :cond_17
    if-eqz p0, :cond_29

    .line 977
    const-string v1, "com.facebook.sdk.ACTIVE_SESSION_SET"

    invoke-static {v1}, Lcom/facebook/Session;->postActiveSessionAction(Ljava/lang/String;)V

    .line 979
    invoke-virtual {p0}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 980
    const-string v1, "com.facebook.sdk.ACTIVE_SESSION_OPENED"

    invoke-static {v1}, Lcom/facebook/Session;->postActiveSessionAction(Ljava/lang/String;)V

    .line 962
    .end local v0    # "oldSession":Lcom/facebook/Session;
    :cond_29
    monitor-exit v2

    .line 985
    return-void

    .line 962
    :catchall_2b
    move-exception v1

    monitor-exit v2
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method private tryLegacyAuth(Lcom/facebook/Session$AuthorizationRequest;)V
    .registers 4
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    .line 1439
    new-instance v0, Lcom/facebook/AuthorizationClient;

    invoke-direct {v0}, Lcom/facebook/AuthorizationClient;-><init>()V

    iput-object v0, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    .line 1440
    iget-object v0, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    new-instance v1, Lcom/facebook/Session$3;

    invoke-direct {v1, p0}, Lcom/facebook/Session$3;-><init>(Lcom/facebook/Session;)V

    invoke-virtual {v0, v1}, Lcom/facebook/AuthorizationClient;->setOnCompletedListener(Lcom/facebook/AuthorizationClient$OnCompletedListener;)V

    .line 1452
    iget-object v0, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/AuthorizationClient;->setContext(Landroid/content/Context;)V

    .line 1453
    iget-object v0, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getAuthorizationClientRequest()Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/AuthorizationClient;->startOrContinueAuth(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)V

    .line 1454
    return-void
.end method

.method private tryLoginActivity(Lcom/facebook/Session$AuthorizationRequest;)Z
    .registers 7
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    const/4 v2, 0x0

    .line 1402
    invoke-direct {p0, p1}, Lcom/facebook/Session;->getLoginActivityIntent(Lcom/facebook/Session$AuthorizationRequest;)Landroid/content/Intent;

    move-result-object v1

    .line 1404
    .local v1, "intent":Landroid/content/Intent;
    invoke-direct {p0, v1}, Lcom/facebook/Session;->resolveIntent(Landroid/content/Intent;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 1414
    :goto_b
    return v2

    .line 1409
    :cond_c
    :try_start_c
    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getStartActivityDelegate()Lcom/facebook/Session$StartActivityDelegate;

    move-result-object v3

    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getRequestCode()I

    move-result v4

    invoke-interface {v3, v1, v4}, Lcom/facebook/Session$StartActivityDelegate;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_17
    .catch Landroid/content/ActivityNotFoundException; {:try_start_c .. :try_end_17} :catch_19

    .line 1414
    const/4 v2, 0x1

    goto :goto_b

    .line 1410
    :catch_19
    move-exception v0

    .line 1411
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    goto :goto_b
.end method

.method private validateLoginBehavior(Lcom/facebook/Session$AuthorizationRequest;)V
    .registers 8
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    .line 1269
    if-eqz p1, :cond_3b

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->isLegacy:Z
    invoke-static {p1}, Lcom/facebook/Session$AuthorizationRequest;->access$3(Lcom/facebook/Session$AuthorizationRequest;)Z

    move-result v1

    if-nez v1, :cond_3b

    .line 1270
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1271
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/facebook/LoginActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1272
    invoke-direct {p0, v0}, Lcom/facebook/Session;->resolveIntent(Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_3b

    .line 1273
    new-instance v1, Lcom/facebook/FacebookException;

    .line 1274
    const-string v2, "Cannot use SessionLoginBehavior %s when %s is not declared as an activity in AndroidManifest.xml"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 1275
    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getLoginBehavior()Lcom/facebook/SessionLoginBehavior;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Lcom/facebook/LoginActivity;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1273
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1278
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_3b
    return-void
.end method

.method private validatePermissions(Lcom/facebook/Session$AuthorizationRequest;Lcom/facebook/internal/SessionAuthorizationType;)V
    .registers 10
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;
    .param p2, "authType"    # Lcom/facebook/internal/SessionAuthorizationType;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1281
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 1282
    :cond_e
    sget-object v1, Lcom/facebook/internal/SessionAuthorizationType;->PUBLISH:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-virtual {v1, p2}, Lcom/facebook/internal/SessionAuthorizationType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 1283
    new-instance v1, Lcom/facebook/FacebookException;

    const-string v2, "Cannot request publish or manage authorization with no permissions."

    invoke-direct {v1, v2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1287
    :cond_1e
    invoke-virtual {p1}, Lcom/facebook/Session$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_26
    :goto_26
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 1304
    :cond_2c
    return-void

    .line 1287
    :cond_2d
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1288
    .local v0, "permission":Ljava/lang/String;
    invoke-static {v0}, Lcom/facebook/Session;->isPublishPermission(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 1289
    sget-object v2, Lcom/facebook/internal/SessionAuthorizationType;->READ:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-virtual {v2, p2}, Lcom/facebook/internal/SessionAuthorizationType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 1290
    new-instance v1, Lcom/facebook/FacebookException;

    .line 1292
    const-string v2, "Cannot pass a publish or manage permission (%s) to a request for read authorization"

    new-array v3, v6, [Ljava/lang/Object;

    .line 1293
    aput-object v0, v3, v5

    .line 1291
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1290
    invoke-direct {v1, v2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1296
    :cond_51
    sget-object v2, Lcom/facebook/internal/SessionAuthorizationType;->PUBLISH:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-virtual {v2, p2}, Lcom/facebook/internal/SessionAuthorizationType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 1297
    sget-object v2, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    .line 1299
    const-string v3, "Should not pass a read permission (%s) to a request for publish or manage authorization"

    new-array v4, v6, [Ljava/lang/Object;

    .line 1300
    aput-object v0, v4, v5

    .line 1298
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1297
    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26
.end method

.method private writeReplace()Ljava/lang/Object;
    .registers 8

    .prologue
    .line 861
    new-instance v0, Lcom/facebook/Session$SerializationProxyV1;

    iget-object v1, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    iget-object v3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 862
    iget-object v4, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    .line 861
    invoke-direct/range {v0 .. v6}, Lcom/facebook/Session$SerializationProxyV1;-><init>(Ljava/lang/String;Lcom/facebook/SessionState;Lcom/facebook/AccessToken;Ljava/util/Date;ZLcom/facebook/Session$AuthorizationRequest;)V

    return-object v0
.end method


# virtual methods
.method public final addCallback(Lcom/facebook/Session$StatusCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 812
    iget-object v1, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    monitor-enter v1

    .line 813
    if-eqz p1, :cond_12

    :try_start_5
    iget-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 814
    iget-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 812
    :cond_12
    monitor-exit v1

    .line 817
    return-void

    .line 812
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_14

    throw v0
.end method

.method authorize(Lcom/facebook/Session$AuthorizationRequest;)V
    .registers 8
    .param p1, "request"    # Lcom/facebook/Session$AuthorizationRequest;

    .prologue
    .line 1151
    const/4 v2, 0x0

    .line 1153
    .local v2, "started":Z
    iget-object v3, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/facebook/Session$AuthorizationRequest;->setApplicationId(Ljava/lang/String;)V

    .line 1155
    invoke-direct {p0}, Lcom/facebook/Session;->autoPublishAsync()V

    .line 1157
    invoke-direct {p0}, Lcom/facebook/Session;->logAuthorizationStart()V

    .line 1159
    invoke-direct {p0, p1}, Lcom/facebook/Session;->tryLoginActivity(Lcom/facebook/Session$AuthorizationRequest;)Z

    move-result v2

    .line 1161
    iget-object v3, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->loggingExtras:Ljava/util/Map;
    invoke-static {v3}, Lcom/facebook/Session$AuthorizationRequest;->access$2(Lcom/facebook/Session$AuthorizationRequest;)Ljava/util/Map;

    move-result-object v4

    const-string v5, "try_login_activity"

    .line 1162
    if-eqz v2, :cond_66

    const-string v3, "1"

    .line 1161
    :goto_1c
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1164
    if-nez v2, :cond_38

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->isLegacy:Z
    invoke-static {p1}, Lcom/facebook/Session$AuthorizationRequest;->access$3(Lcom/facebook/Session$AuthorizationRequest;)Z

    move-result v3

    if-eqz v3, :cond_38

    .line 1165
    iget-object v3, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->loggingExtras:Ljava/util/Map;
    invoke-static {v3}, Lcom/facebook/Session$AuthorizationRequest;->access$2(Lcom/facebook/Session$AuthorizationRequest;)Ljava/util/Map;

    move-result-object v3

    const-string v4, "try_legacy"

    .line 1166
    const-string v5, "1"

    .line 1165
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1168
    invoke-direct {p0, p1}, Lcom/facebook/Session;->tryLegacyAuth(Lcom/facebook/Session$AuthorizationRequest;)V

    .line 1169
    const/4 v2, 0x1

    .line 1172
    :cond_38
    if-nez v2, :cond_65

    .line 1173
    iget-object v4, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 1174
    :try_start_3d
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1176
    .local v1, "oldState":Lcom/facebook/SessionState;
    invoke-static {}, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState()[I

    move-result-object v3

    iget-object v5, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v5}, Lcom/facebook/SessionState;->ordinal()I

    move-result v5

    aget v3, v3, v5

    packed-switch v3, :pswitch_data_6e

    .line 1182
    sget-object v3, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    iput-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 1184
    new-instance v0, Lcom/facebook/FacebookException;

    .line 1185
    const-string v3, "Log in attempt failed: LoginActivity could not be started, and not legacy request"

    .line 1184
    invoke-direct {v0, v3}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 1186
    .local v0, "exception":Ljava/lang/Exception;
    sget-object v3, Lcom/facebook/AuthorizationClient$Result$Code;->ERROR:Lcom/facebook/AuthorizationClient$Result$Code;

    const/4 v5, 0x0

    invoke-direct {p0, v3, v5, v0}, Lcom/facebook/Session;->logAuthorizationComplete(Lcom/facebook/AuthorizationClient$Result$Code;Ljava/util/Map;Ljava/lang/Exception;)V

    .line 1187
    iget-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {p0, v1, v3, v0}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1173
    monitor-exit v4
    :try_end_65
    .catchall {:try_start_3d .. :try_end_65} :catchall_6b

    .line 1191
    .end local v0    # "exception":Ljava/lang/Exception;
    .end local v1    # "oldState":Lcom/facebook/SessionState;
    :cond_65
    :goto_65
    return-void

    .line 1162
    :cond_66
    const-string v3, "0"

    goto :goto_1c

    .line 1179
    .restart local v1    # "oldState":Lcom/facebook/SessionState;
    :pswitch_69
    :try_start_69
    monitor-exit v4

    goto :goto_65

    .line 1173
    .end local v1    # "oldState":Lcom/facebook/SessionState;
    :catchall_6b
    move-exception v3

    monitor-exit v4
    :try_end_6d
    .catchall {:try_start_69 .. :try_end_6d} :catchall_6b

    throw v3

    .line 1176
    :pswitch_data_6e
    .packed-switch 0x6
        :pswitch_69
        :pswitch_69
    .end packed-switch
.end method

.method public final close()V
    .registers 6

    .prologue
    .line 768
    iget-object v2, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 769
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 771
    .local v0, "oldState":Lcom/facebook/SessionState;
    invoke-static {}, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState()[I

    move-result-object v1

    iget-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v3}, Lcom/facebook/SessionState;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_36

    .line 768
    :goto_14
    monitor-exit v2

    .line 791
    return-void

    .line 774
    :pswitch_16
    sget-object v1, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 775
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    new-instance v3, Lcom/facebook/FacebookException;

    .line 776
    const-string v4, "Log in attempt aborted."

    invoke-direct {v3, v4}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 775
    invoke-virtual {p0, v0, v1, v3}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    goto :goto_14

    .line 768
    .end local v0    # "oldState":Lcom/facebook/SessionState;
    :catchall_27
    move-exception v1

    monitor-exit v2
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_27

    throw v1

    .line 782
    .restart local v0    # "oldState":Lcom/facebook/SessionState;
    :pswitch_2a
    :try_start_2a
    sget-object v1, Lcom/facebook/SessionState;->CLOSED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 783
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v3}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    :try_end_34
    .catchall {:try_start_2a .. :try_end_34} :catchall_27

    goto :goto_14

    .line 771
    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_16
        :pswitch_2a
        :pswitch_16
        :pswitch_2a
        :pswitch_2a
    .end packed-switch
.end method

.method public final closeAndClearTokenInformation()V
    .registers 2

    .prologue
    .line 798
    iget-object v0, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    if-eqz v0, :cond_9

    .line 799
    iget-object v0, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    invoke-virtual {v0}, Lcom/facebook/TokenCachingStrategy;->clear()V

    .line 801
    :cond_9
    sget-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/internal/Utility;->clearFacebookCookies(Landroid/content/Context;)V

    .line 802
    sget-object v0, Lcom/facebook/Session;->staticContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/internal/Utility;->clearCaches(Landroid/content/Context;)V

    .line 803
    invoke-virtual {p0}, Lcom/facebook/Session;->close()V

    .line 804
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "otherObj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1754
    instance-of v2, p1, Lcom/facebook/Session;

    if-nez v2, :cond_6

    .line 1759
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 1757
    check-cast v0, Lcom/facebook/Session;

    .line 1759
    .local v0, "other":Lcom/facebook/Session;
    iget-object v2, v0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    iget-object v3, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/facebook/Session;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1760
    iget-object v2, v0, Lcom/facebook/Session;->authorizationBundle:Landroid/os/Bundle;

    iget-object v3, p0, Lcom/facebook/Session;->authorizationBundle:Landroid/os/Bundle;

    invoke-static {v2, v3}, Lcom/facebook/Session;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1761
    iget-object v2, v0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    iget-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-static {v2, v3}, Lcom/facebook/Session;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1762
    invoke-virtual {v0}, Lcom/facebook/Session;->getExpirationDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {p0}, Lcom/facebook/Session;->getExpirationDate()Ljava/util/Date;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/facebook/Session;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1759
    const/4 v1, 0x1

    goto :goto_5
.end method

.method extendAccessToken()V
    .registers 5

    .prologue
    .line 1588
    const/4 v0, 0x0

    .line 1589
    .local v0, "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    iget-object v3, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 1590
    :try_start_4
    iget-object v2, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    if-nez v2, :cond_10

    .line 1591
    new-instance v1, Lcom/facebook/Session$TokenRefreshRequest;

    invoke-direct {v1, p0}, Lcom/facebook/Session$TokenRefreshRequest;-><init>(Lcom/facebook/Session;)V
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_17

    .line 1592
    .end local v0    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    .local v1, "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    :try_start_d
    iput-object v1, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;
    :try_end_f
    .catchall {:try_start_d .. :try_end_f} :catchall_1a

    move-object v0, v1

    .line 1589
    .end local v1    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    .restart local v0    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    :cond_10
    :try_start_10
    monitor-exit v3
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_17

    .line 1596
    if-eqz v0, :cond_16

    .line 1597
    invoke-virtual {v0}, Lcom/facebook/Session$TokenRefreshRequest;->bind()V

    .line 1599
    :cond_16
    return-void

    .line 1589
    :catchall_17
    move-exception v2

    :goto_18
    :try_start_18
    monitor-exit v3
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v2

    .end local v0    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    .restart local v1    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    :catchall_1a
    move-exception v2

    move-object v0, v1

    .end local v1    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    .restart local v0    # "newTokenRefreshRequest":Lcom/facebook/Session$TokenRefreshRequest;
    goto :goto_18
.end method

.method extendAccessTokenIfNeeded()V
    .registers 2

    .prologue
    .line 1582
    invoke-virtual {p0}, Lcom/facebook/Session;->shouldExtendAccessToken()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1583
    invoke-virtual {p0}, Lcom/facebook/Session;->extendAccessToken()V

    .line 1585
    :cond_9
    return-void
.end method

.method extendTokenCompleted(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 838
    iget-object v2, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 839
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 841
    .local v0, "oldState":Lcom/facebook/SessionState;
    invoke-static {}, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState()[I

    move-result-object v1

    iget-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v3}, Lcom/facebook/SessionState;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_52

    .line 850
    sget-object v1, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "refreshToken ignored in state "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    monitor-exit v2

    .line 858
    :goto_2b
    return-void

    .line 843
    :pswitch_2c
    sget-object v1, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 844
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v3}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 853
    :pswitch_36
    iget-object v1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-static {v1, p1}, Lcom/facebook/AccessToken;->createFromRefresh(Lcom/facebook/AccessToken;Landroid/os/Bundle;)Lcom/facebook/AccessToken;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 854
    iget-object v1, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    if-eqz v1, :cond_4d

    .line 855
    iget-object v1, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    iget-object v3, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v3}, Lcom/facebook/AccessToken;->toCacheBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/facebook/TokenCachingStrategy;->save(Landroid/os/Bundle;)V

    .line 838
    :cond_4d
    monitor-exit v2

    goto :goto_2b

    .end local v0    # "oldState":Lcom/facebook/SessionState;
    :catchall_4f
    move-exception v1

    monitor-exit v2
    :try_end_51
    .catchall {:try_start_3 .. :try_end_51} :catchall_4f

    throw v1

    .line 841
    :pswitch_data_52
    .packed-switch 0x4
        :pswitch_2c
        :pswitch_36
    .end packed-switch
.end method

.method finishAuthOrReauth(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V
    .registers 7
    .param p1, "newToken"    # Lcom/facebook/AccessToken;
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 1458
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Lcom/facebook/AccessToken;->isInvalid()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1459
    const/4 p1, 0x0

    .line 1460
    new-instance p2, Lcom/facebook/FacebookException;

    .end local p2    # "exception":Ljava/lang/Exception;
    const-string v0, "Invalid access token."

    invoke-direct {p2, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 1464
    .restart local p2    # "exception":Ljava/lang/Exception;
    :cond_10
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 1465
    :try_start_13
    invoke-static {}, Lcom/facebook/Session;->$SWITCH_TABLE$com$facebook$SessionState()[I

    move-result-object v0

    iget-object v2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v2}, Lcom/facebook/SessionState;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_46

    .line 1464
    :goto_22
    monitor-exit v1

    .line 1485
    return-void

    .line 1468
    :pswitch_24
    invoke-direct {p0, p1, p2}, Lcom/facebook/Session;->finishAuthorization(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V

    goto :goto_22

    .line 1464
    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_13 .. :try_end_2a} :catchall_28

    throw v0

    .line 1474
    :pswitch_2b
    :try_start_2b
    invoke-direct {p0, p1, p2}, Lcom/facebook/Session;->finishReauthorization(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V

    goto :goto_22

    .line 1481
    :pswitch_2f
    sget-object v0, Lcom/facebook/Session;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected call to finishAuthOrReauth in state "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_2b .. :try_end_45} :catchall_28

    goto :goto_22

    .line 1465
    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_2f
        :pswitch_24
        :pswitch_2b
        :pswitch_2b
        :pswitch_2f
        :pswitch_2f
    .end packed-switch
.end method

.method public final getAccessToken()Ljava/lang/String;
    .registers 3

    .prologue
    .line 374
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 375
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit v1

    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v0}, Lcom/facebook/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    .line 374
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public final getApplicationId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 365
    iget-object v0, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    return-object v0
.end method

.method public final getAuthorizationBundle()Landroid/os/Bundle;
    .registers 3

    .prologue
    .line 325
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 326
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->authorizationBundle:Landroid/os/Bundle;

    monitor-exit v1

    return-object v0

    .line 325
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public final getDeclinedPermissions()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 439
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 440
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit v1

    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v0}, Lcom/facebook/AccessToken;->getDeclinedPermissions()Ljava/util/List;

    move-result-object v0

    goto :goto_8

    .line 439
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public final getExpirationDate()Ljava/util/Date;
    .registers 3

    .prologue
    .line 391
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 392
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit v1

    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v0}, Lcom/facebook/AccessToken;->getExpires()Ljava/util/Date;

    move-result-object v0

    goto :goto_8

    .line 391
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method getLastAttemptedTokenExtendDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 1637
    iget-object v0, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    return-object v0
.end method

.method public final getPermissions()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 410
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 411
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit v1

    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v0}, Lcom/facebook/AccessToken;->getPermissions()Ljava/util/List;

    move-result-object v0

    goto :goto_8

    .line 410
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public final getState()Lcom/facebook/SessionState;
    .registers 3

    .prologue
    .line 354
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 355
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    monitor-exit v1

    return-object v0

    .line 354
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method getTokenInfo()Lcom/facebook/AccessToken;
    .registers 2

    .prologue
    .line 1629
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1749
    const/4 v0, 0x0

    return v0
.end method

.method public final isClosed()Z
    .registers 3

    .prologue
    .line 342
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 343
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v0}, Lcom/facebook/SessionState;->isClosed()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 342
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public final isOpened()Z
    .registers 3

    .prologue
    .line 336
    iget-object v1, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 337
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v0}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 336
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public isPermissionGranted(Ljava/lang/String;)Z
    .registers 4
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 424
    invoke-virtual {p0}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v0

    .line 425
    .local v0, "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_b

    .line 426
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 428
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public final onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
    .registers 12
    .param p1, "currentActivity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "resultCode"    # I
    .param p4, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    .line 723
    const-string v4, "currentActivity"

    invoke-static {p1, v4}, Lcom/facebook/internal/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 725
    invoke-static {p1}, Lcom/facebook/Session;->initializeStaticContext(Landroid/content/Context;)V

    .line 727
    iget-object v4, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 728
    :try_start_d
    iget-object v5, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-eqz v5, :cond_19

    iget-object v5, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    invoke-virtual {v5}, Lcom/facebook/Session$AuthorizationRequest;->getRequestCode()I

    move-result v5

    if-eq p2, v5, :cond_1c

    .line 729
    :cond_19
    monitor-exit v4

    const/4 v3, 0x0

    .line 760
    :goto_1b
    return v3

    .line 727
    :cond_1c
    monitor-exit v4
    :try_end_1d
    .catchall {:try_start_d .. :try_end_1d} :catchall_30

    .line 733
    const/4 v1, 0x0

    .line 734
    .local v1, "exception":Ljava/lang/Exception;
    sget-object v0, Lcom/facebook/AuthorizationClient$Result$Code;->ERROR:Lcom/facebook/AuthorizationClient$Result$Code;

    .line 736
    .local v0, "code":Lcom/facebook/AuthorizationClient$Result$Code;
    if-eqz p4, :cond_3d

    .line 738
    const-string v4, "com.facebook.LoginActivity:Result"

    .line 737
    invoke-virtual {p4, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lcom/facebook/AuthorizationClient$Result;

    .line 739
    .local v2, "result":Lcom/facebook/AuthorizationClient$Result;
    if-eqz v2, :cond_33

    .line 741
    invoke-direct {p0, p3, v2}, Lcom/facebook/Session;->handleAuthorizationResult(ILcom/facebook/AuthorizationClient$Result;)V

    goto :goto_1b

    .line 727
    .end local v0    # "code":Lcom/facebook/AuthorizationClient$Result$Code;
    .end local v1    # "exception":Ljava/lang/Exception;
    .end local v2    # "result":Lcom/facebook/AuthorizationClient$Result;
    :catchall_30
    move-exception v3

    :try_start_31
    monitor-exit v4
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v3

    .line 743
    .restart local v0    # "code":Lcom/facebook/AuthorizationClient$Result$Code;
    .restart local v1    # "exception":Ljava/lang/Exception;
    .restart local v2    # "result":Lcom/facebook/AuthorizationClient$Result;
    :cond_33
    iget-object v4, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    if-eqz v4, :cond_48

    .line 745
    iget-object v4, p0, Lcom/facebook/Session;->authorizationClient:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v4, p2, p3, p4}, Lcom/facebook/AuthorizationClient;->onActivityResult(IILandroid/content/Intent;)Z

    goto :goto_1b

    .line 748
    .end local v2    # "result":Lcom/facebook/AuthorizationClient$Result;
    :cond_3d
    if-nez p3, :cond_48

    .line 749
    new-instance v1, Lcom/facebook/FacebookOperationCanceledException;

    .end local v1    # "exception":Ljava/lang/Exception;
    const-string v4, "User canceled operation."

    invoke-direct {v1, v4}, Lcom/facebook/FacebookOperationCanceledException;-><init>(Ljava/lang/String;)V

    .line 750
    .restart local v1    # "exception":Ljava/lang/Exception;
    sget-object v0, Lcom/facebook/AuthorizationClient$Result$Code;->CANCEL:Lcom/facebook/AuthorizationClient$Result$Code;

    .line 753
    :cond_48
    if-nez v1, :cond_51

    .line 754
    new-instance v1, Lcom/facebook/FacebookException;

    .end local v1    # "exception":Ljava/lang/Exception;
    const-string v4, "Unexpected call to Session.onActivityResult"

    invoke-direct {v1, v4}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 757
    .restart local v1    # "exception":Ljava/lang/Exception;
    :cond_51
    invoke-direct {p0, v0, v6, v1}, Lcom/facebook/Session;->logAuthorizationComplete(Lcom/facebook/AuthorizationClient$Result$Code;Ljava/util/Map;Ljava/lang/Exception;)V

    .line 758
    invoke-virtual {p0, v6, v1}, Lcom/facebook/Session;->finishAuthOrReauth(Lcom/facebook/AccessToken;Ljava/lang/Exception;)V

    goto :goto_1b
.end method

.method public final open(Lcom/facebook/AccessToken;Lcom/facebook/Session$StatusCallback;)V
    .registers 7
    .param p1, "accessToken"    # Lcom/facebook/AccessToken;
    .param p2, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 526
    iget-object v2, p0, Lcom/facebook/Session;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 527
    :try_start_3
    iget-object v1, p0, Lcom/facebook/Session;->pendingAuthorizationRequest:Lcom/facebook/Session$AuthorizationRequest;

    if-eqz v1, :cond_12

    .line 528
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 529
    const-string v3, "Session: an attempt was made to open a session that has a pending request."

    .line 528
    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 526
    :catchall_f
    move-exception v1

    monitor-exit v2
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v1

    .line 532
    :cond_12
    :try_start_12
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v1}, Lcom/facebook/SessionState;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 533
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 534
    const-string v3, "Session: an attempt was made to open a previously-closed session."

    .line 533
    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 535
    :cond_22
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    sget-object v3, Lcom/facebook/SessionState;->CREATED:Lcom/facebook/SessionState;

    if-eq v1, v3, :cond_36

    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    sget-object v3, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    if-eq v1, v3, :cond_36

    .line 536
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 537
    const-string v3, "Session: an attempt was made to open an already opened session."

    .line 536
    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 540
    :cond_36
    if-eqz p2, :cond_3b

    .line 541
    invoke-virtual {p0, p2}, Lcom/facebook/Session;->addCallback(Lcom/facebook/Session$StatusCallback;)V

    .line 544
    :cond_3b
    iput-object p1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 546
    iget-object v1, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    if-eqz v1, :cond_4a

    .line 547
    iget-object v1, p0, Lcom/facebook/Session;->tokenCachingStrategy:Lcom/facebook/TokenCachingStrategy;

    invoke-virtual {p1}, Lcom/facebook/AccessToken;->toCacheBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/facebook/TokenCachingStrategy;->save(Landroid/os/Bundle;)V

    .line 550
    :cond_4a
    iget-object v0, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 551
    .local v0, "oldState":Lcom/facebook/SessionState;
    sget-object v1, Lcom/facebook/SessionState;->OPENED:Lcom/facebook/SessionState;

    iput-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    .line 552
    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v3}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 526
    monitor-exit v2
    :try_end_57
    .catchall {:try_start_12 .. :try_end_57} :catchall_f

    .line 555
    invoke-direct {p0}, Lcom/facebook/Session;->autoPublishAsync()V

    .line 556
    return-void
.end method

.method public final openForPublish(Lcom/facebook/Session$OpenRequest;)V
    .registers 3
    .param p1, "openRequest"    # Lcom/facebook/Session$OpenRequest;

    .prologue
    .line 506
    sget-object v0, Lcom/facebook/internal/SessionAuthorizationType;->PUBLISH:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/Session;->open(Lcom/facebook/Session$OpenRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 507
    return-void
.end method

.method public final openForRead(Lcom/facebook/Session$OpenRequest;)V
    .registers 3
    .param p1, "openRequest"    # Lcom/facebook/Session$OpenRequest;

    .prologue
    .line 471
    sget-object v0, Lcom/facebook/internal/SessionAuthorizationType;->READ:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/Session;->open(Lcom/facebook/Session$OpenRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 472
    return-void
.end method

.method postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .registers 7
    .param p1, "oldState"    # Lcom/facebook/SessionState;
    .param p2, "newState"    # Lcom/facebook/SessionState;
    .param p3, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 1525
    if-ne p1, p2, :cond_9

    .line 1526
    sget-object v1, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    if-eq p1, v1, :cond_9

    .line 1527
    if-nez p3, :cond_9

    .line 1565
    :cond_8
    :goto_8
    return-void

    .line 1531
    :cond_9
    invoke-virtual {p2}, Lcom/facebook/SessionState;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1532
    invoke-static {}, Lcom/facebook/AccessToken;->createEmptyToken()Lcom/facebook/AccessToken;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 1538
    :cond_15
    new-instance v0, Lcom/facebook/Session$4;

    invoke-direct {v0, p0, p2, p3}, Lcom/facebook/Session$4;-><init>(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 1554
    .local v0, "runCallbacks":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/facebook/Session;->handler:Landroid/os/Handler;

    invoke-static {v1, v0}, Lcom/facebook/Session;->runWithHandlerOrExecutor(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 1556
    sget-object v1, Lcom/facebook/Session;->activeSession:Lcom/facebook/Session;

    if-ne p0, v1, :cond_8

    .line 1557
    invoke-virtual {p1}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v1

    invoke-virtual {p2}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v2

    if-eq v1, v2, :cond_8

    .line 1558
    invoke-virtual {p2}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 1559
    const-string v1, "com.facebook.sdk.ACTIVE_SESSION_OPENED"

    invoke-static {v1}, Lcom/facebook/Session;->postActiveSessionAction(Ljava/lang/String;)V

    goto :goto_8

    .line 1561
    :cond_39
    const-string v1, "com.facebook.sdk.ACTIVE_SESSION_CLOSED"

    invoke-static {v1}, Lcom/facebook/Session;->postActiveSessionAction(Ljava/lang/String;)V

    goto :goto_8
.end method

.method public final refreshPermissions()V
    .registers 3

    .prologue
    .line 609
    new-instance v0, Lcom/facebook/Request;

    const-string v1, "me/permissions"

    invoke-direct {v0, p0, v1}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;)V

    .line 610
    .local v0, "request":Lcom/facebook/Request;
    new-instance v1, Lcom/facebook/Session$2;

    invoke-direct {v1, p0}, Lcom/facebook/Session$2;-><init>(Lcom/facebook/Session;)V

    invoke-virtual {v0, v1}, Lcom/facebook/Request;->setCallback(Lcom/facebook/Request$Callback;)V

    .line 624
    invoke-virtual {v0}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    .line 625
    return-void
.end method

.method public final removeCallback(Lcom/facebook/Session$StatusCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 825
    iget-object v1, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    monitor-enter v1

    .line 826
    :try_start_3
    iget-object v0, p0, Lcom/facebook/Session;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 825
    monitor-exit v1

    .line 828
    return-void

    .line 825
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public final requestNewPublishPermissions(Lcom/facebook/Session$NewPermissionsRequest;)V
    .registers 3
    .param p1, "newPermissionsRequest"    # Lcom/facebook/Session$NewPermissionsRequest;

    .prologue
    .line 595
    sget-object v0, Lcom/facebook/internal/SessionAuthorizationType;->PUBLISH:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/Session;->requestNewPermissions(Lcom/facebook/Session$NewPermissionsRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 596
    return-void
.end method

.method public final requestNewReadPermissions(Lcom/facebook/Session$NewPermissionsRequest;)V
    .registers 3
    .param p1, "newPermissionsRequest"    # Lcom/facebook/Session$NewPermissionsRequest;

    .prologue
    .line 575
    sget-object v0, Lcom/facebook/internal/SessionAuthorizationType;->READ:Lcom/facebook/internal/SessionAuthorizationType;

    invoke-direct {p0, p1, v0}, Lcom/facebook/Session;->requestNewPermissions(Lcom/facebook/Session$NewPermissionsRequest;Lcom/facebook/internal/SessionAuthorizationType;)V

    .line 576
    return-void
.end method

.method setCurrentTokenRefreshRequest(Lcom/facebook/Session$TokenRefreshRequest;)V
    .registers 2
    .param p1, "request"    # Lcom/facebook/Session$TokenRefreshRequest;

    .prologue
    .line 1645
    iput-object p1, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    .line 1646
    return-void
.end method

.method setLastAttemptedTokenExtendDate(Ljava/util/Date;)V
    .registers 2
    .param p1, "lastAttemptedTokenExtendDate"    # Ljava/util/Date;

    .prologue
    .line 1641
    iput-object p1, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    .line 1642
    return-void
.end method

.method setTokenInfo(Lcom/facebook/AccessToken;)V
    .registers 2
    .param p1, "tokenInfo"    # Lcom/facebook/AccessToken;

    .prologue
    .line 1633
    iput-object p1, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    .line 1634
    return-void
.end method

.method shouldExtendAccessToken()Z
    .registers 7

    .prologue
    .line 1602
    iget-object v2, p0, Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;

    if-eqz v2, :cond_6

    .line 1603
    const/4 v1, 0x0

    .line 1616
    :cond_5
    :goto_5
    return v1

    .line 1606
    :cond_6
    const/4 v1, 0x0

    .line 1608
    .local v1, "result":Z
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 1610
    .local v0, "now":Ljava/util/Date;
    iget-object v2, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v2}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v2}, Lcom/facebook/AccessToken;->getSource()Lcom/facebook/AccessTokenSource;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/AccessTokenSource;->canExtendToken()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1611
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/facebook/Session;->lastAttemptedTokenExtendDate:Ljava/util/Date;

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x36ee80

    cmp-long v2, v2, v4

    if-lez v2, :cond_5

    .line 1612
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    invoke-virtual {v4}, Lcom/facebook/AccessToken;->getLastRefresh()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x5265c00

    cmp-long v2, v2, v4

    if-lez v2, :cond_5

    .line 1613
    const/4 v1, 0x1

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 832
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{Session"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " state:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/Session;->state:Lcom/facebook/SessionState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", token:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 833
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    if-nez v0, :cond_42

    const-string v0, "null"

    :goto_23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 834
    iget-object v0, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    if-nez v0, :cond_45

    const-string v0, "null"

    :goto_33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 832
    return-object v0

    .line 833
    :cond_42
    iget-object v0, p0, Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;

    goto :goto_23

    .line 834
    :cond_45
    iget-object v0, p0, Lcom/facebook/Session;->applicationId:Ljava/lang/String;

    goto :goto_33
.end method
