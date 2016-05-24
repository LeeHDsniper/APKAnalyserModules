.class public Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKGetAuthURLFromTwitterAsyncTaskParams.java"


# instance fields
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
.method public getConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 9
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->consumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->consumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public setConsumerKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "consumerKey"    # Ljava/lang/String;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->consumerKey:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public setConsumerSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->consumerSecret:Ljava/lang/String;

    .line 22
    return-void
.end method
