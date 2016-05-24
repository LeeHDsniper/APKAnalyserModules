.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;
.super Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PreviewEffectViewHolder"
.end annotation


# instance fields
.field textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 434
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;-><init>(Landroid/view/View;)V

    .line 435
    return-void
.end method


# virtual methods
.method protected initialize(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 439
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->title:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;->textView:Landroid/widget/TextView;

    .line 440
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;->imageView:Landroid/widget/ImageView;

    .line 441
    return-void
.end method
