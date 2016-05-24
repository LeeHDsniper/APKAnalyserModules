.class public Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticatorService;
.super Landroid/app/Service;
.source "AdobeCSDKAdobeIDAuthenticatorService.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method private initializeAuthenticatorService()V
    .registers 1

    .prologue
    .line 23
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 28
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;-><init>(Landroid/content/Context;)V

    .line 29
    .local v0, "authenticator":Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticator;->getIBinder()Landroid/os/IBinder;

    move-result-object v1

    return-object v1
.end method

.method public onCreate()V
    .registers 1

    .prologue
    .line 14
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 16
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/authenticator/AdobeCSDKAdobeIDAuthenticatorService;->initializeAuthenticatorService()V

    .line 17
    return-void
.end method
