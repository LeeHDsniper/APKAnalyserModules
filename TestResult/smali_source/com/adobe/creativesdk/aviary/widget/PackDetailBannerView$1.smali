.class Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;
.super Ljava/lang/Object;
.source "PackDetailBannerView.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

.field final synthetic val$file:Ljava/io/File;

.field final synthetic val$loadPalette:Z

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;JLjava/io/File;Z)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$packId:J

    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$file:Ljava/io/File;

    iput-boolean p5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$loadPalette:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 4

    .prologue
    .line 191
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "failed to load local detail image"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 192
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "trying to delete current invalid file.."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackDetailPath:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$502(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$file:Ljava/io/File;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$loadPalette:Z

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$600(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;Z)V

    .line 201
    :goto_2f
    return-void

    .line 199
    :cond_30
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadPackIcon()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$700(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V

    goto :goto_2f
.end method

.method public onSuccess()V
    .registers 7

    .prologue
    const/4 v1, 0x1

    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->isValidContext()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$000(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->val$packId:J

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPackId:J
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_4a

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getDisplayedChild()I

    move-result v0

    if-eq v0, v1, :cond_47

    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setHideBeforeReveal(Z)V

    .line 181
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mIconLoaded:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$200(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z

    move-result v0

    if-nez v0, :cond_3a

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mFadeDetailImage:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$300(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Z

    move-result v0

    if-eqz v0, :cond_48

    :cond_3a
    move v0, v1

    :goto_3b
    invoke-virtual {v2, v1, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setDisplayedChild(IZ)V

    .line 182
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "detail image loaded"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 187
    :cond_47
    :goto_47
    return-void

    .line 181
    :cond_48
    const/4 v0, 0x0

    goto :goto_3b

    .line 185
    :cond_4a
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$400()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "invalid context or invalid packId"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_47
.end method
