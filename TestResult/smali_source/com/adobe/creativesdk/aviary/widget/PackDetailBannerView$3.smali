.class Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;
.super Ljava/lang/Object;
.source "PackDetailBannerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->onIconLoaded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 266
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->mPalette:Landroid/support/v7/graphics/Palette;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$900(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;)Landroid/support/v7/graphics/Palette;

    move-result-object v0

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_b
    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->loadDetailImage(Z)V
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->access$600(Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;Z)V

    .line 267
    return-void

    .line 266
    :cond_f
    const/4 v0, 0x0

    goto :goto_b
.end method
