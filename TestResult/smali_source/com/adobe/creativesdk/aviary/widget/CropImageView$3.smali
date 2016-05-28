.class Lcom/adobe/creativesdk/aviary/widget/CropImageView$3;
.super Ljava/lang/Object;
.source "CropImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
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
    .line 195
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 198
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->updateCropView(Z)V

    .line 199
    return-void
.end method
