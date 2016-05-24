.class public Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
.super Ljava/lang/Object;
.source "AdobeUXAuthManagerRestricted.java"


# static fields
.field private static _accessGroupAccountTypeForSSO:Ljava/lang/String;

.field public static mMockTestMode:Z

.field private static sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;


# instance fields
.field private _authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 50
    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    .line 52
    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_accessGroupAccountTypeForSSO:Ljava/lang/String;

    .line 73
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->mMockTestMode:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 57
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 58
    return-void
.end method

.method public static getAccessGroupAccountType()Ljava/lang/String;
    .registers 1

    .prologue
    .line 298
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_accessGroupAccountTypeForSSO:Ljava/lang/String;

    return-object v0
.end method

.method public static getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    if-nez v0, :cond_b

    .line 68
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    .line 70
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    return-object v0
.end method


# virtual methods
.method public checkAndCallErrorIfInvalidAccessToken(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Ljava/lang/String;)Z
    .registers 7
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;>;"
    const/4 v1, 0x0

    .line 318
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->mMockTestMode:Z

    if-eqz v2, :cond_6

    .line 333
    :cond_5
    :goto_5
    return v1

    .line 322
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->hasValidAccessToken()Z

    move-result v0

    .line 324
    .local v0, "authenticated":Z
    if-nez v0, :cond_18

    .line 326
    if-eqz p1, :cond_1c

    .line 327
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {p1, v2}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 333
    :cond_18
    :goto_18
    if-nez v0, :cond_5

    const/4 v1, 0x1

    goto :goto_5

    .line 329
    :cond_1c
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_18
.end method

.method public checkAndCallErrorIfNotAuthenticated(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Ljava/lang/String;)Z
    .registers 7
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;>;"
    const/4 v1, 0x0

    .line 337
    sget-boolean v2, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->mMockTestMode:Z

    if-eqz v2, :cond_6

    .line 349
    :cond_5
    :goto_5
    return v1

    .line 341
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAuthenticated()Z

    move-result v0

    .line 342
    .local v0, "authenticated":Z
    if-nez v0, :cond_18

    .line 343
    if-eqz p1, :cond_1c

    .line 344
    new-instance v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v3, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CREDENTIALS_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {p1, v2}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 349
    :cond_18
    :goto_18
    if-nez v0, :cond_5

    const/4 v1, 0x1

    goto :goto_5

    .line 346
    :cond_1c
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_18
.end method

.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    return-object v0
.end method

.method public hasValidAccessToken()Z
    .registers 5

    .prologue
    .line 312
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->willAccessTokenBeValidIn(J)Z

    move-result v0

    return v0
.end method

.method public isAdobeApplication()Z
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAdobeApplication()Z

    move-result v0

    return v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v0

    return v0
.end method

.method public login(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V
    .registers 3
    .param p1, "sessionLauncher"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->login(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V

    .line 84
    return-void
.end method

.method public logout()V
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->logout()V

    .line 93
    return-void
.end method

.method public reAuthenticate()Z
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->_authManagerImpl:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->reAuthenticate()Z

    move-result v0

    return v0
.end method
