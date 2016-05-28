.class public Lcom/adobe/creativesdk/behance/AdobeBehanceSDKAbstractPublishOptions;
.super Ljava/lang/Object;
.source "AdobeBehanceSDKAbstractPublishOptions.java"


# instance fields
.field private mBehanceSDKAbstractPublishOptions:Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;)V
    .registers 2
    .param p1, "options"    # Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKAbstractPublishOptions;->mBehanceSDKAbstractPublishOptions:Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;

    .line 20
    return-void
.end method


# virtual methods
.method protected getBehanceSDKPublishOptions()Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKAbstractPublishOptions;->mBehanceSDKAbstractPublishOptions:Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;

    return-object v0
.end method
