.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "StickersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StickerViewHolder"
.end annotation


# instance fields
.field public identifier:Ljava/lang/String;

.field final imageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 1338
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1339
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerViewHolder;->imageView:Landroid/widget/ImageView;

    .line 1340
    return-void
.end method
