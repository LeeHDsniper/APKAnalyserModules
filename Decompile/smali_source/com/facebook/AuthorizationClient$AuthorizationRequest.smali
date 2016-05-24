.class Lcom/facebook/AuthorizationClient$AuthorizationRequest;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AuthorizationRequest"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final applicationId:Ljava/lang/String;

.field private final authId:Ljava/lang/String;

.field private final defaultAudience:Lcom/facebook/SessionDefaultAudience;

.field private isLegacy:Z

.field private isRerequest:Z

.field private final loginBehavior:Lcom/facebook/SessionLoginBehavior;

.field private permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final previousAccessToken:Ljava/lang/String;

.field private final requestCode:I

.field private final transient startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;


# direct methods
.method constructor <init>(Lcom/facebook/SessionLoginBehavior;IZLjava/util/List;Lcom/facebook/SessionDefaultAudience;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/AuthorizationClient$StartActivityDelegate;Ljava/lang/String;)V
    .registers 11
    .param p1, "loginBehavior"    # Lcom/facebook/SessionLoginBehavior;
    .param p2, "requestCode"    # I
    .param p3, "isLegacy"    # Z
    .param p5, "defaultAudience"    # Lcom/facebook/SessionDefaultAudience;
    .param p6, "applicationId"    # Ljava/lang/String;
    .param p7, "validateSameFbidAsToken"    # Ljava/lang/String;
    .param p8, "startActivityDelegate"    # Lcom/facebook/AuthorizationClient$StartActivityDelegate;
    .param p9, "authId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/SessionLoginBehavior;",
            "IZ",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/SessionDefaultAudience;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/AuthorizationClient$StartActivityDelegate;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p4, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 951
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 943
    iput-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    .line 949
    iput-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isRerequest:Z

    .line 954
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->loginBehavior:Lcom/facebook/SessionLoginBehavior;

    .line 955
    iput p2, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->requestCode:I

    .line 956
    iput-boolean p3, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    .line 957
    iput-object p4, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    .line 958
    iput-object p5, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->defaultAudience:Lcom/facebook/SessionDefaultAudience;

    .line 959
    iput-object p6, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->applicationId:Ljava/lang/String;

    .line 960
    iput-object p7, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    .line 961
    iput-object p8, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    .line 962
    iput-object p9, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->authId:Ljava/lang/String;

    .line 963
    return-void
.end method


# virtual methods
.method getApplicationId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 990
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->applicationId:Ljava/lang/String;

    return-object v0
.end method

.method getAuthId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1010
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->authId:Ljava/lang/String;

    return-object v0
.end method

.method getDefaultAudience()Lcom/facebook/SessionDefaultAudience;
    .registers 2

    .prologue
    .line 986
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->defaultAudience:Lcom/facebook/SessionDefaultAudience;

    return-object v0
.end method

.method getLoginBehavior()Lcom/facebook/SessionLoginBehavior;
    .registers 2

    .prologue
    .line 978
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->loginBehavior:Lcom/facebook/SessionLoginBehavior;

    return-object v0
.end method

.method getPermissions()Ljava/util/List;
    .registers 2
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
    .line 970
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    return-object v0
.end method

.method getPreviousAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1002
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    return-object v0
.end method

.method getRequestCode()I
    .registers 2

    .prologue
    .line 982
    iget v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->requestCode:I

    return v0
.end method

.method getStartActivityDelegate()Lcom/facebook/AuthorizationClient$StartActivityDelegate;
    .registers 2

    .prologue
    .line 966
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/AuthorizationClient$StartActivityDelegate;

    return-object v0
.end method

.method isLegacy()Z
    .registers 2

    .prologue
    .line 994
    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    return v0
.end method

.method isRerequest()Z
    .registers 2

    .prologue
    .line 1014
    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isRerequest:Z

    return v0
.end method

.method needsNewTokenValidation()Z
    .registers 2

    .prologue
    .line 1006
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->previousAccessToken:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isLegacy:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method setPermissions(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 974
    .local p1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->permissions:Ljava/util/List;

    .line 975
    return-void
.end method

.method setRerequest(Z)V
    .registers 2
    .param p1, "isRerequest"    # Z

    .prologue
    .line 1018
    iput-boolean p1, p0, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isRerequest:Z

    .line 1019
    return-void
.end method
