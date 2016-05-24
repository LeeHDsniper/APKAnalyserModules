.class abstract Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "PreviewViewHolder"
.end annotation


# instance fields
.field protected imageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 459
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 460
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;->initialize(Landroid/view/View;)V

    .line 461
    return-void
.end method


# virtual methods
.method public getImageView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;->imageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method protected abstract initialize(Landroid/view/View;)V
.end method
