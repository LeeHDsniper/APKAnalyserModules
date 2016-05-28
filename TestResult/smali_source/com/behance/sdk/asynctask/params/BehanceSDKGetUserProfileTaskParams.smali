.class public Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKGetUserProfileTaskParams.java"


# instance fields
.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getUserId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 11
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->userId:Ljava/lang/String;

    .line 16
    return-void
.end method
