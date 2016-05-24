.class public final Lcom/facebook/Session$NewPermissionsRequest;
.super Lcom/facebook/Session$AuthorizationRequest;
.source "Session.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NewPermissionsRequest"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# virtual methods
.method getAuthorizationClientRequest()Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .registers 3

    .prologue
    .line 2309
    invoke-super {p0}, Lcom/facebook/Session$AuthorizationRequest;->getAuthorizationClientRequest()Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    move-result-object v0

    .line 2310
    .local v0, "request":Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->setRerequest(Z)V

    .line 2311
    return-object v0
.end method

.method public bridge synthetic setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$AuthorizationRequest;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/facebook/Session$NewPermissionsRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$NewPermissionsRequest;

    move-result-object v0

    return-object v0
.end method

.method public final setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$NewPermissionsRequest;
    .registers 2
    .param p1, "statusCallback"    # Lcom/facebook/Session$StatusCallback;

    .prologue
    .line 2265
    invoke-super {p0, p1}, Lcom/facebook/Session$AuthorizationRequest;->setCallback(Lcom/facebook/Session$StatusCallback;)Lcom/facebook/Session$AuthorizationRequest;

    .line 2266
    return-object p0
.end method

.method public bridge synthetic setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$AuthorizationRequest;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/facebook/Session$NewPermissionsRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$NewPermissionsRequest;

    move-result-object v0

    return-object v0
.end method

.method public final setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$NewPermissionsRequest;
    .registers 2
    .param p1, "defaultAudience"    # Lcom/facebook/SessionDefaultAudience;

    .prologue
    .line 2303
    invoke-super {p0, p1}, Lcom/facebook/Session$AuthorizationRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$AuthorizationRequest;

    .line 2304
    return-object p0
.end method

.method public bridge synthetic setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$AuthorizationRequest;
    .registers 3

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/facebook/Session$NewPermissionsRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$NewPermissionsRequest;

    move-result-object v0

    return-object v0
.end method

.method public final setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$NewPermissionsRequest;
    .registers 2
    .param p1, "loginBehavior"    # Lcom/facebook/SessionLoginBehavior;

    .prologue
    .line 2278
    invoke-super {p0, p1}, Lcom/facebook/Session$AuthorizationRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$AuthorizationRequest;

    .line 2279
    return-object p0
.end method
