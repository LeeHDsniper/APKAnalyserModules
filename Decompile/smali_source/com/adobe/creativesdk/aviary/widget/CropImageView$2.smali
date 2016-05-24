.class Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;
.super Ljava/lang/Object;
.source "CropImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onConfigurationChanged(Landroid/content/res/Configuration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatioIsFixed()Z

    move-result v1

    invoke-virtual {v0, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setAspectRatio(DZ)V

    .line 177
    return-void
.end method
