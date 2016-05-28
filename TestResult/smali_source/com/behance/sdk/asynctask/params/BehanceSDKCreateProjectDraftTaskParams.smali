.class public Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKCreateProjectDraftTaskParams.java"


# instance fields
.field private options:Lcom/behance/sdk/BehanceSDKProjectDraftOptions;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getBehanceSDKProjectDraftOptions()Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;->options:Lcom/behance/sdk/BehanceSDKProjectDraftOptions;

    return-object v0
.end method
