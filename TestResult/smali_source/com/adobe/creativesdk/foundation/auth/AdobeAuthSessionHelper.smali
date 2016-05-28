.class public Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;
.super Ljava/lang/Object;
.source "AdobeAuthSessionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;,
        Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$AdobeAuthStatus;
    }
.end annotation


# instance fields
.field private _authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field _loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

.field _logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

.field _statusCallback:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;

.field private _storedData:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;)V
    .registers 4
    .param p1, "statusCallback"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;

    .prologue
    const/4 v1, 0x0

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_statusCallback:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;

    .line 162
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 163
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_storedData:Landroid/content/Intent;

    .line 164
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    .line 165
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .line 174
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_statusCallback:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$IAdobeAuthStatusCallback;

    .line 176
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$1;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .line 195
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper$2;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    .line 213
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 301
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getCurrentAuthSessionLauncher()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    move-result-object v0

    .line 302
    .local v0, "launcher":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->getRequestCode()I

    move-result v1

    if-ne v1, p1, :cond_10

    .line 304
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_storedData:Landroid/content/Intent;

    .line 306
    :cond_10
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 222
    return-void
.end method

.method public onPause()V
    .registers 3

    .prologue
    .line 266
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setCurrentActivity(Landroid/app/Activity;)V

    .line 269
    return-void
.end method

.method public onResume()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    .line 231
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V

    .line 232
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    .line 234
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->hasValidAccessToken()Z

    move-result v2

    if-nez v2, :cond_1f

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->canRefreshAccessToken()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 236
    :cond_1f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;->onSuccess(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;)V

    .line 259
    :goto_2a
    return-void

    .line 240
    :cond_2b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_storedData:Landroid/content/Intent;

    if-eqz v2, :cond_57

    .line 242
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_storedData:Landroid/content/Intent;

    const-string v3, "AdobeAuthErrorCode"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 243
    .local v1, "errorCode":I
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_storedData:Landroid/content/Intent;

    .line 244
    if-eq v1, v4, :cond_4b

    .line 246
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->fromInt(I)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    .line 247
    .local v0, "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_2a

    .line 251
    .end local v0    # "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    :cond_4b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_loginClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_authManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;->onSuccess(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;)V

    goto :goto_2a

    .line 256
    .end local v1    # "errorCode":I
    :cond_57
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionHelper;->_logoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;->onSuccess()V

    goto :goto_2a
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 277
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 285
    return-void
.end method
