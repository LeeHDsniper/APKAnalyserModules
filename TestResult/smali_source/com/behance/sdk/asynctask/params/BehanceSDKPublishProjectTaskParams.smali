.class public Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKPublishProjectTaskParams.java"


# instance fields
.field private projectID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getProjectId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;->projectID:Ljava/lang/String;

    return-object v0
.end method
