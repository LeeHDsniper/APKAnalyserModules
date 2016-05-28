.class Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;
.super Ljava/lang/Object;
.source "PackDetailBannerView.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadPackIcon()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;J)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->val$packId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 3

    .prologue
    .line 254
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "onError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 255
    return-void
.end method

.method public onSuccess()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 241
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->val$packId:J

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_17

    .line 242
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "different packId"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 250
    :goto_16
    return-void

    .line 246
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getDisplayedChild()I

    move-result v0

    if-eqz v0, :cond_24

    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v0, v4, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setDisplayedChild(IZ)V

    .line 249
    :cond_24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->onIconLoaded()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$800(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V

    goto :goto_16
.end method
