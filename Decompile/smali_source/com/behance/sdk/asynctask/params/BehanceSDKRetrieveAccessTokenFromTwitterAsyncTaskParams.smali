.class public Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams.java"


# instance fields
.field private authURL:Ljava/lang/String;

.field private consumerKey:Ljava/lang/String;

.field private consumerSecret:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getAuthURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 10
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->authURL:Ljava/lang/String;

    return-object v0
.end method

.method public getConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->consumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->consumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public setAuthURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "authURL"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->authURL:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public setConsumerKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "consumerKey"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->consumerKey:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setConsumerSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->consumerSecret:Ljava/lang/String;

    .line 31
    return-void
.end method
