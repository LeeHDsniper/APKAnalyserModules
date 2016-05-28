.class public Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.super Ljava/lang/Object;
.source "BehanceSDKAbstractTaskParams.java"


# instance fields
.field private clientID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getClientId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;->clientID:Ljava/lang/String;

    return-object v0
.end method

.method public setClientId(Ljava/lang/String;)V
    .registers 2
    .param p1, "clientID"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;->clientID:Ljava/lang/String;

    .line 30
    return-void
.end method
