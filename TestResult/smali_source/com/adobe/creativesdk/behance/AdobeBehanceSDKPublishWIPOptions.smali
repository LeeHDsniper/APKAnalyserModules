.class public Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;
.super Lcom/adobe/creativesdk/behance/AdobeBehanceSDKAbstractPublishOptions;
.source "AdobeBehanceSDKPublishWIPOptions.java"


# instance fields
.field private mBehanceSDKPublishWIPOptions:Lcom/behance/sdk/BehanceSDKPublishWIPOptions;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "wipRevisionImageFile"    # Ljava/io/File;

    .prologue
    .line 21
    new-instance v0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    invoke-direct {v0, p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKAbstractPublishOptions;-><init>(Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;)V

    .line 22
    invoke-virtual {p0}, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;->getBehanceSDKPublishOptions()Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    iput-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;->mBehanceSDKPublishWIPOptions:Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    .line 24
    return-void
.end method


# virtual methods
.method protected getPublishWIPWorkflowOptions()Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;->mBehanceSDKPublishWIPOptions:Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    return-object v0
.end method
