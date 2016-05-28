.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewStickerViewHolder;
.super Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PreviewStickerViewHolder"
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 446
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;-><init>(Landroid/view/View;)V

    .line 447
    return-void
.end method


# virtual methods
.method protected initialize(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 451
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "itemView":Landroid/view/View;
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewStickerViewHolder;->imageView:Landroid/widget/ImageView;

    .line 452
    return-void
.end method
