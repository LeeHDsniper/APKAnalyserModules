.class public Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKGetUserWIPsTaskParams.java"


# instance fields
.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getUserId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->userId:Ljava/lang/String;

    .line 35
    return-void
.end method
